Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A8C16EB6A
	for <virtio-comment@lists.linux.dev>; Fri, 12 Jul 2024 13:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720790415; cv=fail; b=QFioKZHEOB+pKwrchd5QGNJckFidWLvE1P9pAYZyZQPXHcOhH3IkrHwtb9MNFzoLFc52vguWsCtL+w5/0WXIcPllp+EJOyhePf65eaIPptB3m/oaPv7Unh/27xHURgL2o3DmWxLUZlpygvOyO5WVESK33g/HUCG67gU2Dq77aOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720790415; c=relaxed/simple;
	bh=M5rRRv/YUtq70qB5l9t7U6v8c3VvOZ/K8NkbQiZL08s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HLMd+N0UIjepwYAKaJ1Q+6IEyepOT13E62/iZYcGgxYqClyaCQJrewTNfuZ4J1j1LDRXHVw4MEbyvKaN7lwH/Jx5Pk+dxbn7+E/hcHnH4IjxUPUiC7XEmAwt6CjDfLstS89qsZvJk2fDxW1Sb7j0LV5mz07CFCWf6aj7Kxouh4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Kfs154GM; arc=fail smtp.client-ip=40.107.92.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Kfs154GM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwDy2ezzc0J6Zv/Eb1NorR3TzqECHvQVHEtBQuMi8sTWmOL+UlK3XKtbMZV3VW8wKahRVuYtJfVObf/545PC/L8Eo5TctAB+ijY+hIG9FeUPhmpMGfF/s9oGd8RXfGQaD6GoLiuP9DyzkMeq2AKU/zAAplnX7XgOxmnB9QbWQFRPu4GjA7dUX6pG7fnEfXB98OKxOVZ5Tjj6JTwL1fcZ9sASk4zz0Jf7gCcU0ky5W09igqdmHNuFYG6Rxict7NN606S4nbvZcdaK8XrFZ/xERT5pBSQQx756AQPhiFIpOmYSaQWzkFrA06xtO9ovWDmSSqTl+gfpgpLHYm7LBCqwCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALEY1HHvctgytszwb06UfZU1aHL1EGlnCAl6LHThP3A=;
 b=rCeRJGCOCCdZxJ3FtD81+cprqNt6VlFoQ+Y0lmGwyO/Vyomp0g/e3IJNhMFyuWjugY4jm9LDxbuDkojMryKvtw8M0QadbgaHuwvTDQrDF6jXYCWg1w20hbbCPbFMj3LoIq9CV9zSUybcMz7EloXgT8ClqVmn1u/3cnNcDd/tqIe69hUtNW+8h+eeyT53PhirKRhhkj03bbQiQTMlWvnVRW3SeD/biQjFWIspRVu6acVFOatQx84+TqZpcfTxthdwbS+1pTcdzjFeP0Y3uHI40cP7oreP7ra94sMqoYjFY7D+7grMhLSQfRZ6hzYN9iowpgVgPwUpxgdMsK8KGtd+Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALEY1HHvctgytszwb06UfZU1aHL1EGlnCAl6LHThP3A=;
 b=Kfs154GMZmtsRR+yecerdBgnfYikZCiokVw3e2vb2hXKw6u7u5pbrWISWRy0pdwxsYSIiDm+ccUyOj9dLVItj5HulcCOJd/1mRA1OItWYflxwZ3wuZU9eLHC0NuTaIe1hmpqGnVb123Vn1/ACfgeVhZrYZLsfJUzyQOL5/HdnjJfbbIpP5qxxt9DSWcsXSB0f0jo7a3ulJ4/V+qNDshUnxhza4JL5S4fHyqqGusY7RmK4bhu2P1AK6GpnkuLY9VtD7Lqx5ECY8Y2OK7mltUX+Ko9up6N+Q20MJT/wrrDJmYxvz5NKT8KYCU4aA3DXMG1d+mBKeCpSfWWjG77HMDP4Q==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by PH0PR12MB7981.namprd12.prod.outlook.com (2603:10b6:510:26c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 13:20:04 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%4]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 13:20:04 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit
	<pandit.parav@gmail.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>
Subject: RE: [PULL 0/6] administration commands for device parts
Thread-Topic: [PULL 0/6] administration commands for device parts
Thread-Index: AQHa1BO1lZE40lLXYku1iFILVn2407Hy6Z6AgAAqEIA=
Date: Fri, 12 Jul 2024 13:20:04 +0000
Message-ID:
 <PH0PR12MB548114992BD2B898B9C1765BDCA62@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240712042628.3247126-1-parav@nvidia.com>
 <20240712064628-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240712064628-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH0PR12MB7981:EE_
