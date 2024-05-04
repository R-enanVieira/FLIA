#include <bits/stdc++.h>

#include <fstream>
using namespace std;

const int oo = 1e9;

using ll = long long;
using ii = pair<int, int>;
using edge = tuple<int, int, int>;
typedef vector<int> vi;
#define pb push_back
#define ln "\n"

vector<string> matrix;
map<char, string> predicates{
    {'W', "is-off"},
    {'R', "is-red"},
    {'G', "is-green"},
    {'B', "is-blue"},
};
map<char, string> button_types{
    {'*', "is-static"},
    {'|', "is-static-h"},
    {'_', "is-static-v"},
    {'#', "is-static-hv"},
};

int main() {
  ios::sync_with_stdio(0);
  cin.tie(0);

  string row;
  int t = 0;

  while (cin >> row) {
    matrix.pb(row);
  }

  FILE *problem = fopen("problem.pddl", "w"),
       *domain = fopen("domain.pddl", "w");

  fprintf(problem,
          "(define (problem lights-out)\n\t(:domain lights-out)\n\t(:objects");

  // definindo objetos
  int m_lenght = matrix.size();
  for (int i = 0; i < m_lenght; i++)
    for (int j = 0; j < matrix[i].size() / 2; j++)
      fprintf(problem, " p%d-%d", i, j);

  fprintf(problem, " - position)\n\t(:init\n\t\t");

  // definindo relação de rows
  int k = 0;
  for (auto s : matrix) {
    for (int i = 0; i < s.size() / 2; i++) {
      for (int j = 0; j < s.size() / 2; j++) {
        if (i == j) continue;
        fprintf(problem, "(same-row p%d-%d p%d-%d) ", k, i, k, j);
      }
      fprintf(problem, "\n\t\t");
    }
    k++;
  }
  fprintf(problem, "\n\t\t");

  // definindo relação de colunas
  k = 0;
  for (auto s : matrix) {
    for (int i = 0; i < s.size() / 2; i++) {
      for (int j = 0; j < s.size() / 2; j++) {
        if (i == j) continue;
        fprintf(problem, "(same-column p%d-%d p%d-%d) ", i, k, j, k);
      }
      fprintf(problem, "\n\t\t");
    }
    k++;
  }
  fprintf(problem, "\n");

  // definindo cores
  for (int i = 0; i < m_lenght; i++) {
    k = 1;
    for (int j = 0; j < matrix[i].size() / 2; j++) {
      fprintf(problem, "\t\t(%s p%d-%d)\n", predicates.at(matrix[i][k]).c_str(),
              i, j);
      k += 2;
    }
  }

  fprintf(problem, "\n");

  // definindo botões
  for (int i = 0; i < m_lenght; i++) {
    k = 0;
    for (int j = 0; j < matrix[i].size() / 2; j++) {
      if (matrix[i][k] != '-')
        fprintf(problem, "\t\t(%s p%d-%d)\n",
                button_types.at(matrix[i][k]).c_str(), i, j);
      k += 2;
    }
  }

  fprintf(problem, "\n");

  // definindo o objetivo
  fprintf(problem, "\t)\n\n\t(:goal (and");
  for (int i = 0; i < m_lenght; i++)
    for (int j = 0; j < matrix[i].size() / 2; j++)
      fprintf(problem, " (is-off p%d-%d)", i, j);

  fprintf(problem, ")))\n");

  fprintf(domain,
          "(define (domain lights-out)\n"
          " (:requirements :strips :typing :equality :negative-preconditions "
          ":disjunctive-preconditions)\n"
          " (:types position)\n"
          " (:predicates\n"
          "  (same-row ?xy1 ?xy2 - position)\n"
          "  (same-column ?xy1 ?xy2 - position)\n"
          "  (is-off ?xy - position)\n"
          "  (is-red ?xy - position)\n"
          "  (is-green ?xy - position)\n"
          "  (is-blue ?xy - position)\n"
          "  (is-static ?xy - position)\n"
          "  (is-static-hv ?xy - position)\n"
          "  (is-static-v ?xy - position)\n"
          "  (is-static-h ?xy - position)\n"
          " )\n"
          " (:action click\n"
          "  :parameters (?xy - position)"
          "  :precondition (and)\n"
          "  :effect(and\n"
          "   (when\n"
          "    (not(is-static ?xy))\n"
          "    (and\n"
          "     (when\n"
          "      (is-off ?xy)\n"
          "      (and\n"
          "       (not(is-off ?xy))\n"
          "       (is-red ?xy)\n"
          "      )\n"
          "     )\n"
          "     (when\n"
          "      (is-red ?xy)\n"
          "      (and\n"
          "       (not(is-red ?xy))\n"
          "       (is-green ?xy)\n"
          "      )\n"
          "     )\n"
          "     (when\n"
          "      (is-green ?xy)\n"
          "      (and\n"
          "       (not(is-green ?xy))\n"
          "       (is-blue ?xy)\n"
          "      )\n"
          "     )\n"
          "     (when\n"
          "      (is-blue ?xy)\n"
          "      (and\n"
          "       (not(is-blue ?xy))\n"
          "       (is-off ?xy)\n"
          "      )\n"
          "     )\n"
          "    )\n"
          "   )\n"
          "   (forall\n"
          "    (?vw - position)\n"
          "    (and\n"
          "     (when\n"
          "      (and\n"
          "       (same-row ?xy ?vw)\n"
          "       (not(= ?xy ?vw))\n"
          "       (not (is-static-h ?vw))\n"
          "       (not (is-static-hv ?vw))\n"
          "      )\n"
          "      (and\n"
          "       (when\n"
          "        (is-off ?vw)\n"
          "        (and\n"
          "         (not(is-off ?vw))\n"
          "         (is-red ?vw)\n"
          "        )\n"
          "       )\n"
          "       (when\n"
          "        (is-red ?vw)\n"
          "        (and\n"
          "         (not(is-red ?vw))\n"
          "         (is-green ?vw)\n"
          "        )\n"
          "       )\n"
          "       (when\n"
          "        (is-green ?vw)\n"
          "        (and\n"
          "         (not(is-green ?vw))\n"
          "         (is-blue ?vw)\n"
          "        )\n"
          "       )\n"
          "       (when\n"
          "        (is-blue ?vw)\n"
          "        (and\n"
          "         (not(is-blue ?vw))\n"
          "         (is-off ?vw)\n"
          "        )\n"
          "       )\n"
          "      )\n"
          "     )\n"
          "     (when\n"
          "      (and\n"
          "       (same-column ?vw ?xy)\n"
          "       (not(= ?xy ?vw))\n"
          "       (not (is-static-v ?vw))\n"
          "       (not (is-static-hv ?vw))\n"
          "      )\n"
          "      (and\n"
          "       (when\n"
          "        (is-off ?vw)\n"
          "        (and\n"
          "         (not(is-off ?vw))\n"
          "         (is-red ?vw)\n"
          "        )\n"
          "       )\n"
          "       (when\n"
          "        (is-red ?vw)\n"
          "        (and\n"
          "         (not(is-red ?vw))\n"
          "         (is-green ?vw)\n"
          "        )\n"
          "       )\n"
          "       (when\n"
          "        (is-green ?vw)\n"
          "        (and\n"
          "         (not(is-green ?vw))\n"
          "         (is-blue ?vw)\n"
          "        )\n"
          "       )\n"
          "       (when\n"
          "        (is-blue ?vw)\n"
          "        (and\n"
          "         (not(is-blue ?vw))\n"
          "         (is-off ?vw)\n"
          "        )\n"
          "       )\n"
          "      )\n"
          "     )\n"
          "    )\n"
          "   )\n"
          "  )\n"
          " )\n"
          ")\n");
  fclose(domain), fclose(problem);
  system(
      "/tmp/dir/software/planners/madagascar/M -S 1 -Q -o plano.txt "
      "domain.pddl "
      "problem.pddl > /dev/null");

  ifstream arquivo("plano.txt");

  while (getline(arquivo, row)) {
    // Encontra a posição do primeiro parêntese
    size_t posInicio = row.find("(");
    if (posInicio != std::string::npos) {
      row = row.substr(posInicio);
      row.erase(remove(row.begin(), row.end(), 'p'), row.end());
      row.erase(std::remove_if(row.begin(), row.end(),
                               [](char c) {
                                 return !std::isalnum(c) && c != ' ' &&
                                        c != '(' && c != ')' && c != '-';
                               }),
                row.end());
      replace(row.begin(), row.end(), '-', ' ');
      // Imprime a row tratada na saída padrão
      if (arquivo.peek() == EOF)
        cout << row << "\n";
      else
        cout << row << ";";
    }
  }

  return 0;
}
