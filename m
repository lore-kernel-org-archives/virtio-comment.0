Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E4C16F850
	for <virtio-comment@lists.linux.dev>; Fri, 12 Jul 2024 13:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720789209; cv=fail; b=r+6nN0Yv7e5EYFjjUUW9WSJess/E1gPAvVEoTYER8v5E7SIDcJJovxTGRn9pg3ul7PgJ4GK5WXV83sToeOVvUJ/1IkLnIacpPKMZb25ORK5rWGF5+PL8zWObKDTsmhY1UUQm1zZr+naavCvlyPPcvLdQBCNnREBymiFkeP+lI8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720789209; c=relaxed/simple;
	bh=iZLo1A3ozbbL7hOrYaFIYOyZD6iESDRiv+oYfaMoEKI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r7FGUNGawiAVGhwbHy1lyVHzYnMYQ8iI1H08aqJK5sBApeAq7/NZel7/MXpMue/SJMtWWRsxwI7WvluFtqjGdYDb07EnJ7brgVkP7bn9MY7N7lCMD5kjELx9ju7u4tiuSk1/FSF69WMd7qKlIueLELBqaqMYcbAhzxgGHa667yw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JcM+jH0s; arc=fail smtp.client-ip=40.107.237.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JcM+jH0s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pWNeTzjYtwgpOmDPCQNfMuQTjLfkwAoHvR8RtD/HyDRd6pl5WA6X+v6dU93shTimzqKDyq0IB71RPl+AvMgGGoV1dIDUTyucvpPh3i9REJa6ouSFqTtXK9Ava9cgsxxJ0TyL7ovPnrTjvWv3GueYXz6SzysOpnqodi7z8vsmZE2+C25u4tdVJ0k5zPUqsVGFT14DIbYvd7lYdrk3M7Qec+VLrhnEDHPpHeFJ0TreO4wjgkNWYX0Kl9T1DnO3HIhif7TLDncMYI8ErA/eyRpvz2qaM5FCd0XWNJEsH2LRUwcun/n4fG6FykHUWHYfH/5hdpel8jsekfOpZO6iG+ybLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mH/+YeEy5EQYo5Ln2fF4xfnUWc8xvm8GbNv0PZxfMuw=;
 b=xamN5Vl6pNrqZPVelu7b4xzBeF161+v/w8qFqlKInedDjTzOrJ7Drz6KQTK0aA1oix3/wsyYB3D05BaOsjAL4anZ3C+g4hTNXjuPov192IyR4SGMZB6rj+4YLUXsu93FL1y4b3fUpftRH+hvKjrsnVFkVcPSfz/L8quEnVPF+oZpH4Za+IJd6vwwAdp32nVcV4Z2d+QcbQ1wKd4o5KyxJM5kDVkw5m7JdluYbIFlBmbPlYIxNqSrd50AEJlP5mplk07igrCXrmchtrEe1vmVFp8i6SXND/7WexT2RhHj9xF/e4wQRL8jQp7I+laXFUV/WUPlM7ihcKVe/EOyp7yDYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mH/+YeEy5EQYo5Ln2fF4xfnUWc8xvm8GbNv0PZxfMuw=;
 b=JcM+jH0scWTni9usjqiOqEONFdwcm1KIEHRxQ+9eZTt0ct9ZWQp/wc7KMuNm+hFZ/tUU788ubTTRileT0I2vnMltMEvn3XTZPYPXIZQ4GWSa8cUFTGkfIi5WkqM5uPwSZiWmj8duOxapAHI6j1cTq/YZQTMO+ZNuT1iPkab/Fd+63RKL+QX1osCiZaSfH5D2Kw63iw5mo341bErTp+2wMwIdrv8n3bBqVXXS68S7eqyD6JdBA7vxjLF3vP5BekG5fziFMgrR5jNmGwk63SLRTsQbR2+CrOT5Y5kDWDxj5mD9MgL05Jzm6WfB2SUAJ84DP5O3ylgJCGqKDL8r1b021Q==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by MN0PR12MB5907.namprd12.prod.outlook.com (2603:10b6:208:37b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 13:00:03 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%4]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 13:00:02 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit
	<pandit.parav@gmail.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>
