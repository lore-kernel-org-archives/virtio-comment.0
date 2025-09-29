Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011024.outbound.protection.outlook.com [40.107.130.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE702222B2
	for <virtio-comment@lists.linux.dev>; Mon, 29 Sep 2025 17:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759167879; cv=fail; b=YajzUi9k/5yMnvmd+zMHk7+Mfx1Ah9j89aIPjRLcngiOiULEuM6XTbQwSrIaEJfJ1hg76lI9m2tL+3GjH2MiGO02wgayEjT97j0DCWBGay+rhNPzMWt9vCekwPT7PbhHUYe3UP+wlX3JkKKEHwhcCfdYFUeZtlOSg3wKJWX1IMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759167879; c=relaxed/simple;
	bh=f/aP5Lz9ReRwiQtpyDwDEznOL20CKZuRpNnIR6Iowv4=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EvMtgqMuTTTPyucVv5iX4n17gCGwUyxUWXB+tN+8x4uYiR+hNbbSXvYkJTWJbMJp7shUCAJM8VKXY5D+yruNMuJpRFWxtFSa92O4lykjRPuniR5HYEwwd0FeQjNdgQFc3CtDERj7hqmqHDY36L2rVpOq40GSglS8rbU4EMEFsKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=fUovYxQ3; arc=fail smtp.client-ip=40.107.130.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="fUovYxQ3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s/6EcvldJ3O+gYG0w7hf2gJG29eA5cQgPAcKp9Thv6iq2YHMstyuuF4GyiHaqN0vp9ekWKeAhKDQ4dPG71uR6lK+L6AdnMKg5PI3wrBFi7EjIFk/JNmkr6EV/UDoraEJ6R/PraO17A4yRO8NaWI8C7BAxpW14o313Kz7Q5tbp9f3S0Pm4AZr303pLWZipMjyE7ydJ1IguSmdcAIV1EBIpEQ6GdEITU9U8pSDARsq5AWAOeZ8+tUPHRD9bLFyquq4q1CjZn62LHWp0pKEEYCXvAueAmMd/CP2pW+wgn1YUF62Cv40ftHKgw/YDRaFyGez7jMWsp0L8muAT0sDheCv/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=evaFHKdNRk+3lPIJQxRaGAB+GTmPmogY7npWBFL8dRQ=;
 b=NoC3GbTVSvUdSZpwhUHDkGaqSo/k9GoY86DESjGkEULhPu05N4d3ctP0aPQqWZlbiu9YiT8U3K4YTWGiB5KySNmB2WsBqG0TFO1dCLJ+ptwlXkN2gb1RASDYXI0BXhjCyOAoM8J2nEU1cB3lsAI3QZTkfQEWV/Y25q2JTSL8W7smkPEOCFh0JX78r666VMErHf6NKFh2pm7FGOZ1HhOtUnluB/bwhWHiT63XQbwcHF/tW8jV+u2rdWLk8QRD7klBUACkz2ty43FF2UCWVNlRJc+E/91bRjn+/Q7jQh1Cwr5BMsE4dAxGKSRA5wdtqzWPNZWO3cwn53PigDpLkBg9CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia-bell-labs.com; dmarc=pass action=none
 header.from=nokia-bell-labs.com; dkim=pass header.d=nokia-bell-labs.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=evaFHKdNRk+3lPIJQxRaGAB+GTmPmogY7npWBFL8dRQ=;
 b=fUovYxQ30K4bJyMaAwj5g0svUBL3rVyANZVI0tzqq8kDBkUOO6lOZ7I+Njze2//vLTjq+lEfogMC8hRT68Q3wkZKOOAIFf6o0GSy4b2V3k0RKm4f7daN1wqODTdsm5Ns48UHQZzSBNpExKTEX2XXUTwCKD1VaW0Ilkstg8w7qnL1fCX5BZjpFLI88ouNdh4fIXhZlz5Ng2yhkSvIlpnKRyhqb7Gh3IU9bQEjPYOa7EjxA58QOCenkIqLw+e/v3ng6ZuScsJ5G+6Vt5tmfI2DnBxemeZYEX0GeBlfzfyEp1kyK5hqWaxSAcxRoA0Uu2T5357MtO9zD85aGch70p25+A==
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com (2603:10a6:102:133::12)
 by AM0PR07MB6226.eurprd07.prod.outlook.com (2603:10a6:20b:154::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 17:44:33 +0000
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56]) by PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56%2]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 17:44:33 +0000
From: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>
To: Parav Pandit <parav@nvidia.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "mvaralar@redhat.com"
	<mvaralar@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>, "ij@kernel.org" <ij@kernel.org>,
	"ncardwell@google.com" <ncardwell@google.com>, "Koen De Schepper (Nokia)"
	<koen.de_schepper@nokia-bell-labs.com>, "g.white@cablelabs.com"
	<g.white@cablelabs.com>, "vidhi_goel@apple.com" <vidhi_goel@apple.com>,
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>
Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
Thread-Topic: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
Thread-Index: AQHcDRMrginf6nv65kWiLWJ393AYBrSqEH4AgACeHQA=
Date: Mon, 29 Sep 2025 17:44:32 +0000
Message-ID:
 <PAXPR07MB79843798615E61FA134A5428A31BA@PAXPR07MB7984.eurprd07.prod.outlook.com>