x-ms-office365-filtering-correlation-id: 05ae950a-0d6a-4f29-436f-08dca2755775
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?th/3cRg6fwy1UGo8YKB0NW0GeeXSQ+bThg8ZcLGg1g+p7f5rrudE7Hbh4Mch?=
 =?us-ascii?Q?qaEM3VQAGp07VnJFSA/611LVRusNBIb/44WV2ase57+ssgEqWoGg1dpAYoT4?=
 =?us-ascii?Q?4UsXnYPEsaDzf0GlYQqmsH73xh6dcjttvFKmQCURf2/sZPgDvgN40jLoME/P?=
 =?us-ascii?Q?frZLoO5/TFytP+h1Uvs4LdYJ/QwEwGFOunPbUwJjXuxIe3y/iv9ymQjvN2n4?=
 =?us-ascii?Q?VQrzjeC8eB+spPvuSF//TJUd5wbYGjaT78HKSnePresgtJJDoQn9g+BnLv5B?=
 =?us-ascii?Q?s5Lz1bMWm/4IFsvRX/URS4gWqU+LYnQETEVhd6sxfqF24NmmdTkbGugzl1lz?=
 =?us-ascii?Q?RI4SAAydG41YuEOFnqJa3u9g11anyLbnkeOMgrzsYLn5BJeV5Yrl0/qKL74B?=
 =?us-ascii?Q?cfqlNrI4fUzDeqN8i035XpMN5CA0mBQSo8hqdU/ldO62y8UCqDr1cXpqrmws?=
 =?us-ascii?Q?U1rMdjRDg02qhKMZc/ytf9RCrO9e96sLa/husXtqLwaxamZ5dAf8gNvbRih2?=
 =?us-ascii?Q?L2GccLJ26X4mtMDPDk0ZgsOKFXu6ypfc3KGfxophNwTZ7P4MDAw0nb2gMfWX?=
 =?us-ascii?Q?8PUkSmrfPl3cxZsNsF5czrYO+e48cNOb0LRpRryYNuBqXoOauGMyPVnP2zIM?=
 =?us-ascii?Q?Ov31eA6h6454d61VjdsbB5Toj2uZabHXUerbX1ESjgrcoeFSDGyfxWFrjGG/?=
 =?us-ascii?Q?Pd0s97RPsEUDkNDMelXNcDx87NBIfFDRc38bjH3A4pk7uwPg91Wyzy0YwTR7?=
 =?us-ascii?Q?CyYMquAJe1muMCaOPzeUgQvVh5DssHYEbI0AiHprmVGd1RK1C1S16NPavb3l?=
 =?us-ascii?Q?qHiSk8C/jQBP0jNcU7RrV6N9DbJRGA8YnMJ9fF2kSOA9Uc3auFBQrE3qCcDf?=
 =?us-ascii?Q?6dptuWoJxzqPR7dxctvg2orc3n9FOVr7m0oFAVOlmyrb5mIspr/1BsIq7dKx?=
 =?us-ascii?Q?0eJPzVBwY6aveKNvYI+QVtaD6w3/KwFI7Be7dZjz++hNW0a/46lVy2+7TxdR?=
 =?us-ascii?Q?M+TnIzpOJeb5R/LzOC1Qbf4k72UQb77XLQ4bDlVKHqwi2CbNJMqJ6ZEKrX8k?=
 =?us-ascii?Q?LCeNfk/FW09YufJJp+6F/xfXstqv3WtOJ6t4buMIGV+hk6jgpMjKJD9jihRr?=
 =?us-ascii?Q?DsKtC7whYbBx4bijtNI38jxCrb6qByDmWhkWv74SG/FhMbjHT3v7N5EGj9uE?=
 =?us-ascii?Q?FpLpbU7s5+9TcHzyoZBtzCelrV/GePOMX1rY4bgaBh9kDWDggw6Ss3kSD6Mk?=
 =?us-ascii?Q?5RB+Whn9VIzbUqqmB90b+pfgPryY5wsM0kAPRU1lC0kIEQMc/TevdKVcSIXM?=
 =?us-ascii?Q?e2myF3EaUd6i7dAafS9zaTalin8KSv2cQ64M8qGUEsApG5r/3nm/ZAoJfguf?=
 =?us-ascii?Q?KNylGP0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BrjBuo1YFlDic9ESkFpXie7lL16FhozzpKSlAbJnV86VT23OT3L/YWxujhhv?=
 =?us-ascii?Q?E3HoRiZK5KSSNNMTcPObxi5PRooXJRcwsrSNQRdGKtsevAaPwLYAnR57tMZN?=
 =?us-ascii?Q?gzKQhX2v4XRVSBA556vJBZVYHV7t3Tpe4yEB3Uw4eQtlWBmdu3xoRf0lkGBR?=
 =?us-ascii?Q?OgM4D1LW8pGTrUW7GTPWxmx+5ftO1NQjHKPglFc0v7WYAMdiFSTuXV2zvX5R?=
 =?us-ascii?Q?SLNrFWJ7JKyYWqE0OgJ+szOPe3LxeOpYKOzEzcOwfxHyKN/EpedAWccOFZh5?=
 =?us-ascii?Q?glDhZzkK8zt1jNaRiGTwCXEq91dR5AM1T2K2GtWkTxei0RUtDy2WEZayIcod?=
 =?us-ascii?Q?QSKrk16+tHAPnUcITTAmMT9Q6Q33iz7WO6aao5H06ZZxZXGLyTMBV64Y4max?=
 =?us-ascii?Q?2WJEdqWjb5+B5G5/ZJikrn8AGfa3RII08aGmJ64dQaPSqGgSMl8Gv0GIkbva?=
 =?us-ascii?Q?kfLdUxauqGErMGkgbkDlcLqj+QUQ5zqkfylp+BetBcKKLhwosdmmq1ufq9c/?=
 =?us-ascii?Q?ovlcCP1ouvWtUzCv7DLj5BiX3BzgtJO91PrjZbxsoplNGmjxIbwFPXKIpCAB?=
 =?us-ascii?Q?mjmQGWWCJFwpx/N07rJtR+2nGsU/zacs8b0bORtU8pDHMlCvd0kkSvyZay4/?=
 =?us-ascii?Q?5L06x6m5gLfsJyG3Smiog4FgBXSbNxoP0RqXd3NfqMZLdOi82JEDEjO40W78?=
 =?us-ascii?Q?wxjqHOlswGTuTI4xJNXYmbihETy0h54eJqLgm3FwuYz2DS7lCUWNx48kInpR?=
 =?us-ascii?Q?hLxqqIcwjpr810lBayLLLRvwp9i0ZvvJGgHDNHq3rt3yp7PtTxcdpCzOL8CB?=
 =?us-ascii?Q?VYKvhLY8WudQrsOxuQgpY61ffR/L7xNdSifZv6QEamlQZoirf+EFsCxxVJmr?=
 =?us-ascii?Q?EUQw+lQTJH4ygYp81jt/c7fpKOA8uG2geljqYkTr1I0pRGLLIqcp1wlfLfot?=
 =?us-ascii?Q?uwIYt2TU8gBhsdzaMib8b9LqJRhLt9HZjBP6UnddY8vlat5rt6INhM12NdNH?=
 =?us-ascii?Q?agMRcK9439W3gL8fpxS4Okg/hrUl50ls8UWElu+gk6cfaOeJkaH7ci/vI688?=
 =?us-ascii?Q?JrXBZfD+Pc02PYsWHbd13pWjKYYa6gKjVuj6R1mJXJ4tc+8NWmAlyxPk9tT1?=
 =?us-ascii?Q?8EViNBxtcla4IJLKlEM1M+kbhI3/U7c5463X5veCrWRR0F0iNgR8dYxc2Ch6?=
 =?us-ascii?Q?Mqu2AyE0EwxApv6yIOPVG669y59IeZX6XucNnBL0L1UHWDC7AzfYjI9MiJWt?=
 =?us-ascii?Q?uJvVshOl669lZ6avJEA/L22QA1ggnWfKLP3OjjGPM/9AYab5aX/LdguhoXiz?=
 =?us-ascii?Q?1OrNOdoKpAcNebkHTre5/cBsYvBicWtaU5XqU2r1SPxe8/9+fo73FKvQwRFJ?=
 =?us-ascii?Q?Ldrcec4LbtP8n51K4Fs2fYl2c93nXrBv0nyzfDh08Fke0fDhFLpvuHvQjrL/?=
 =?us-ascii?Q?kRSsNn4P+NJ8PLkd7oV0WllE2BFuB0vCE94I06hrMptsbhabN4rDHzbPCL18?=
 =?us-ascii?Q?a+ko7C6GXd3W42BRVX7iaRRoJSWwiNvJvsMcnyhc+Bi3/Qtp1QXG3Tq+i9pG?=
 =?us-ascii?Q?qB+zEyeHwV9rxJ49n4w=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ae950a-0d6a-4f29-436f-08dca2755775
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2024 13:20:04.1729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lOKNazCrApzBXzP20hUaJFgFub/Z/Ayb+pt85QWucJQj96Ed+imLcaOm22xG/FsukHGpZxT0KdaLFqk3p+XS+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7981



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Friday, July 12, 2024 4:17 PM
> Subject: Re: [PULL 0/6] administration commands for device parts
>=20
> subject should not have 0/6
Ok. will fix it.

