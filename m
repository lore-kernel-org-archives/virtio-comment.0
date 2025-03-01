Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD74A23F37C
	for <virtio-comment@lists.linux.dev>; Sat,  1 Mar 2025 06:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740809317; cv=fail; b=dS8Kd8dVL4UMg9yCpKfV6U7N1ofFzJ0Uxae7sPTg3fRhf4ZfP6VUBZqjWrFL65yVGCj+eTxscRhEVEaSWaAoAQL6gUGhuu8GyEXRQH0ySPWzMSeY7K39ooUFPEWbjSjZfr/JSGqSM2aJxUoBwFGZGmiBPzFjkmJL9+js/OFtFk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740809317; c=relaxed/simple;
	bh=uA4812vJk/wpZPwd7pxruSa0IYw7CMF4Q13JvWsr7qM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bsY/9UL7HYSdAKaOQqAo8Njed90r9YYJGrQRtfev3in+S+wL7lTh+yEbBP7h4vK9+7PVYA282S7lkfxYl99NLNKgNcqDxp6hq3ebdsqtIcneUnX8Glm5Uz5B7Qz2nXhFZVbPhrtTZP+bWBjLYmWq3+/jl4P7XDTY8cuHXXQQc+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qMwpv9LS; arc=fail smtp.client-ip=40.107.93.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qMwpv9LS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dgZVHSrpp7rqQyNoptrV3uU8qFQf+3d0HBpC/Yn3aIPcz+Y0FDZehuPHfnsUvKCTo39IGpgYnmsev2xDxEUFV4uO+t7C5QFQWK9h5O284MdjUAslxPwXz669HbdzxWhO2VjzB4VkkasiaCn581AA+aZHE3j7hURaKOQtuTkkJLjNUmpISzxVkSUVhs1CSdGVsLyJHkyDWq7eXHnYfJooZ+pi3K4ISti4eydA8/eJUG5hzFP6NrJtOrFTKiN1IxHZSMgIHUwjG4U8Vw+mqwfYQ9WdFFPJ3kHMH6ejTlhaXv2Cx668ZczTx5FPfEYCIYSSt7xCklb53S786sxemn2TKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZXmyOdzodE4wGjh4InhDA0Thx1QUpYc+W2eTsJd2KU=;
 b=eCUvr4yT/MtY5SevYM6l1Y04XP7+TQF+mwFFZe6HI+ai64OInxIFCTofjZkj64/kZ/tlnCsxaRzCTgOpEwpzS8gCsLI0RYj9g0oQHNr0Z2WzI6vziK5C4dHIrLJZbIuWYJg8qumCuNzI5GyPPdDKBijRsUQWTKc3X0saL4cGi76ue3nOAk4hIpAYGdLA2gcURjdhUE49TuLfHMEa4jJisGgrejBqt/u3XAJga2BNGk9t/aQH3HjAMmdi3LnDInZp0CT4pUPgHUFzqJ54dteIKWHaYs+9NSp7kSnqpG/lPBz8ZDy0zTx6reV/+bfe2W4nnlHlyfZE7km8HBtJXcZEWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZXmyOdzodE4wGjh4InhDA0Thx1QUpYc+W2eTsJd2KU=;
 b=qMwpv9LSPzoT6laLmE2/PdpPt5rBmoufY6SFRjxAWZHCWhVKzNpnK4Hcp8k+qAE0lLu8A0Vx3xKjeCmKnuK/CgakLbOULujKnfwKtl7bOMjzf/j8P9+/I44tLlhh0Booakye02RMayFBYoPHIvCAF1jIVgy5jvp+wRfMG3eCbDQW6vC0tos+Qbp+0jU1qrHKgGuXDM5GWy0vowCsGDDWlT8JrNsKMAQIDXy1b+Dk5CAXU3RAeGyaTfA7HAZF8YvRLhnZLQosEmzHXM8QAKu2m+lFjrEwXFZPdmpxPyguRAALrlmuNdFxsdKIhyaKbQ2LonFh4x+pMJObq/TqCtuX9Q==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by CY5PR12MB6527.namprd12.prod.outlook.com (2603:10b6:930:30::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.21; Sat, 1 Mar
 2025 06:08:33 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8489.021; Sat, 1 Mar 2025
 06:08:32 +0000
From: Parav Pandit <parav@nvidia.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
CC: "cohuck@redhat.com" <cohuck@redhat.com>, "mst@redhat.com" <mst@redhat.com>
Subject: RE: [PATCH v2] README.md: add example email for TC vote request
Thread-Topic: [PATCH v2] README.md: add example email for TC vote request
Thread-Index: AQHbiSi0F/PiR9KYTEiifalBBmaRybNdzkjg
Date: Sat, 1 Mar 2025 06:08:32 +0000
Message-ID:
 <CY8PR12MB71951BEE03E73E7CF1715A91DCCF2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250227150241.1274768-1-mvaralar@redhat.com>
In-Reply-To: <20250227150241.1274768-1-mvaralar@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|CY5PR12MB6527:EE_
x-ms-office365-filtering-correlation-id: 41fd3b15-d4b0-4292-26cd-08dd58877ecf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018|13003099007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?naHykwrVEpCHb8Z0YYzkz0yeLk+VUHPDxg0FtxlsuwleLooTa5x7pMmJrKkH?=
 =?us-ascii?Q?oZu9tXOhJjxD+vX4jx2kDxybN/WMNDwALnODRwp2VFxJWwrO7o+n7EQbXQuP?=
 =?us-ascii?Q?qpNCo4SiBnMlZQIhBUhY7Y9XTRvDP+3EO0H7n8m8sI5bbFPNG3xq7DRBGxEC?=
 =?us-ascii?Q?Oxa4Yc4MzzcpzY5fJPRisPeIktXXkj8+A8ylMa1Thvv5ZLe3cBNQBEIkmKiT?=
 =?us-ascii?Q?UvnwwpGpkzilkqyWLwUo7Z7Khl4H0nzdVXV1w6X2pyXgi4DJDGWPgDh3GzH5?=
 =?us-ascii?Q?85Q16nahr9Jjvga416B+asgOBL/fREkngTKl0OlnyF/glG0Tq85NwDNIE70V?=
 =?us-ascii?Q?2UjHJCsTv6iKQkpUeofc5NNFZqIoYqpoy3r5wB32ZuYFNmJ22yfyqlJPD2yY?=
 =?us-ascii?Q?qTS0yiipQdjjU6nKcS7EdwoTHDFB9wl80AbOR4VuL3BP7nu3dwQCRJb4yIrs?=
 =?us-ascii?Q?Msg962caNyNHTuy/NhFbIw1tLN/3gbm0dVQ58jjizgFRFfxEP3IkUWPLxGuA?=
 =?us-ascii?Q?Q+pxvf4AQzrTif86pw/F5zH0/kAkaBY2NK05gzEngCE53gfPPlOSUyVxxS44?=
 =?us-ascii?Q?0U+FXOfXJZKZKuVjwgKZx5/njPWI8QWN7PfnzFTV+4iuNcddJoKjIikIB3lj?=
 =?us-ascii?Q?7sYQBI3sJN/751O4TkDUXLrmF4+PDkEOGOh8g8G5NUzw0mofJqRGiD+NXMU9?=
 =?us-ascii?Q?zgN4J8hX1UWSdCekL7Bp0SFpFRbOFKZZHeHrFwlJrI5qxD2zyQSkyWCB5RX1?=
 =?us-ascii?Q?4Y2MEu4MybpMQoyMlgRFx63jfa7kq0xnRrwhxnl66KoTarKbzpCAXAw7Y4e0?=
 =?us-ascii?Q?NiuGLwKQPG3JBh3qGYu6xIo9BDTDwux1p5eilsxbsq+HqAaz3ngRhWO3A3Kj?=
 =?us-ascii?Q?dXkC9bH4Io+3QiI70Q0Yemg/GBHGsHkXuOT4Kk2O0qgSYzRI2aOS4ggDHGt3?=
 =?us-ascii?Q?q9opuI0GrFoByVIIhkvNnPeGB7JtGa11FD4D6Wfpid0syVkorIUyWfefVy9R?=
 =?us-ascii?Q?mLGRNU9WW/pu/7BSAV/h3CcYuJDwfjdeT3VDHNOzhvn9wgNBaj/ukRCjRbys?=
 =?us-ascii?Q?Fejlc5CaDs4t4inXqokaBqBPA6bUmdfFSk3nDpvV8ieM5OAPMLpeIxncNJLd?=
 =?us-ascii?Q?cxdznIkEmbZUQT44FFBDLzsCuBbWMg00IKboWndF7PQFhujyMHDtw73x4XCa?=
 =?us-ascii?Q?r+jcxLZXoiEzhOATuRR70Z/dKdoDI2I8slriIUEmPQyCzBGYF16oBPGC/ENi?=
 =?us-ascii?Q?vpqqeZucGFa6pnEf2PVtEGSl0CxTh4CMMcOYO1QA6ofbDzXUD5lMXkdKJ0SA?=
 =?us-ascii?Q?8zFIdBJCarGRiQSiIT7K6gqZOA3nnO0u/pRKBGlbl6lX+7c3xjCRcpzKX+Ow?=
 =?us-ascii?Q?23K4YPnrsNG5Yh0ByuxZf4B4I5dZlGdlull5PfHXpDQCRxvlUrSxuHpZs4+o?=
 =?us-ascii?Q?GTKQ9E36gmRPbgiT1KOM66lJH0vMVMM9?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?FR7PmUI8ZeUrKCQGjCkKu1xaea/1lKiIbPM78HhjKVpqeikcAWZaSmbNsFDb?=
 =?us-ascii?Q?cmQFd7f6lJaI/4uB7pJ9xFZIfKgB9cJSyhpT353KbCKaPRPcrUvMovcSYIvr?=
 =?us-ascii?Q?Hadl8dGVARkeWsabWxzu9e5K2CMPQoeY80XS5vD2GF0HB78nfI7m3HhAH2XM?=
 =?us-ascii?Q?54fy5zubldu9qQPOmnVSYg8HcLY8aXE0oRgaPEFuR9EP7+wBaVTJKyQL5C/G?=
 =?us-ascii?Q?yvT80TGtio3f27m/WGLecKGkA/XAmuUaXxlVszXGYpUS9gHygVR1ad8xwEeM?=
 =?us-ascii?Q?yF0dQUK1kUaYlpun+NZGYzn5daeeRpsin9mJSdwWO9P+JUUa3Pw5g6YMB6mc?=
 =?us-ascii?Q?E//t9oAJvrCu5CYJryMmWsEqwSKgWEKLJzX+Fthahnlqgx1HJXqPZMDt+Dr9?=
 =?us-ascii?Q?sDQMfkgOLzjLndnbJFpQZ8aQsJzf+JfayJqj/Kon1KYBnLsyn4Up48r1lZDz?=
 =?us-ascii?Q?CeYQYi1MTQ1Getbg91qUVcXZVQm/FDJBWx0PVh+i8+5HRQOB0GlwqLVMepg4?=
 =?us-ascii?Q?dwXBSZqW+GYXgPiEYHQe7yGB+kJL99FRTD1M95Ul4M4A+y3Sn4EqXS8ABrhk?=
 =?us-ascii?Q?VOaUss3KWU4o7RQkAN55N96sLGgdgtTeNHTDamhxqIOW3EXh59uxx0JaCVl3?=
 =?us-ascii?Q?Hy3suzO4IJpym30HLUH8AXsJM19L8ohaoiMGHtoFqHzvYamS6LxWLhzueBQZ?=
 =?us-ascii?Q?qE3M+OJOQZ6JBEsVp/SU0vSDzV+ui0AV2NsrP65lEJSNttcOAd9Qp7ziPbXV?=
 =?us-ascii?Q?zqiq4oIyqLvuDhTjBI9dRfmNFbpev75zjuDLJ0haLmazGgrH50rW6s4nChIQ?=
 =?us-ascii?Q?BWGwNoNtX71oXTmQpgoHoS5LHtVchRo4hMN0rMLsNVuRM4tHzjbxV6o5z2Tu?=
 =?us-ascii?Q?g+rRP8tzDr99SedathIZaNWNE1E+QqnNJP/H0juKaFvqicgC7i88y+DLZZH5?=
 =?us-ascii?Q?fA1M2l/b3dt8jj3WCVYMrjxOzvvDL6zUQ/8FtC1v87IvS/F9CW5TLcSNKA+T?=
 =?us-ascii?Q?QnOP1kuVNbAIymu4My9LKVAdk7E04LzldppcIe2QEznX4OwCXhtmzOJFVXL5?=
 =?us-ascii?Q?OakV+W4xnRViF8XCDwoosjDB7qX0/hKC8th3CgeRwC+H/l3u7f/ofvCxrqv7?=
 =?us-ascii?Q?AEnAyMD4DLiu/yZBq+vmx0ZkwTeAZhFGYJAb18goH9g6tAiynBP81gy7tZFH?=
 =?us-ascii?Q?bH52+lfF3cgh8HOyn0nlQP51txB6vBR06e7aiu/Rx/fVeNSdylxn6AZEGUTe?=
 =?us-ascii?Q?wTWq/i3QKoPWGxWiSwVrTDE8fcp/I+UlXChR0JYpuJkYrzSS+B32Q5p98xj3?=
 =?us-ascii?Q?cxWFIdu0GYqXVtOHIeMvYopZ7g6T6hSAM0e7ZBlGhFVvLJV4+DkfQfmS5tFR?=
 =?us-ascii?Q?h2EezlKN0+zCzIPrGxUD62CqZD7aNt4+2HEdq4InaBkHQfsKdYr79miKlPxr?=
 =?us-ascii?Q?zLBHtVpw8gEwX+/XTJTXlpV2tDNPz+6WnZ4QKSvnr7W0h6g4BG0rmGLZro8t?=
 =?us-ascii?Q?mrHNhOwrp32sBYUWIXvVRVqhyjMSQsVcwpMAGroiMxZtCIjKU8Det6C8HN9B?=
 =?us-ascii?Q?YfL5qwqDif8A8xe3IFA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7195.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41fd3b15-d4b0-4292-26cd-08dd58877ecf
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2025 06:08:32.4261
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VPvdJvJhl1Gy1E0xd/OVbLQGQBvGgcPwgI0KuaZhA32uAI48v8R27nb0wwbnWHrtXDfL/GYoOoaTrs1kwzifhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6527



> From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> Sent: Thursday, February 27, 2025 8:33 PM
>=20
> Acked-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> ---
> v1 -> v2: add Subject and To
> ---
>  README.md | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/README.md b/README.md
> index c06caf6..731838b 100644
> --- a/README.md
> +++ b/README.md
> @@ -206,7 +206,16 @@ The mail requesting the vote should include the
> following, on a line by itself:<  <code>
>  Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN
>  </code>
> -(NNN is the issue number)</li>
> +(NNN is the issue number)<br>
> +For example, you can use the following template when requesting the TC
> +vote:<br> <code>
> +Subject: PATCH [description of changes]<br>
> +To: virtio-comment@lists.linux.dev<br>
> +
> +Could please open a voting ballot for these changes?
> +
> +Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN
> +</code></li>
>  <li>Please make sure to allow time for review between posting a comment
> and asking for a vote. </li>  </ol>
>=20
> base-commit: 124fcd0e97f209aab19639e7369116d99ede22a2
> --
> 2.42.0
Reviewed-by: Parav Pandit <parav@nvidia.com>