References: <20250814120118.81787-1-chia-yu.chang@nokia-bell-labs.com>
 <20250814120118.81787-2-chia-yu.chang@nokia-bell-labs.com>
 <CY8PR12MB7195670B68CC8F454DA821C6DC1BA@CY8PR12MB7195.namprd12.prod.outlook.com>
In-Reply-To:
 <CY8PR12MB7195670B68CC8F454DA821C6DC1BA@CY8PR12MB7195.namprd12.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia-bell-labs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR07MB7984:EE_|AM0PR07MB6226:EE_
x-ms-office365-filtering-correlation-id: 8a9ac2f7-44a5-42c4-7466-08ddff7fd963
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?EUBMJBu5JcGVtElU6wRdDbYFjIrBPUGlIL4ofaso2Xkeco8fqUduyRJE8NCu?=
 =?us-ascii?Q?/xvaijxWrHcj2OM2AHB+JtJumAnKlPVnZkBq2fc4NEU8cWpYsahpWX0+RvaM?=
 =?us-ascii?Q?RgCGb69RqTFup/9QrU59/XUL7ZfDiy6e3Aq3cJqBcsgxyEa8iiz40aIemqB3?=
 =?us-ascii?Q?SGl5CXAgiHIzDHnWGO4yDS6kcqtJCSV+wA4kGUP+xrst+1Z9xbZylYAS89Ls?=
 =?us-ascii?Q?AzY0ESf3uqqAi+NoFtGRkw6+2RP94Yd5Hgl5HWC8sUXKB6gUYQ6Av5X7iotC?=
 =?us-ascii?Q?bdHetp/BJtzbanKod/0jNR/RSGZ6B1wElGZaxdGUtAI8+MqXG0z+NipT8gAz?=
 =?us-ascii?Q?kS5Bt7CQk+f8xL/+0ztYkS5ziIprXiMnQPgd6abmUTdRd7JHCu9SEhp7gm+m?=
 =?us-ascii?Q?Bvtrx/Ajb/rbm4nETUM0vA1kM41HI8Bx3+16qkBSTMA8j5qkG6T+k5igZfcT?=
 =?us-ascii?Q?BzHQkG8Gw1+kvf5JPOVfUXgUDW7lX1RHGEHjivgYx+UtfhWkISrhRVZiwAJX?=
 =?us-ascii?Q?4LFOCaI2Woz4Sfu7EGRh9ymRitlUiwk94VAMkuRdBe+ELMusYDO2e6w2rhSv?=
 =?us-ascii?Q?44ncyrxIPkCltKq1x4+e4Ac7eb35EXAaw/5/O/Pkyu/dSk7hrFgrxYPi+TrS?=
 =?us-ascii?Q?GIEtJMQ9j7ijEiVxfsk0Bx9LIxaAOnm6nNtyPGMP74eZKO6gYAS7SFCbxzQE?=
 =?us-ascii?Q?b9lvO7pb7oEI5e4GpEEgVqStL+UGBynnelIGKd+lvD+qXCYHigeH4yWE6Uzp?=
 =?us-ascii?Q?TztdS0lELyKp+/8IPjl/QKlg2h5EDN0eX+C5Ffc8/U+22tsc7rGeVpLMBeal?=
 =?us-ascii?Q?ByEEr1Z+HgaVaPRne1UXlnqxxYX1F0tBoHQkarGz1IjRsl4Ml9xC+MxPeUcE?=
 =?us-ascii?Q?8CG1A7uM/czOlRg9oKMneRpT1/4iCscCKCsebKjB/n4WXccs5oDx5by4Rts4?=
 =?us-ascii?Q?Y27QbhoVsi+NHC6pawaq6hQfOcdCTZ+j3YCLvg79DjnUyZreUH7chDmBbybr?=
 =?us-ascii?Q?PDP45R7J42uyMhg1cRSeoSxjO/GzeUPYAvFH7l/28scJkxwF9ERWubUhn12p?=
 =?us-ascii?Q?e3XOjcXXijzAH4pM3sTNa2drsOQTPorBU72/bl8vg+6xnqgrVloUtZcN7OWv?=
 =?us-ascii?Q?75ZyCN5ky7t2tJmeSzSgzp1yQcwKhxFo59rQ9Axa+1+zjutpn5DqL4UMEl3b?=
 =?us-ascii?Q?M143kO+CEJobSFyNq5i9M0td8iRR1Qc7YN4NgvrOuTNvWR39DKlfcrfXangT?=
 =?us-ascii?Q?y44XjyJli+tgIQ6oqPOMZXcVdk928VtLXF9VJbVy8llRWarP5tf+k1gEjhge?=
 =?us-ascii?Q?N3JNpVRp1IybMqq8jkGxNNweS6UxfltRef8sKp2yirn+tYXOvCPC+zZWK6XK?=
 =?us-ascii?Q?10NpZlHx93qWNrVTbPSOIizUX3OPSBy3bEe4saFOMFRT1crlhORoiQGhVINj?=
 =?us-ascii?Q?9ZBJN23xJGBJwiRIY+0Ude7v32IOe59LWFXGMjPexUGTITYRufSG56CAW4uT?=
 =?us-ascii?Q?RZU85NmgR5SyVYMznEN78z7+XcWvUDKAwbRz6UOz3r0bRDEeM+xjfTTyWQ?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR07MB7984.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Qc9Er+AidguDoh65OTrc0ikGrPkwG1Qre/D98k04+HKfAy1+4U95iMm4SScd?=
 =?us-ascii?Q?ceGvIBKCrPzxI+XxPMUvaY/esoI5e19A9igf8jpPtYPqRWRNuyAhX6MEPwyz?=
 =?us-ascii?Q?q67B1Fm1U8Oqf85aehbfXy5U8Rnf67GK11dl+BDQjIsKXTFlU0Ms1PS5avf8?=
 =?us-ascii?Q?LTsYQe88lyU8WEZUtxwRD0TLlXmMV4zAJ4COdGAlci3Hf9mbbHBQrrOEW2um?=
 =?us-ascii?Q?yZkb8hYq2e1iG6kQSTnV8uZ6jrabBdTbUG1PpC8bhrr5/gISI7Az/7LsZa08?=
 =?us-ascii?Q?BoO9ILQlZjD+0usWa4utKHlXsBEgkJWM5LZ0SI+kJFDrwrWjVXuu8lGoi+Vx?=
 =?us-ascii?Q?LQp2yoat1eIiItwzmTSo76PeirzShsd/8j01ixX02zcpocW+9Iw0epVRNjR8?=
 =?us-ascii?Q?WN2PHgf3ZU3LRXuEhvw2owXmDt6UZ/qQpFlMKKMMwWilX5V85gdYLKlPx4vr?=
 =?us-ascii?Q?0ukG7EZ1oaYjuxarRMsiM+lJM5ZQ9zYbBavyyLTU+9/iSZ+7PEGQvwV5R/Ne?=
 =?us-ascii?Q?23GbewPFbbJwWVnARZ5eIUQ/bmMxWiGg4/ojhNfEQqLR9kbsLpBNtPg4Q65o?=
 =?us-ascii?Q?R/6carLLQHJRP5keKQP7CONKozQQg4c7lFLZY2LOaG2Q+djS3QEKdHvkgf4K?=
 =?us-ascii?Q?LhGdG/22Uzq/19ptcRdjDoPvEjkXWGTEB8AI5MbEuS/LGFtzxVcwHsBFgBYP?=
 =?us-ascii?Q?U7fkH3oebx4eemx6wEjNSVZIwAxiPDNtfu8C/9WQpdV+OIoqohURT0FPNGo5?=
 =?us-ascii?Q?M+NBYn/RfLCBbvs/g+J7TkRi9li5kLlzfLnyxGatxv8W5P8kg6J+YN/ORtyV?=
 =?us-ascii?Q?8vO3O+GxluWIjMBNMcPZv/ZV11n4aay4rrRUtlEPvwBT88Sz2ngxbkDmsFe6?=
 =?us-ascii?Q?uIsg6iOjKKKMrV6HFE1TpwpjbU6emUwZmegMMFqP5Yj/HhGJMihLBkg3btLe?=
 =?us-ascii?Q?7bibRiEBuflnan1XradkSx+1wzsg4rufytdp2ThBqPP/PxswNauUh7I/P4wj?=
 =?us-ascii?Q?zKMFshC+8Nyo3Yb9WvUyGGvSz250kUWXgqgKVx/3hmvocVnH2/5Xg4WjGHOB?=
 =?us-ascii?Q?cdOEfINR/qFguA4wASbxJOwR4Sr8gPOkgFFyzq3kqaBTekTLN9H7K4T+jxmc?=
 =?us-ascii?Q?IH//jrLO14fCLhWqu36Uh2GmeTRG6CQ0sh1AmM9kiGSHUP0HcTckG+xpP7td?=
 =?us-ascii?Q?gFRWrzHhp9HEiSl9fOFHtVwDUYGOdhYrQ5YgWOJxW4RliqDqtyPhYhgBUkTZ?=
 =?us-ascii?Q?twOZBO2fAMtsJqtXaw30/ZAsRr9APt6PJUMHye5tZ+0My27L/XDNl75Yq1UC?=
 =?us-ascii?Q?ogDcj3U7fr1gxZ9SJ2jcSFzmGfMqdJCLHdDVLcaeUnbNXebRJyYsyQBFKLt8?=
 =?us-ascii?Q?bQ8jk9MPHx4N/Ps7sOTvUrvNsWpz3hLVnCVJzMGP/x+ibCS63DRO2Cbl5odt?=
 =?us-ascii?Q?sh6oSO/01EbRNnfEY/tufGGHOQjeDwX6AFaldg5e3lrMQDigtqeIKeJKBecg?=
 =?us-ascii?Q?X5XpqHmo4vBOTjcaDhtkgFEzAFHd40J8WNUvmTL/KdBuJ3hreQ/+irzkovx7?=
 =?us-ascii?Q?QB90JKSIsaz8WKvXPokj7g3A49vIkW76SSQt++dOjQHQHKBYwkAflcoMxJJ6?=
 =?us-ascii?Q?XA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR07MB7984.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9ac2f7-44a5-42c4-7466-08ddff7fd963
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 17:44:32.9291
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TSS47AiX144Z3u/4ZtqPxcGhXheTPtMoASXeP/1tcVGtiR3ZYhoxtDHn2UGyz1ErwOapp6DTo8o+efkw49c1peVJKknqJ0CipkfLVKC4kdY3oN739mrzY7R+58PzINcc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB6226