> and it should have a version.
>
Will add.
=20
> On Fri, Jul 12, 2024 at 07:26:28AM +0300, Parav Pandit wrote:
> > Hi Michael, Cornelia,
> >
>=20
> put changelog here please.
>=20
>
Ack.
=20
> > The following changes since commit
> dce4079825ea073ec7e60832dcbfef9756e5842f:
> >
> >   virtio_pci_cap64: specify offset_hi, length_hi endianness
> > (2024-07-11 18:30:17 -0400)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/paravmellanox/virtio-spec.git tags/for_1.4_v1
> >
> > for you to fetch changes up to
> 7384c5ee3d1efd6352c532dd7f4121fecd212a0b:
> >
> >   editorial: replace hyperref with ref (2024-07-12 07:05:22 +0300)
> >
> > ----------------------------------------------------------------
> > This tag contains administration commands for device parts along with
> > the suggested editorial change to remove the hyperreference.
> >
> > It resolves the editorial conflict of blank line at the of file
> > newdevice.tex in commit 761c87891d3d12d0f1ea5ae0bf88bc127d227346.
> >
> > ----------------------------------------------------------------
> > Parav Pandit (6):
> >       admin: Add theory of operation for device parts
> >       admin: Extend resource objects for sr-iov group type
> >       admin: Add admin commands for device parts
> >       admin: Define common device parts
> >       admin: Add requirements of device parts commands
> >       editorial: replace hyperref with ref
> >
> >  admin-cmds-capabilities.tex     |  16 ++
> >  admin-cmds-device-parts.tex     | 469
> ++++++++++++++++++++++++++++++++++++++++
> >  admin-cmds-resource-objects.tex |  29 ++-
> >  admin.tex                       |  12 +-
> >  conformance.tex                 |   2 +
> >  content.tex                     |   1 +
> >  device-parts.tex                | 232 ++++++++++++++++++++
> >  newdevice.tex                   |  24 +-
> >  8 files changed, 778 insertions(+), 7 deletions(-)  create mode
> > 100644 admin-cmds-device-parts.tex  create mode 100644
> > device-parts.tex The following changes since commit
> > dce4079825ea073ec7e60832dcbfef9756e5842f:
> >
> >   virtio_pci_cap64: specify offset_hi, length_hi endianness
> > (2024-07-11 18:30:17 -0400)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/paravmellanox/virtio-spec.git tags/for_1.4_v1
>=20
> you cna just replace the same tag. No need to create a ton of tags v1/v2 =
etc
> etc.
>=20
Tags are cheap. Old tags can be deleted.
Github UI is very good for that matter.
Tagging along with the PR version helps me to keep both in sync and avoids =
error of wrong things put.
So I will use the tag that matches the PR version.

