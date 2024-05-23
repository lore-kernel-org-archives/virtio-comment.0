Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F0B13C685
	for <virtio-comment@lists.linux.dev>; Thu, 23 May 2024 06:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716446547; cv=fail; b=f0EBYsQO3jKm2fC5K/Ib9wqyL/jNdl78kFSx0np5CiGhop/o/6Vl/enQOc4zfWbxdusDD0xsTvngPOHuk6jIdza7I7HALj5OrjjxlbB4hkmYNBxL0TSxYEHojd27sE+bK7GbtO2aa13857etdPyZVLWPV/ZKa2rTMEjogVTyY3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716446547; c=relaxed/simple;
	bh=wHur2lndmEVqpqRvGdvpiz3fbljWt/rzzNPMsc3n934=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Yaq5WKIQTtHqCm2m9gzWIFV4wW+RLDyX02lLyrpKWvUJmtfK6OoS+TgYSc4+JDBpoSn5OjmOkHE4S2dN/FTJC5pfnkC2bc1cVYpTQaihG6yFAFYExbkUUz57Jw1RUVXMOzGMtkjzNh0LHoNBpejE2oUeI6GR38rF7dQ8sB9w1RE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hDI8SlR9; arc=fail smtp.client-ip=40.107.220.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hDI8SlR9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASSt+9bZf3c8jZa+jUtFeqqthP3Ztt7CcCX160bFBcnx7x2iT/E2YjVn+G2r+ra2E/wfhWUwCPXuRwVoACJPVgekBCdq8r9qY5z6uVOFTGGQIfpgkMmVW7cE4+ZtGvP17KYciKOa+af3IZV1KMyIx1Z0wtkegwQ2ye9XvgPTSSwLxsqzUwCBJNfFDTO7EcBq+d48fux9lUYXqAxtW4zVIvlb5kxhthLSB4QISPmWJgrKBbBF0Wt5XioTYAPSvuW11UbBL04OCip9Zjxwep2I93s/rqZeAimc+myKQsvL9r9MzNRGiMR08hkTHTVsw7FnpmqBncu4vlMRVbJccCyUmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qk1K1ChmXMSvHHbfQW5OpxnJa3b4z53OO7u/UvEjsWw=;
 b=h+si2Ql5hlOUFSxu5ax5Jocw2uenEEFW28HLwBSwE3JJBGRfpHJD1IyeaLrz3xG+OyyyoduUgBCXrNwnIx1hrBWQOfuXn0Nhm3LwkR08cE10meR/46oBhElXh5U4lEyiJ6ymOpJ7rMEUY9Jz2qs3n3p5ZyGL5kX1fnJw8xWhOvAKid1BitVmtk1KqGo3BhxmHNaBfzblihlgOp2YE5RyZOdBitowXXOtRedFYv8VtsSNXBKmJ8i/OkOMBcQdha5XdpwLj2Gjv7jF3w6Jiz7DgG+xPHxn6UXxJYxHFRtI6cZjRLyDA4Cl9Ku1iTkMJLsbtLrNIQD5CVOOp3e9+rFrSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qk1K1ChmXMSvHHbfQW5OpxnJa3b4z53OO7u/UvEjsWw=;
 b=hDI8SlR9nuG/BjmKiq65Msgb4pxa5MH7BTVeLv3KETYQ/KBMTLSNZJP8+8j1l1CfMUJcfc2iUubIkEmrJbCMsoYHpOnjbVC5cTDbVs6KzSiHZr9X4rwL3GS6u6ncqz1TOokphNkQLDsS9uay59DHeSAUIZGpQUAKznmmsXLTDr8tNvqAnLIBJDfomOzyV17+l3Gt9RayhSqWQZG943chNFyqKzQMDaG5L8t2+AL8NoW5dnL9M6BlaouoXMhnfYxFdgPpZ4QrxUqF8LExtjn27AvXxIp98yg1aGQM1Qvuv2asCUjviXvRbQNet/EXpqnbhyDU9g0yd1/wy6juLfGi4Q==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by PH7PR12MB9126.namprd12.prod.outlook.com (2603:10b6:510:2f0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Thu, 23 May
 2024 06:42:22 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 06:42:22 +0000
From: Parav Pandit <parav@nvidia.com>
To: Heng Qi <hengqi@linux.alibaba.com>
CC: Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
Subject: RE: RE: [PATCH v3] virtio-net: clarify coalescing parameters settings
Thread-Topic: RE: [PATCH v3] virtio-net: clarify coalescing parameters
 settings
Thread-Index: AQHarMCbnUqLyFy28ke8qx4lXqPGgbGkQSEwgAAcOQCAAAF6UA==
Date: Thu, 23 May 2024 06:42:22 +0000
Message-ID:
 <PH0PR12MB5481C6BC60C8B34DF99E77D8DCF42@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240523032332.50995-1-hengqi@linux.alibaba.com>
 <PH0PR12MB54819F69F8171B823B9D195FDCF42@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1716446140.4382823-1-hengqi@linux.alibaba.com>
In-Reply-To: <1716446140.4382823-1-hengqi@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH7PR12MB9126:EE_
x-ms-office365-filtering-correlation-id: ca10a71a-8543-43d6-d7b1-08dc7af37ff5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Z2ScrCa7yP9G2x4R+h/8GgNUzwbo6CNG+9q4ptRc0bpfisYqZoPt/AndsbhW?=
 =?us-ascii?Q?VBbV+kYGyAbFivRSAy3pDRf5w7tQLE5QUL+sYypAawbBI6BWzsp6zUpRYG8R?=
 =?us-ascii?Q?UXbMqZMAZGNH6iqyBldEbCqVFNdQ0iEcEi892ORfpeAF9Wm2yYEodZ8dtm8E?=
 =?us-ascii?Q?iEigUCDmiOWfnsEDZy1InEV1K9BOOHBiQDMj7d+yhwH4MsO+iX/ZRimVXeHz?=
 =?us-ascii?Q?DCMJ9HUCBLQPDyAIfBp0JIOg2nZ2opC2iyLQOf85jXcCPx+/3sNYrmJKo6WI?=
 =?us-ascii?Q?vUqHFjtXsq+YfE5c6PykyuV0EGLs6KUa63uEapb3BklFReBkldXOHj/bGHII?=
 =?us-ascii?Q?AcKLM2+gK4ALNIJAGSDLUwZ6IAUwrMjwPwBy1h+tj2762XCsxthaMJQpy0LX?=
 =?us-ascii?Q?YiUxefZElhzFcWMrG7TvM4M7V97sRLdy7TeAkyFntyYeE4CS6PIEocSpGFkj?=
 =?us-ascii?Q?rzRk5LptKU+7quNhmLW/6njTPFuiA7QtUqY+/n9TQMo+OsxHzGWVJmb29Yem?=
 =?us-ascii?Q?/+h/msagVNgePeF/yOzpS7Uo5giXhTb3BqNbVpFrAwz2L4tJb55v8JwEpD55?=
 =?us-ascii?Q?BSAI5AhkqNLieJXoK/bs7ny6vUbLLXX1QpDhP7dcGw9XW/v2T9VJ9g4LpIWB?=
 =?us-ascii?Q?rsvTi8dTwKr5RshkX5u7CdzLB8MiRJUfRivQ1sqTPQEGIuZ0KpcuU2YwelzG?=
 =?us-ascii?Q?9MlXujVS9LHglMsbEdI89uVSz0A8oKFRVvqSNRt24CVjKiHqPPjpHo4juVBn?=
 =?us-ascii?Q?v24v++q1sB/ySqlH+q7nlXB/h06kvVyYVMBN6gLFlusEyDxs8DJNU017Daib?=
 =?us-ascii?Q?15BmNQVxftKCoO/w25iXdwjx+djblh/heWO5rmJlItviMrT8vaYVOF6drOfI?=
 =?us-ascii?Q?jtAgUahY29XLI1TjdmTJ17qmaiyMecBja8Bz9+T1ml3viELU6eQRMPVjN8w7?=
 =?us-ascii?Q?dEdmx2nOlFzxMQqFy2g8RiwvJJavh+dzJX1cJW3dwdBbCmXxjDaANxtFUdxK?=
 =?us-ascii?Q?ha4cf192LEqYQAaYq788vgE/d79dlb0cuu9uIlv9TFas1SYtBhDlRKOj94gI?=
 =?us-ascii?Q?RnMiHPfU8d2F0cb/6kzsFwpD9k6n8J3GqnO844E/P4Z37MKO5YWACLAU5mdy?=
 =?us-ascii?Q?hvCT7QYIinkWDNhFEPwvbEuMm/FTIMW2PFK1mL+XowEhhalN6VlrRo/C2AgT?=
 =?us-ascii?Q?53TpSVSOYJibe6Kto8IPdXj8JaLxd93hpp7XiRGu37OQCJPwMkIi7clqCM9l?=
 =?us-ascii?Q?7BSQAjWGyZVqFlzai67zPWm7n+2juMDzDKbcRounk8cGmzjqtfeD9V8E/vFi?=
 =?us-ascii?Q?+376WDeA6rEBwypEMjaYtCA6axX6U0DWeBnSEZM8/hF8Gg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?PtpoLtBpxEcAZqWYE/6V0FsPfcdqMDuuXzxyqHRtkG6EkE9K/c/G/M8jzRpM?=
 =?us-ascii?Q?NZtEYdr6cHGP1h/ucsew/8PTNY5BBD/chpDY26OjzGvUu7SZOHJtUJeVmAcS?=
 =?us-ascii?Q?LLbxOyrHtfHzGhxgP+yUjRUY6O8Lg9QTkkEBlkhs1xaAPH2A0kthgVLuAELd?=
 =?us-ascii?Q?1+4ZZ9OJusAq3E613PmILAWDIKP7F24KrqiTrIBDEmfGSjKXoyJEpeK13PCs?=
 =?us-ascii?Q?8h08BHqFU7kDg5CWFgZGsUAQXcEYlhyZp5Hqr0THawGk4y5xK/TTCWoUJvRA?=
 =?us-ascii?Q?ckQzN4ddaMXO2lMsQrKNb1XoLJr00x2uvFBYOOdCXqSZ0CF/B4M7tGIQjN+K?=
 =?us-ascii?Q?uXmsDp6prnjBc0E32MvxfKUMAXrNbFLRNefiGgGkXy34Hf58lbyW1y6/lItU?=
 =?us-ascii?Q?VJXUWITNagBFyPSf+QfnpCIQo+oci3Sa+f9qIcYqpwtBuzj4qK/I7yPd6NzZ?=
 =?us-ascii?Q?zwb4F42+jqbdHpdepx0qcP+c1CNKuwWMs+GHUQp4bWm0L5BVnLQ4sOAMWKg3?=
 =?us-ascii?Q?ukfqR/fvUxsW0f0hEQmlEr8lnevG7TGN7PfY3t4HY+jMrW2cmXGpoOQwzP+P?=
 =?us-ascii?Q?vb7I9qCu820xgkAwvDHxjkpWHzzeZ0awwlya0D2zkmaKpGwAZ5OeyBDdMpPH?=
 =?us-ascii?Q?aRF1wGp3cc3UcjcVmsR8F3C1EHpoDlaMhir9lQJs3LrC0wH1Yz9jFL2NVReX?=
 =?us-ascii?Q?8mwfnUubYut5DBRT/Pm57Z06oiVCBoim1wFVBukYZhR56Yk8zjBQxnIg2Va5?=
 =?us-ascii?Q?VP8p1v92WHO/4x1uddUZg06IgeAEgmbqA5nqQfj9shWJMWJLpuC6HY7GnrTX?=
 =?us-ascii?Q?tsbgleDvUuyRWhx/QJoCVhTYB6jkk0nEg4zZRzXamByBYvjEZCK9FVUNkix2?=
 =?us-ascii?Q?72fJxqdkyglijfiEBGHxs6AFn4Bgwn/hKCto7P6fWvRge6ndVgYOyNpdhyuF?=
 =?us-ascii?Q?dx2AlMoow8TQZ3viZ1ozZ73hmuwKyj+bfK1SugBDtRNNCe4J7TpfCXtuZJxH?=
 =?us-ascii?Q?9i8ZLEAC9mArC6WC9pG3BkwycWAlwgFXrCzmDGYxTcgbnZUlWyxLQ2Z+Qh9E?=
 =?us-ascii?Q?6LZKV3WQwCuFAaT1JMITT0yFeLdFBYM3ffuO15D7RRO9/3W/z0nPbJarNvr3?=
 =?us-ascii?Q?SWv9z5/jkFJYa/Hv+7lItkK3C64C9GKbJsYHlnDdvv3CaQd0J0O8k/4NBmbY?=
 =?us-ascii?Q?CmnM4evq1jtBk+NUBcgOx+nNlhkfh+KfhMELIvwagXIudGmUN5NfiuYYJlAA?=
 =?us-ascii?Q?BF+Nn2QgGpmI8qPWb0Pl7Di9IvyLff2J+WRtiL/3pdABH1TAJEo8J/EqEC2y?=
 =?us-ascii?Q?JYQhRy9P5eWYWikodcp4DMCssemmze9h0Gf6Wb9OY8d6udkuvKvzXi+OSmMT?=
 =?us-ascii?Q?0WTd0bVr4vqnF4Q6dMh8fo1xD5ihVSsYLKuKgVkhpXFk4OoqB+aMrEllx0vD?=
 =?us-ascii?Q?5TArincT1i6VpNFqLEVA4YpQuOXODPUO0E+OROUq4ZlEtQv1ez3BbHKFXVJ8?=
 =?us-ascii?Q?dMc7Hcb6ya0YBbogYYaNF3EwoA2X722pKKXV2/RHOSzyHm6gG7drCo/rh4NT?=
 =?us-ascii?Q?b75VhvLTF9kpZ3kM6dk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ca10a71a-8543-43d6-d7b1-08dc7af37ff5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2024 06:42:22.1852
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Km4hGRosFc5r5vpz0EXi1EePZLiWrWjg90EMerlmA+K92e1Q4NdDmZcJshgZHO4MJbbPErrrWD9SF3hqtRaHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9126


> From: Heng Qi <hengqi@linux.alibaba.com>
> Sent: Thursday, May 23, 2024 12:06 PM
>=20
> On Thu, 23 May 2024 05:07:16 +0000, Parav Pandit <parav@nvidia.com>
> wrote:
> >
> > > From: Heng Qi <hengqi@linux.alibaba.com>
> > > Sent: Thursday, May 23, 2024 8:54 AM
> > >
> > > The device can set any initial coalescing parameters (0 or non-zero)
> > > for the receive/send queue before the setting command is executed,
> > > not just 0, enhancing device performance even without DIM enabled.
> > >
> > > So we need to clarify descriptions that don't fit the behavior.
> > >
> > > Suggested-by: Jason Wang <jasowang@redhat.com>
> > > Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> > > ---
> > > v2->v3:
> > >   - Clarify description to be more generic. @Parav
> > >
> > > v1->v2:
> > >   - Update description. @Jason
> > >
> > >  device-types/net/description.tex | 20 +++++++++++++-------
> > >  1 file changed, 13 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/device-types/net/description.tex b/device-
> > > types/net/description.tex index 61cce1f..f51e0d8 100644
> > > --- a/device-types/net/description.tex
> > > +++ b/device-types/net/description.tex
> > > @@ -1803,6 +1803,14 @@ \subsubsection{Control
> > > Virtqueue}\label{sec:Device Types / Network Device / Devi
> > >                                          for an enabled
> > > transmit/receive virtqueue whose index is \field{vq_index}.
> > >  \end{enumerate}
> > >
> > > +If the VIRTIO_NET_F_NOTF_COAL or VIRTIO_NET_F_VQ_NOTF_COAL
> feature
> > > is
> > > +negotiated, the device may apply any coalescing parameters to each
> > > +transmit/receive virtqueue before the driver successfully performs
> > > +one of the
> > > VIRTIO_NET_CTRL_NOTF_COAL set commands.
> > > +
> > > +The driver can query the current coalescing parameters of any
> > > +enabled transmit/receive virtqueue using the
> > > VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET
> > > +command, before or after any VIRTIO_NET_CTRL_NOTF_COAL set
> command
> > > is done.
> > > +
> > >  The device may generate notifications more or less frequently than
> > > specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
> > >
> > >  If coalescing parameters are being set, the device applies the last
> > > coalescing parameters set for a @@ -1884,18 +1892,16 @@
> > > \subsubsection{Control Virtqueue}\label{sec:Device Types / Network
> > > Device / Devi  The device MUST respond to
> > > VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET and
> > > VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET commands with
> VIRTIO_NET_ERR if the designated virtqueue is not an enabled transmit or
> receive virtqueue.
> > >
> > > -Upon disabling and re-enabling a transmit virtqueue, the device
> > > MUST set the coalescing parameters of the virtqueue -to those
> > > configured through the VIRTIO_NET_CTRL_NOTF_COAL_TX_SET
> command, or,
> > > if the driver did not set any TX coalescing parameters, to 0.
> > > -
> > > -Upon disabling and re-enabling a receive virtqueue, the device MUST
> > > set the coalescing parameters of the virtqueue -to those configured
> > > through the VIRTIO_NET_CTRL_NOTF_COAL_RX_SET command, or, if the
> > > driver did not set any RX coalescing parameters, to 0.
> > > -
> >
> > These two normative statements are correct, the change should be only f=
or 0
> and only for TX and RX commands.
> > (no need to extend that to per VQ level commands).
> >
> > There is no need to burden the device to remember the old value for eac=
h
> queue when the q is disabled.
> > No point in remember something when the device does not know if it will=
 be
> ever enabled or not.
>=20
> The current spec already tells the device to remember the old value.
>=20
It only tells for VIRTIO_NET_F_NOTF_COAL in above two normatives.

For VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET it is not called out explicitly, hence=
 the device do not remember it.

> But I think it's ok to be relaxed for the descriptions.
Yes.
>=20
> >
> > So it should be,
> >
> > "or, If the driver did not set any coalescing parameters, the device MA=
Y
> initialize it to any value."
>=20
> It works.
>=20
> >
> > >  The behavior of the device in response to set commands of the
> > > VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
> > >  the device MAY generate notifications more or less frequently than
> specified.
> > >
> > >  A device SHOULD NOT send used buffer notifications to the driver if
> > > the notifications are suppressed, even if the notification conditions=
 are
> met.
> > >
> > > -Upon reset, a device MUST initialize all coalescing parameters to 0.
> >
> > > +Upon disabling and then re-enabling a transmit or receive
> > > +virtqueue, the device MUST apply the same coalescing parameters to
> > > +the virtqueue as were set before it was disabled.
> > > +
> >
> > I think it should be,
> > When VIRTIO_NET_F_VQ_NOTF_COAL feature is negotiated, upon disabling
> > and then re-enabling a transmit or receive virtqueue, the device MAY se=
t any
> coalescing parameters for all transmit or receive virtqueues.
> >
> > This clarifies the current behavior and also does not burden the device=
 to
> remember any values related to VQ resource that is disabled (or destroyed=
).
>=20
> Makes sense.
>=20
> Thanks.
>=20
> >
> > > +Upon reset, a device MAY set any coalescing parameters for all
> > > +transmit or
> > > receive virtqueues.
> > >
> > >  \paragraph{Device Statistics}\label{sec:Device Types / Network
> > > Device / Device Operation / Control Virtqueue / Device Statistics}
> > >
> > > --
> > > 2.32.0.3.g01195cf9f
> >
