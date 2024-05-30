Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2087.outbound.protection.outlook.com [40.107.100.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042B516F905
	for <virtio-comment@lists.linux.dev>; Thu, 30 May 2024 11:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717069525; cv=fail; b=GOWp47tmvZW4NWHv8Nm42ipM6gc2TKk4zi/L3N3GpceWO48j0n9eL1x8gu+B/QJqaOYFT9iPHrBJR2lU28QD84lF+jg+VCmEvTVD8570qmDS6q67m+A5Bsti0aC5VOujryOoz1WLLKiNJxcynopnFiYORQY43dgTH6A5ludxklc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717069525; c=relaxed/simple;
	bh=Gp/ZWtMvJv/VoMM/Keos1ewSljiX7KZXj8u2WZ5hrwY=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=IOIs05IcRRWHkMiWBcZYmGzYPlNGzEtiOFwU1J/PInvtjka12EBqWHELFcgBQlINyxbFBl3hzSzjToYOAM/fB79tPfX2GI9JSkslbQY3IqdHD5vous/8+aRkcQ0rEmmekRGzyDj4EJ6FLJ1f5ELCnoUyr4ERVNiXNWiUWZSKMpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WK8y8lm0; arc=fail smtp.client-ip=40.107.100.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WK8y8lm0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CrlsG+MKyJerc51TtP5K604ajPwkbNHxi6fNFgOQ+wVftmC7sjPT+kzLiZ9MNFSTYM7nxdjbLD+lQxvE/t7o7ALzgMwdpxuPdck8mgemO95OOrD7W5KpnFB0GfvI90/hFgK9n7t1+IYJyGpObUyfifFwfEOo9CeFlAiVT0Ehx4KVAcceEHaZv1ovxa50WlUQWxMCUZjAXi7/lKIBmHsOgBbJx0MbFwppedqw4PKsBWukvH/rPxDVYwSAgGTpD48nENDn61SVYom3c3N8M4kwvPPZVa37yJ5kvdnmSA5BmDLj7BkuN99+C32mF2m5Ojx+GaBL6augPXsFApFClCw+Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gp/ZWtMvJv/VoMM/Keos1ewSljiX7KZXj8u2WZ5hrwY=;
 b=Sp26njs0i3Vp6YPPME58ss6zlnr4Sk5ZcCv9KPSwPPtsPUO8fexlyeGUFq8vnUXMTBxdB8yBwy++n6y0IQ660LUc+RU5WOYO636nLpa2bu/ghXP/oMF9ks1Xk9KAC6U34MVqeazfzN9HE78p0fQAz/xBFc9Ne1sC2V+QiEo2AeOyppODpKT2DQFTou7LOpUo+oo28Nzhe3BtYJx+jBzmUrZZCvO0CIb7ILs/GN/g3gCZbfikHE200iRkNor0cYR+DFxIFPme5apiP0Yj3xrTQeahr9Wn97AR6sqtqWuGpbUYpTKao6dQB6j8TQypLaYxr8nPe4lqhvaLNa8ri9Mp4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gp/ZWtMvJv/VoMM/Keos1ewSljiX7KZXj8u2WZ5hrwY=;
 b=WK8y8lm0V79hLlWUIX+S0gq0gY+UhArXRH0B6aFsEYGgfcbLx0VI5Yx8rbw2S9MV2jUHIVbtIR7VIB8I2yi9/RusxpeBsXoX7Kj4BNZ15xG3xwJMXYumOGjZKDUXoLfPJGztwhBNsL9L0kHTyRm4tiGN2M4zWoO7SJrX0E+Vpm6BLYqHv5VArb+et0w6Alf4KXsWGiqlHvfugMDmzvLkRqJuO+BT528UrRKC8MnUO9diOuNXp19jua6LEL2V/zN2hscgoBWnLLj5fHdYJGnr7icdGniQ4a7jJVED3NVg9CVPIYBlNQELn9SLbCC9PtsbjaGBkCuP6uf+GLw93mR9FA==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by DM4PR12MB5964.namprd12.prod.outlook.com (2603:10b6:8:6b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.30; Thu, 30 May 2024 11:45:20 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 11:45:20 +0000
From: Parav Pandit <parav@nvidia.com>
To: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [Request for vote] virtio-net: Clarify the size of virtio_net_hdr for
 tx, rx along with receive buffer size
Thread-Topic: [Request for vote] virtio-net: Clarify the size of
 virtio_net_hdr for tx, rx along with receive buffer size
Thread-Index: Adqyhn2QVvGc0A4dSJi9gQ7BHOkG9w==
Date: Thu, 30 May 2024 11:45:20 +0000
Message-ID:
 <PH0PR12MB5481581301BE629655641DD7DCF32@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM4PR12MB5964:EE_
x-ms-office365-filtering-correlation-id: a753fb1b-547a-4fc0-09fa-08dc809dfbd5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?7GEtXwacouzuzzl2xwP7MYsyfSP8GKpU0tqFY/0banSlOxl0/lVqBztP3N+c?=
 =?us-ascii?Q?m40BiWlFvrsee58BeexwdnPWv/QJvp/kM1+P2U9Y/jZ+brOgg9Sw+wdX1LzD?=
 =?us-ascii?Q?RMDe1dRr8wiLJ7ruBe4wS1EvdXWKnHeXjmcCjSDTQyu8GSrp+zRLKhD+PqzD?=
 =?us-ascii?Q?/VL5vHTPGvgt8Dt3ADJ3FtuERblsuy3ESQH0SKzeIopuh7V66cgsPfBvCyNG?=
 =?us-ascii?Q?MlNc699vgAUfUv3AMRKMAQJ4HP2eUwzQ/oOCaVkeB54x9kfNGJU6unkrk5J6?=
 =?us-ascii?Q?N5s7YUb+UOGHKH/Qkog3/0ydTetD8Tpphx/o0YLUx3oHn3A/mTNlaXifWCZ6?=
 =?us-ascii?Q?/I+A/EKXQzFqSbOsTKB7EM6ahNLevRU3hL3HhMOUdMiNYo42b8VCA8oCZ15K?=
 =?us-ascii?Q?I0BUdTOtT1XEkl/CLyb/EjOZcpKdblogsbzwL/9QYcQD0LhFp5XcHQPYXHDL?=
 =?us-ascii?Q?tRP9bAsmzgd5Jelsal6VaMOUXQubhxPjvDVpcPYeDt1qDNV8w1AE0DRCwbna?=
 =?us-ascii?Q?raIFPGDoI4bvtnayVNJOVVthP/nk2327I9V48ZJhWvu7fpfgpY3x0pLT6Lf6?=
 =?us-ascii?Q?jrMnaGOd0uk1ZH7uZf5kfQpEFJnFv63Q3iHW4HoduHObmGtwgOj+88FyMjF/?=
 =?us-ascii?Q?sZLUcg2YfpkTlJ3+gOKAYmwhU5Bu+UH3acb47gnezA2JD/bAY+krJ/GnQ8C9?=
 =?us-ascii?Q?4y/B1xb9l/jaBEp84hdy4r964FFgFLE5PMjlOfd6J1E7A8lov9P54RwXTuHY?=
 =?us-ascii?Q?vsK28ku/9JGLoQ0Mhn6RoXLPvqgEpN5nZulAfdEx6rSxu84ZkwS2RoLkbsdB?=
 =?us-ascii?Q?mOKNwSpLvro8x9CkoccBkx9Jjt97jL+SMIESXV6aJiziQ4rCi9FPxsUDjzvi?=
 =?us-ascii?Q?lixwMQeJ9JBYMxykddJHCtsy46olxXPuHUOMboXM8+Sn/z6SSQP4XNMTFfLw?=
 =?us-ascii?Q?HhRW4eVq4yLZg23CTK9BWVIJpHXDeGSIlD67vSVovgb+rXM7FEFATVMqg/fU?=
 =?us-ascii?Q?dybtKB16IPxd0gYMGrSdBiAFXnr87VQum8eu70nMIdRYRqDaxETnaDOYUR4y?=
 =?us-ascii?Q?SWRtbujH61+mgb+zmjqlTD79N7dCqzNhn/8t9nlYTszC8xUgPVL4pvV5YjNL?=
 =?us-ascii?Q?Zxp089JQKXhSy+hpmMLJxpLxRxYnBYCwSySpYh3f5mlRODtbUuRBWcpOLO8E?=
 =?us-ascii?Q?DssrNu0QN23XhDpMjaNOVvgpqGNddl4Q3GPiwItxpTXyf6nqPp2uoLdxG/SG?=
 =?us-ascii?Q?9AuH52EX1YdDv9ZEo7JJmaGwGL+sVG479R5KeIL1HHO4y8nMrPxTnZ6nBwQp?=
 =?us-ascii?Q?hnA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LjaKaFwvqV4ltkxlxi6S3YH+uHuh+Uu2ByGx0oTQ0QcAQwFXu5qcAqiWUYRZ?=
 =?us-ascii?Q?xVwBEAsT8cnVwa9djfQH5jY7Ug6K8DSsfsv4jPgTkseBG5mPZN11TxulRSnb?=
 =?us-ascii?Q?plX0zKGbdG4hRI5akpoNGoGuMDsqyOSS0dFbpsuL/t5maSPnTiinV84XseCV?=
 =?us-ascii?Q?paMoKOMO8xoCtRP2f5Mi/SEsx66SUDll7D8TlmtmkZbcaSg45B6tjosz99a5?=
 =?us-ascii?Q?AQxTyuqaOp8s4zuMBE4rT7lKnOgXbcEpFaLbAh3ntmii9Z944QbsyjAZfRCd?=
 =?us-ascii?Q?Nh0hj2xv/kY72rT1ijooUYT6+Lq02rtvsZDU5+fOisN34KDbVeK/4tj4sHQ7?=
 =?us-ascii?Q?jpwJouwp7O385Sqk1kjPTs1YMj8tYYo/mBUSH0EIp6TR0gFadf9xDCFIXmpq?=
 =?us-ascii?Q?CRTZ9WnZwCs4AVZluFKCAsS6AOSenH/+XQydJcr3jhWgmxo/9NRiEWyaA4Za?=
 =?us-ascii?Q?aaz7e/tsuaWwk6iWGWIRVonsuODnwuHSMIYf9yo7R4a5CBskHnXgg4PwOWSe?=
 =?us-ascii?Q?2VMOlZUiCc24onQ4uuD3OBJ6SmjNwHpVD58iHeL51er8W/h4UWbNMMgaPAdZ?=
 =?us-ascii?Q?X0l+qOKil3sScII8dIcVjm/Mer/WfHDb3RbxuzTb9eDIrqha7EWnekWqFJYW?=
 =?us-ascii?Q?PI0VNyRqyTGzpkBweNzsxXt4IFUE3FuOlUNNA+YIg6UX0qWuF0HoWoPKAfMv?=
 =?us-ascii?Q?Ad50mK5q6RLiak2NU59DEvHWWcJeNk0O6QOK224C0gk/7/Q7YAJhVoZErLG3?=
 =?us-ascii?Q?EhVWNDx0q1QYCFe6wsz8bXULclmJkd+t8E3g2b9B66BSPJOr5acJRynO3TAG?=
 =?us-ascii?Q?Is2Vg2DaPjEdppltpoyblM9DEpMq48akEvrTMnvIZ6TIFS7nQtrPynhVldwh?=
 =?us-ascii?Q?app3RZk1bZENP6MB2XRMFApC6/ljOe4C8kN5L1RKNWgfAH+V809T3WMI1Rr0?=
 =?us-ascii?Q?zmEhxxNfS657ZyYXmSo5jVlcVyGGsbxnuu8hDB7eJ6075VALmE5tzuQVJGty?=
 =?us-ascii?Q?p2YktqVQ50e1vYTkdOTUZ2X57mtcAPZFr5kyFGGehnmVyKMwOqkjRTGRqCIe?=
 =?us-ascii?Q?W6EXGR6JCZrOHeP0aEAEv7Z3RgVwVdanQxtT2NOjXgIjXCL3W/t7Q7O5eq+E?=
 =?us-ascii?Q?3R9athMDe2/8fXwFydLNBJedr78rGWvfdYIOsOmJCCVF9yjGb5zZMRiuhNhg?=
 =?us-ascii?Q?W0mauSHaVyn4qowfqUtaerXWWA3sW1CuUQC03oPJ3N4i2zJFfpuz0KtR3+Uw?=
 =?us-ascii?Q?/IEx7p75l6/RQpSRiFOttjiOtSc9iMNuYDOiHvXHsUEmEZG3Q85+KP3KtI5K?=
 =?us-ascii?Q?Y3/U/r8kiFc2CJ/Q78UsoidwqhlwhkTlN2GF21ysGcToVrRw/WaAKrBZDBo7?=
 =?us-ascii?Q?CTjakJY5m0HGwis2udquES8KtuKo7n18AKfXL6dhpvRmU+8Vsz8QdwwajBKT?=
 =?us-ascii?Q?P89CVQvVVZdHgn8mLVjx+9NG7KDYOPK7nqgaDhtD2+kZgrUvnDq/W68L81I6?=
 =?us-ascii?Q?zUtomk1Q5tLgSpjstCybkg57dFYZZkQ1GjvXmaxjhqH2nYWOB+ZHoEENsE7G?=
 =?us-ascii?Q?Sly2nGAJ9z1LG5Nmgoc=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a753fb1b-547a-4fc0-09fa-08dc809dfbd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2024 11:45:20.2439
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tupsEnWUZ2mXyWP0moR/CdFjqo5OQwLunH6ThRyJkHMxpdVbeSbCmYJhYvMMU3vVwhGij++rSSncrM4u4h/Ksw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5964

Hi,

Can you please raise the voting for github issue [1]?
Patches are at [2].

[1] https://github.com/oasis-tcs/virtio-spec/issues/183

[2] https://lore.kernel.org/virtio-comment/20240521122303.2004122-1-parav@n=
vidia.com/T/#t

They are posted on 21st May 2024.
They are:
Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

Regards,
Parav Pandit