> -----Original Message-----
> From: Parav Pandit <parav@nvidia.com>=20
> Sent: Monday, September 29, 2025 9:48 AM
> To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>; virtio-com=
ment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com; mvaralar@redhat.co=
m; jasowang@redhat.com; xuanzhuo@linux.alibaba.com; eperezma@redhat.com; ij=
@kernel.org; ncardwell@google.com; Koen De Schepper (Nokia) <koen.de_schepp=
er@nokia-bell-labs.com>; g.white@cablelabs.com; vidhi_goel@apple.com; ingem=
ar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
>=20
>=20
> CAUTION: This is an external email. Please be very careful when clicking =
links or opening attachments. See the URL nok.it/ext for additional informa=
tion.
>=20
>=20
>=20
> Hi,
>=20
> > From: chia-yu.chang@nokia-bell-labs.com <chia-yu.chang@nokia-bell-=20
> > labs.com>
> >
> > From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> >
> > Clarify that the VIRTIO_NET_HDR_GSO_ECN gso_type flag does not mean=20
> > that TCP has IP-ECN set; instead, it identifies that the TCP CWR flag=20
> > is set and will be cleared from the second segment of an aggregated seg=
ment.
> >
> Above text is seems to be clarified only in commit message, not in the sp=
ec changes below.
> Can you please add it in the actual spec wording, including requirements?