Subject: RE: [PATCH] editorial: replace hyperref with ref
Thread-Topic: [PATCH] editorial: replace hyperref with ref
Thread-Index: AQHa1BIat6yqkExuMUOjMUW3abrvLrHy6ukAgAAjfjA=
Date: Fri, 12 Jul 2024 13:00:02 +0000
Message-ID:
 <PH0PR12MB5481F8ADC39749DBCAB7D192DCA62@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240712041433.3246718-1-parav@nvidia.com>
 <20240712064951-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240712064951-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MN0PR12MB5907:EE_
x-ms-office365-filtering-correlation-id: 057d792d-5443-49be-920c-08dca2728b2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?F8I4NgyftocLa1dsNlcspY0k0HJQSWhAPVJhjV298z8xqMC+rKeTjX8FOAij?=
 =?us-ascii?Q?oQ0QG0CYUQBFJyJ62YYsVgQeAJZsoVbPbAErR4uJoANhVtyu/RJ7SdXV0mNd?=
 =?us-ascii?Q?RU0FPE9qAeA9XyeszcbM5G3Cq82DIa/8ildQSy7V5C95fikRZ4igIYXFGGCD?=
 =?us-ascii?Q?i+WgGOJVwwNXeaU7d/3XmcuAikCRC6pCsvstYtYP03MEgdMnGk7EYD2aHobg?=
 =?us-ascii?Q?c2OxseppAQfsY30C1ISbu5pf4AgOGMrrmjCY+Cof20TxbWHzrfudxZkjkIAZ?=
 =?us-ascii?Q?D5KQUE1+06puxgijod/OVD0djZ9sjJq0m83lpVf3RQnPkx0kym1Q5NGLBaam?=
 =?us-ascii?Q?g4DSTqIKKuB2wmpmitCQRn0phbYO+fNLOZfAifLZ6WcmxbAoDW02RjEs2E3/?=
 =?us-ascii?Q?xpezDH/7HtvAigxBN0WACPWSUwV/XonC5wgQSEKlODawh9U5f8WR7TPApg2T?=
 =?us-ascii?Q?uvXySG/K4QwMiKdpyCOCJmfoxtSt5X0KosnYOV5ANamL+pOlnL4hFV452F6z?=
 =?us-ascii?Q?5bAKuVNA6z5j1wBpRqjd2dCgHZKdliRNuYjvL/UZQsdlETQwhRrZV3GECPPD?=
 =?us-ascii?Q?kvLnbWMagbrXUG2GoBG5bcwPxMEuZZcyVEAfgTz3g6khE6KZDC0VUd05jm40?=
 =?us-ascii?Q?r+AgcNhjEkGQDy6gv72wm8NpVDGXFWzHp1KwjVi3cvftpCvWToQVLXpZjlvU?=
 =?us-ascii?Q?CFESoGT/ePe0Yl4zlSXFvv2Lhpwh0iNSKi2oRAHErck8ef5QY3YTYJuJYuNL?=
 =?us-ascii?Q?b2gq/h7lMwla6vGvo8/QaqW5LgigGoRHqFw3DLHbKCEOYQQkYrzhMz4hLFCt?=
 =?us-ascii?Q?g1ij1jATBpKq5iW0s9O3IgEQeQPOW0fdV2j5gUI8WL902rIA6c2a98ynhzsR?=
 =?us-ascii?Q?BYMFzshD/j7KGjdEErpcu6JinmrAuq6sPJnrtTNelI2CIRaJb+yyBcOm2/pW?=
 =?us-ascii?Q?GgKgt1BufnRxakAEGG82VOAzu5Ggj9SzRA97lHvm//9k4rnqIrYBVeg+cz0z?=
 =?us-ascii?Q?35SNTm5+i4n7DZ9W816+xBneY+4n2qCTRgnjbq/bm3atJXlkA+8P8umT6Ttj?=
 =?us-ascii?Q?bkiu54RbJiwMfKbZHLJmRZ7QpGAaIY9UF0rmOyu22MxA2RZK2xNLBX1YvANI?=
 =?us-ascii?Q?5/S2Zbpw5S49yqfPFJyq+GO4jGqvC6XW0LqWV3VQUGw9+Wjnls2otcWLOVMn?=
 =?us-ascii?Q?uQV0+rvPrZPWzIVdWAmMfZOeRr7yba2v3WXIKnKqem/DOwO4mv4vCE+I8mvH?=
 =?us-ascii?Q?v0xlX/11Pr6yrnSCOV24AVmK5RkNs4J+xJHEpx9zCo02k/bBfkPFnE5oTchS?=
 =?us-ascii?Q?23Ibt2S3W9mdO63S0Moo6afQ6Wo3iUWa0TGoNAR1T9wgzEanL6cMXNYNy4qi?=
 =?us-ascii?Q?P8RuXbxCTBP4nTUPrjt6r7DmXpHsauiEeaj4/rsXp7EJyPqVzg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?WLoVGDPGy2le3FV8ggJ95GzsOnPBmsW7qUGR5GiTIG1G0iV42z3cerSIDE3w?=
 =?us-ascii?Q?9Tr1CzCLCT7rK8kAnZh/1rHQ1UYrUDxRDHvV6YrAO92a0bk5hc8/IlYcXsZH?=
 =?us-ascii?Q?NJSxuJ4apvCsNgabDF2A0IbyQsm5Al+gl02jE0N4P9s16KowMDjsYHl1ljS0?=
 =?us-ascii?Q?r4qIUkrJWblO4zDqBVsnrDvij3BldRVL5ot0sPt6/aRgrNW2Y1mT8xkDjd/O?=
 =?us-ascii?Q?59r3pQEF7+4per22Cc/Ig37o6qZ92vYKEhKKqlOpfSICo+i6r6enpyHupSFy?=
 =?us-ascii?Q?XbmNxD7UqsSft3+SI/qEkkj14MqoPkgs42WvPh2JuQOs7Dh1XwIJ+OIp2pt9?=
 =?us-ascii?Q?988jgz4qSTs91NcCEx/DhbdOclpNXQD5CCQyIAM4ZuaqPzMSEAKNHjsihmM3?=
 =?us-ascii?Q?knn9JSv7j9f/5g1vDcPHg8kJkfiRYJl8qtzuWFzR5uUFcBUu+lzDhs2zuIbW?=
 =?us-ascii?Q?4hX6w+K63k6N7bnW8ZVrpGBCVnReNpZbqW++ZLYyODYto3jIhaEOsUbl7jLW?=
 =?us-ascii?Q?wKzvSHYLDncpu7/FPPI4Xf/YqwHqawFP9EfeQzgkZtZabfCeFrwQBv1ekUiK?=
 =?us-ascii?Q?6sYoxvNuPQbEd9fumTqSeVlO9IwzP8hDfwL2cGMbqr00rVUD0XKWNjkp8PC7?=
 =?us-ascii?Q?kpiZv+xcLEU7+EoRr0B8EA2ULDgN/rautE4U3bSbkOlpwkWXOaqQTy8iz2VE?=
 =?us-ascii?Q?jfKINej1yzXFWhWjuTIxRB15A86HJAhxshYUMJu6y4YduqNwNj/C11xTCxLK?=
 =?us-ascii?Q?pfU5WO2AyDJ24lfj8nLsTZN6ULwyd/ns+U+cnYKVA7xhaVq3/uJin4u5DBbP?=
 =?us-ascii?Q?eU4HHrmypth+fM5P6fQo8rC4cv/1jrCS9CUgBnYIsegssZ/CU/jqRyPwrMgE?=
 =?us-ascii?Q?mu/3gI7hsLfeOnl+NioL6qCnhfXuS04dzM4k0no5qnX01xed/OJyDuVXLa2f?=
 =?us-ascii?Q?E5oPgWb7g6rCKaqdYOYkGjreA9CpVogJNQNyUf5fYBLL2hyFmniqi4rbWryc?=
 =?us-ascii?Q?nCqhnSf4EBwMFiFOqf4/ZvWhAf1Mg49qoo0Dd8tcFjd2kHB9c+EZEek8zvEj?=
 =?us-ascii?Q?vfLMB0A3uapg4F+O/cmp04DxT3VX8tlXHUbAlpoFRhCfYX4uRUAmJVj80zhP?=
 =?us-ascii?Q?Uf85AYR7FRGdIFVKdIMEA89bSQAg2G8P4ZY5oIU+NZ9gh9knzPlXXLH3e2Rj?=
 =?us-ascii?Q?4Gq0/GEEBLn2iTybEf3L4I11Bvs1WAvs2VVTxqVw4DuXkpf7iXMzWTZwTNSL?=
 =?us-ascii?Q?RcNEg4GPqm4Q4mQQWpVd0gjKKujbDtzCcs+it44B8HnHfsEmReg1BYlPHaoj?=
 =?us-ascii?Q?WVaJ/HGvDQ/3bILoBbWpcDfpSdT6j3e9fM6l41z2am/FfY2RAHZCfBs3BHHa?=
 =?us-ascii?Q?34XlRAqoXZyk7UYiIW+DjDpMihunLOmk2FClI+/WTCjjwNk6dQVL+79cIbTt?=
 =?us-ascii?Q?2cNNPmtb1LO1FHwkiwTj214/uddA5ctRhgOoJi3Z6K+C3+1qnnOqhnBmd5bD?=
 =?us-ascii?Q?1ykmBKlI3Trxf+Q6+J3scrJxPA83zrOYrZ3KmIwbMvN+gYLG8JUrT4ciGG0Y?=
 =?us-ascii?Q?gQVICfon4ikaM4MQn1M=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 057d792d-5443-49be-920c-08dca2728b2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2024 13:00:02.4693
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hDCmd0ErfOyi3UdZnLrXzegoupEaVgklkGEJKvBertJB1PdQt7srCfkm3LaIWywzxaT4smo9I/06+nvC828O/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5907



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Friday, July 12, 2024 4:22 PM
> On Fri, Jul 12, 2024 at 07:14:33AM +0300, Parav Pandit wrote:
> > Replace hyperreference with the reference.
> > Fix the broken link refernce for the DEVICE_STATUS part.
>=20
> typo
>
Fixing in v1.
=20
> >
> > Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > ---
> >  admin-cmds-device-parts.tex     |  6 +++---
> >  admin-cmds-resource-objects.tex |  2 +-
> >  device-parts.tex                | 19 ++++++++++---------
> >  3 files changed, 14 insertions(+), 13 deletions(-)
> >
> > diff --git a/admin-cmds-device-parts.tex b/admin-cmds-device-parts.tex
> > index ab6e83b..4aa1464 100644
> > --- a/admin-cmds-device-parts.tex
> > +++ b/admin-cmds-device-parts.tex
> > @@ -60,7 +60,7 @@ \subsubsection{Device parts}\label{sec:Basic
> > Facilities of a Virtio Device / Dev  Before performing any get or set
> > operation for the device parts, the driver  creates the device parts
> > resource object  VIRTIO_RESOURCE_OBJ_DEV_PARTS using the
> > administration command -\hyperref[par:Basic Facilities of a Virtio Devi=
ce /
> Device groups / Group administration commands / Device resource objects /
> VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE]{VIRTIO_ADMIN_CMD_RESO
> URCE_OBJ_CREATE}.
> > +\ref{par:Basic Facilities of a Virtio Device / Device groups / Group
> administration commands / Device resource objects /
> VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE}.
> >  The driver indicates the intended purpose (get or set) at the time of
> > creating the  device parts resource object.
> >  For the device parts resource object, both
> > \field{resource_obj_specific_data} and @@ -337,7 +337,7 @@
> > \subsubsection{Device parts}\label{sec:Basic Facilities of a Virtio
> > Device / Dev  When there are multiple device parts in the command
> > VIRTIO_ADMIN_CMD_DEV_PARTS_GET, the device MUST respond the
> device
> > parts in the  same order as listed in the table -\hyperref[table:Basic =
Facilities
> of a Virtio Device / Device groups / Group administration commands / Devi=
ce
> parts / Device parts order/ Device parts order]{device parts order}.
> > +\ref{table:Basic Facilities of a Virtio Device / Device groups / Group
> administration commands / Device parts / Device parts order/ Device parts
> order}.
>=20
> Should be part of sentence before: {device parts order} \ref{}.
>=20
> Otherwise it's just a reference by itself, does not make sense - pls look=
 at the
> generated pdf to see what I mean.
>=20
> Same elsewhere.
>=20
Ok. I use the name reference now which is readable with the reference.
Thanks.
