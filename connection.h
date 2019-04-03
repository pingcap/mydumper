/*
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

    Authors:        Aaron Brady, Shopify (insom)
*/
#ifndef _connection_h
#define _connection_h
#include <mysql.h>

void configure_connection(MYSQL *conn, const char* name);
void pre_resolve_host(const char *host);
MYSQL *mysql_connect_wrap(MYSQL *mysql, const char *user, const char *passwd, const char *db, unsigned int port,
                          const char *unix_socket, unsigned long client_flag);
#endif