Hi Parav,

This is to fix current error in virtio spec:
"VIRTIO_NET_HDR_GSO_ECN is a flag within the VIRTIO_NET_HDR structure that =
indicates the TCP header of a packet has its Explicit Congestion Notificati=
on (ECN) bit set, signifying congestion in the network"

TCP header does not have ECN bit, and this flag shall indicate the CWR bit =
of TCP header is set when doing the GSO for the first packet.
The corresponding texts in RFC3168 are "When the TCP data sender is ready t=
o set the CWR bit after reducing the congestion window, it SHOULD set the C=
WR bit only on the first new data packet that it transmits."

So, do you think adding above texts in the commit message is ok?

Chia-Yu
>=20
> > This is used to offload the TCP CWR flag in a way that is compatible=20
> > with
> > RFC3168 ECN but is problematic for non-RFC3168 use of the TCP CWR flag.
> >
> > Foe detailed requirements, please refer to IETF RFC3168:
>=20
> [..]
>=20
> > Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> > ---
> >  device-types/net/description.tex | 35 +++++++++++++++++---------------
> >  introduction.tex                 |  3 +++
> >  2 files changed, 22 insertions(+), 16 deletions(-)
> >
> > diff --git a/device-types/net/description.tex b/device-=20
> > types/net/description.tex index da9ff17..0da8f9f 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -54,7 +54,9 @@ \subsection{Feature bits}\label{sec:Device Types /=20
> > Network Device / Feature bits
> >
> >  \item[VIRTIO_NET_F_GUEST_TSO6 (8)] Driver can receive TSOv6.
> >
> > -\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with ECN.
> > +\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with the CWR
> > flag set
> > +    and follow the requirements of the CWR bit described in
> > +    ``Section 6.1.2. The TCP Sender'' of \hyperref[intro:rfc3168]{[RFC=
3168]}.
> >
> >  \item[VIRTIO_NET_F_GUEST_UFO (10)] Driver can receive UFO.
> >
> > @@ -62,7 +64,9 @@ \subsection{Feature bits}\label{sec:Device Types /=20
> > Network Device / Feature bits
> >
> >  \item[VIRTIO_NET_F_HOST_TSO6 (12)] Device can receive TSOv6.
> >
> > -\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with ECN.
> > +\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with the CWR
> > flag set
> > +    and follow the requirements of the CWR bit described in
> > +    ``Section 6.1.2. The TCP Sender'' of \hyperref[intro:rfc3168]{[RFC=
3168]}.
> >
> >  \item[VIRTIO_NET_F_HOST_UFO (14)] Device can receive UFO.
> >
> > @@ -729,9 +733,10 @@ \subsubsection{Packet=20
> > Transmission}\label{sec:Device Types / Network Device / De
> >      header (ie. MSS).
> >
> >    \item If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature,
> > -    the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}
> > -    indicates that the TCP packet has the ECN bit set\footnote{This ca=
se is not
> > handled by some older hardware, so is called out -specifically in the=20
> > protocol.}.
> > +    the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type} indicates that=
=20
> > + the
> > TCP packet
> > +    has the CWR flag set and follows the requirements of the CWR flag
> > described in
> > +    ``Section 6.1.2. The TCP Sender'' of \hyperref[intro:rfc3168]{[RFC=
3168]}.
> > +    \footnote{This case is not handled by some older hardware, so is=20
> > + called
> > out specifically in the protocol.}.
> >     \end{itemize}
> >
> >  \item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO=20
> > feature and the @@ -828,10 +833,9 @@ \subsubsection{Packet=20
> > Transmission}\label{sec:Device Types / Network Device / De =20
> > \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
> >
> >  The driver SHOULD NOT send to the device TCP packets requiring=20
> > segmentation offload -which have the Explicit Congestion Notification=20
> > bit set, unless the -VIRTIO_NET_F_HOST_ECN feature is negotiated, in=20
> > which case the -driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in -\fie=
ld{gso_type}.
> > +which need to follow the CWR flag requirements described in ``Section =
6.1.2.
> > The TCP Sender''
> > +of \hyperref[intro:rfc3168]{[RFC3168]}, unless the=20
> > +VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case the driver
> > MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
> >
> >  If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
> >  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
> > VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit @@ -1168,9 +1172,9 @@=20
> > \subsubsection{Processing of Incoming Packets}\label{sec:Device Types=20
> > / Network  \end{enumerate}
> >
> >  Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL -=20
> > and ECN features enable receive checksum, large receive offload and=20
> > ECN - support which are the input equivalents of the transmit=20
> > checksum, -transmit segmentation offloading and ECN features, as=20
> > described
> > +and ECN features enable receive checksum, large receive offload and
> > +RFC3168 ECN support which are the input equivalents of the transmit=20
> > +checksum, transmit segmentation offloading and RFC3168 ECN features,=20
> > +as described
> >  in \ref{sec:Device Types / Network Device / Device Operation / =20
> > Packet
> > Transmission}:
> >  \begin{enumerate}
> > @@ -1273,10 +1277,9 @@ \subsubsection{Processing of Incoming=20
> > Packets}\label{sec:Device Types / Network  the=20
> > VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{flags}.
> >
> >  The device SHOULD NOT send to the driver TCP packets requiring=20
> > segmentation offload -which have the Explicit Congestion Notification=20
> > bit set, unless the -VIRTIO_NET_F_GUEST_ECN feature is negotiated, in=20
> > which case the -device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in -\fie=
ld{gso_type}.
> > +which need to follow the CWR flag requirements described in ``Section =
6.1.2.
> > The TCP Sender''
> > +of \hyperref[intro:rfc3168]{[RFC3168]}, unless the=20
> > +VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the=20
> > +device
> > MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
> >
> >  If VIRTIO_NET_F_OUT_NET_HEADER has been negotiated, the device MAY=20
> > set the \field{outer_nh_offset} to nonzero value to indicate outer=20
> > network header offset, diff --git a/introduction.tex=20
> > b/introduction.tex index
> > 80aa67a..1c4cb33 100644
> > --- a/introduction.tex
> > +++ b/introduction.tex
> > @@ -180,6 +180,9 @@ \section{Normative References}\label{sec:Normative=
=20
> > References}
> >      Leiba, B., "Ambiguity of Uppercase vs Lowercase in RFC 2119 Key=20
> > Words", BCP
> >      14, RFC 8174, DOI 10.17487/RFC8174, May 2017
> >
> > \newline\url{https://eur03.safelinks.protection.outlook.com/?url=3Dhttp=
s
> > %3A%2F%2Fnam11.safelinks.protection.outlook.com%2F%3Furl%3Dhttp%253A%2
> > 525&data=3D05%7C02%7Cchia-yu.chang%40nokia-bell-labs.com%7C9bd29c383d0e=
4
> > 96aa3c708ddff2c774a%7C5d4717519675428d917b70f44f9630b0%7C0%7C0%7C63894
> > 7288674229109%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIw
> > LjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C
> > %7C&sdata=3DvhqjeUh8%2B6VOKIe3RF5WxlMoQwNkC3CacP0C1kN60fI%3D&reserved=
=3D0
> > 2F%2Fwww.ietf.org%2Frfc%2Frfc8174.txt&data=3D05%7C02%7Cparav%40nvidia.
> > com%7Cc6ffebfc748f4772784708dddb2a50c9%7C43083d15727340c1b7db39e
> > fd9ccc17a%7C0%7C0%7C638907696998232587%7CUnknown%7CTWFpbGZsb
> > 3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkF
> > OIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DjRjpor%2FkXifPfp
> > t7IFBo5JNF4%2FlE8pBsw7CMT4wS%2FRo%3D&reserved=3D0}\\
> > +     \phantomsection\label{intro:rfc3168}\textbf{[RFC3168]} &
> > +    S. Floyd., ``The Addition of Explicit Congestion Notification=20
> > + (ECN) to IP'',
> > September 2001.
> > +
> > +\newline\url{https://eur03.safelinks.protection.outlook.com/?url=3Dhtt=
p
> > +s%3A%2F%2Fnam11.safelinks.protection.outlook.com%2F%3Furl%3Dhttp%2525
> > +3&data=3D05%7C02%7Cchia-yu.chang%40nokia-bell-labs.com%7C9bd29c383d0e4=
9
> > +6aa3c708ddff2c774a%7C5d4717519675428d917b70f44f9630b0%7C0%7C0%7C63894
> > +7288674266369%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiI
> > +wLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%
> > +7C%7C&sdata=3DAjjuXnQgsRppd33zhfiyfkIaWljEuCZR8T%2Fl8cvXby8%3D&reserve=
d
> > +=3D0 A%2F%2Fwww.ietf.org%2Frfc%2Frfc3168.txt&data=3D05%7C02%7Cparav%40=
nv
> > idia.c
> > +om%7Cc6ffebfc748f4772784708dddb2a50c9%7C43083d15727340c1b7db39e
> > fd9ccc17
> > +a%7C0%7C0%7C638907696998249586%7CUnknown%7CTWFpbGZsb3d8eyJ
> > FbXB0eU1hcGki
> > +OnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIj
> > oyfQ%
> > +3D%3D%7C0%7C%7C%7C&sdata=3Dq7NaQPhNzVlOz0bGZVTw5ZYWFcq412q8J
> > 57YHxTpkMs%3D
> > +&reserved=3D0}\\
> >  \end{longtable}
> >
> >  \section{Non-Normative References}
> > --
> > 2.34.1
> >