> > for you to fetch changes up to
> 7384c5ee3d1efd6352c532dd7f4121fecd212a0b:
> >
> >   editorial: replace hyperref with ref (2024-07-12 07:05:22 +0300)
> >
> > ----------------------------------------------------------------
> > This tag contains administration commands for device parts
> >
> > ----------------------------------------------------------------
> > Parav Pandit (6):
> >       admin: Add theory of operation for device parts
> >       admin: Extend resource objects for sr-iov group type
> >       admin: Add admin commands for device parts
> >       admin: Define common device parts
> >       admin: Add requirements of device parts commands
> >       editorial: replace hyperref with ref
> >
> >  admin-cmds-capabilities.tex     |  16 ++
> >  admin-cmds-device-parts.tex     | 469
> ++++++++++++++++++++++++++++++++++++++++
> >  admin-cmds-resource-objects.tex |  29 ++-
> >  admin.tex                       |  12 +-
> >  conformance.tex                 |   2 +
> >  content.tex                     |   1 +
> >  device-parts.tex                | 232 ++++++++++++++++++++
> >  newdevice.tex                   |  24 +-
> >  8 files changed, 778 insertions(+), 7 deletions(-)  create mode
> > 100644 admin-cmds-device-parts.tex  create mode 100644
> > device-parts.tex

