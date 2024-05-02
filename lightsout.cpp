#include <bits/stdc++.h>
using namespace std;

const int oo = 1e9;

using ll = long long;
using ii = pair<int, int>;
using edge = tuple<int, int, int>;
typedef vector<int> vi;
#define pb push_back
#define ln "\n"

vector<string> matrix;
map<string, string> predicates{
    {"W", "is-off "},
    {"R", "is-red "},
    {"G", "is-green "},
    {"B", "is-blue "},
};

int main() {
  ios::sync_with_stdio(0);
  cin.tie(0);

  string row;

  while (cin >> row) matrix.pb(row);

  FILE *problem = fopen("problem.pddl", "w"),
       *domain = fopen("domain.pddl", "w");

  fprintf(problem,
          "(define (problem lights-out)\n\t(:domain lights-out)\n\t(:objects");

  int m_lenght = matrix.size();
  for (int i = 0; i < m_lenght; i++)
    for (int j = 0; j < matrix[i].size() / 2; j++)
      fprintf(problem, " p%d-%d", i, j);

  fprintf(problem, " - position)\n\t(:init\n");

  fclose(domain), fclose(problem);
  system("/home/software/planners/madagascar/M -Q domain.pddl problem.pddl");

  return 0;
}
