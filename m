Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA66115AC4
	for <virtio-comment@lists.linux.dev>; Fri, 12 Jul 2024 04:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720758700; cv=fail; b=jkRwVCxIfPgXKvFjOE0chtEX1RnW/O65ALIf0L68RfaDcFWjkcXO5ELUnqx7u9p2wKh5nnvJ93mqdDTQuTfSByJ5AEmy0vgctr0nZ2m1phgJ9dNap1DheyFB7sF4AHVyX3+SqUlxxyuAN6sfn520ptqq9vTK0XqGs0kAFM1pjLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720758700; c=relaxed/simple;
	bh=F1EIzo4hfEIIy1U7WadKIugi2IrRBSNXi2eWRycFSEQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BGZnBV9WbsqL3qBLtJNK34CpMPvHr2kZvYNV3Qaj7njrX0KCUhmMt0nL8TB/tmgIPNkivNit+yKjh+lbmZJ5lSTZRQ5LF7qvGKLfJ45h8axtMZEGevsJ9EQpMaEWN5Pp7n7JNTyoedtW7dtlu/uudRR15AcFm+qeoDohkM/ua9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dPVRRqja; arc=fail smtp.client-ip=40.107.220.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dPVRRqja"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6WykQE/Nww+0rV7xSemxMscPvtgGTaJPyvPhKlnvoRfheGLFOlEw4RladqsgyTfbNV2trYGoj5WKVNtEu30kZ5WVPFseQpnxrZcdlPYfDAjfBGsB+H14+0WpIBiA3kKf1Tx3tr6AHHSd2bYYukPWyWRHNjSc8MFWsAVq/3BbVBglKrWASoyo+rqOtEcKWFyci+syTSw6cYmKprxl7dUjtO1StmrLx/dzTQsgf/T8U/m1P4TPfeT9MDdiwH6zoleCcO1Y3uLX2a7/PubQzcX29ZxoT18OLxaWl4q84wS1SgqqworLNt9BOGyyO+J6fjcFQ3O3S2OzHV++W5uHTHiaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1EIzo4hfEIIy1U7WadKIugi2IrRBSNXi2eWRycFSEQ=;
 b=mQ2lh3LKH//v5KgEdikoRAt5kqjojZRx2tlNqQqd9pYGYeD3hZbdzyvO5pLpVBBwQIhrpDIB7Hms7421G4zfn/JPta5Zb+cdGSmP8bgJo2PBfem5vkYIyepgRTczvwEgyrQ6jdsQGlkpYNJggztNl9pfJR/lfkjRswFBd3sKp5Y+sbyYbYwRbqRryIosrPc5vqABo0ci6nAApxqhoqKwQXVRD5Go35BJ7I+gQFFBJuvgfTCd28H38DXUvtpGmCMfw9ar1RxeNAhqcLz62Ym9v1GuooVmbC8S6y/TOXWHuibCCxQgfcN3p2qNF6FZLbbxZ7lOYwsZI1NJvryAzoeNNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1EIzo4hfEIIy1U7WadKIugi2IrRBSNXi2eWRycFSEQ=;
 b=dPVRRqjaDGIIrm+PEY5fguDrQxK3ec1qB/mYngCM+PSEDjax2D9tEwgeb1Uxonp/9rKs/BH9q0ILgwtVCvDa/Kvk7Sryds82wWdgiRLzeAzxuEXAH7ZCPPXEkA5qo6nDaAsrYw5j213WeqdtQLBc8cc2E+H1JlDb0T7P9HNt3ALUPaJiq+WIPgu7lj8/9YKEZUXO1TEsh8aNYprdCUoAYyHGqAYjAP0cet0bJJ5wBVm6hS5iAyzJAGLGbwTyFWv1DgPJGxsbKsa9WPNS4nB1BV6vRsXQzvwtDX9F3hzv0h4ownlQ3jHJnZdsus5bk1erQXxOEB3hPG8w7wY78E/58Q==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by DM6PR12MB4282.namprd12.prod.outlook.com (2603:10b6:5:223::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Fri, 12 Jul
 2024 04:31:34 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%4]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 04:31:34 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit
	<pandit.parav@gmail.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>
Subject: RE: [GIT PULL virtio 00/40] virtio master branch with fixes and admin
 commands
Thread-Topic: [GIT PULL virtio 00/40] virtio master branch with fixes and
 admin commands
Thread-Index: AQHa09BW/V/cYp8DiUeL3lsaq2KzQLHyG2uAgABkaoA=
Date: Fri, 12 Jul 2024 04:31:33 +0000
Message-ID:
 <PH0PR12MB5481C8E3505E126AE72FB620DCA62@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240711202352.3228345-1-parav@nvidia.com>
 <20240711181520-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240711181520-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM6PR12MB4282:EE_
x-ms-office365-filtering-correlation-id: 60f67a76-d457-4513-5f9f-08dca22b82ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?vb76AqvHMkUG3p55dK5lfnd/n7aeXtWiT4QXloQFHTBRSCwJuMMNqA6v7CIi?=
 =?us-ascii?Q?BOLcUmmUmdcTXx/OGmhIdVP73ViYknqKEX4n9pH9kOq0R44tcQdCMD1RLsji?=
 =?us-ascii?Q?9hTqupzerfDCqrJWTorySN+3ESnLllib3dPpFHZuc0rS/q7j0v5Y07SdT1Qr?=
 =?us-ascii?Q?NDapBNMXLIA+HAG9vSxDJh2gtVrNLwmXDh24KGw7VcdN9+OwB/3M1Ma1orlY?=
 =?us-ascii?Q?8bNu7VkRr04vH/JXmA9/MbSQZ01dmYiEXI1N0zNqdydNgHkhCoUHavTc1nQF?=
 =?us-ascii?Q?fipZxf3Nc19WtMK1OFURueQm3vrcT/7q6It2mUH6jo/83MCmP7eF9JWUrjN8?=
 =?us-ascii?Q?sljWf0dg6YhbOXJeqbJXrqmnhbURxkcbWW+ZeyPgCTFftjPYbTnUrPvY0o0w?=
 =?us-ascii?Q?CrbHntySfqz9UkMNoaWnPokDBXJfhDpWgZMv3yWMDiUtFqXVZzhwHM6WBpAS?=
 =?us-ascii?Q?ILXuph6G19lfW0uIYFoGhIpb3Ok3K3FmGXZbEgqHAOY/MO2Ta5NZD+Iqxlnb?=
 =?us-ascii?Q?EgyJuvaandRQBbT9Z3cdy8xEqMXqWsd0xyRUfF3n+2L6/fG/AAg4D8Y73CD3?=
 =?us-ascii?Q?1uOiJu7IVALGk3T8pLM2THBuFAifFOhd0G8jG/orLLuEtkvecnIpzfscOFJr?=
 =?us-ascii?Q?+jPmlccbvUNIb+1Wcq5cUxVS1ZN4qegMmCSBrzBXQNoO+fmLC/nII+5k+YWu?=
 =?us-ascii?Q?tKCNsQ5RbyN4PpEBoqCtmSvBTWQhAPUWXkgm7Bl9fIFpbBTfH0B2LB7/Ie3m?=
 =?us-ascii?Q?PQcs7LwiaBjC2Vat2U6NDjYzCfoYjeOAl5hK0GZCYX5nNdmfLTXxF3QE2keJ?=
 =?us-ascii?Q?sM8nf/ApzexkGQMKKfMKXd1/2NJ9tIkIcXmkDXctBX79OwE+1eTVn3bwxNIk?=
 =?us-ascii?Q?r0cjm9b38fS5qor4mDSdF3BPXgvho2vrd1jCBF11SAOhMac43KnkylpRA1Su?=
 =?us-ascii?Q?yljw9B+zARlNfd/0Tg6M4EUG3AUc58qnCOIvLm+CNHsVUvj24ZnqJcCFfrbG?=
 =?us-ascii?Q?JnzJUn6vfQKJX23TdxnnOf56z8FP71+g0cuUuYMugifm7B5eOb1uMNZl9koP?=
 =?us-ascii?Q?PN99W15JnOYwoo9kmg3QHtub02Okmt1ah2REDzzyZ0cIt5GbpqqHhh9tr6Pi?=
 =?us-ascii?Q?kXC8sWq3k8DWrdUJ8hhJKUDthTadSISstnxM/nZT3mFQVMZ6RoLZbITiICnn?=
 =?us-ascii?Q?xzsaXh2xVilIz5yzI7qiWFoKqwe63ZtF78igr3SmcoADWLuiX1Ey20bSeQA0?=
 =?us-ascii?Q?ZIfSh00OzSSvBiQ+SCPonpRgQ3QBRlWYVLknMVQnj0cZuA7xLwaWA9tY/Sgk?=
 =?us-ascii?Q?MZGWoRiysROIWJQLyAwxGnSPpC47HUB0Qvt+q2rE+7PI4AgbZtxVOCvDi6gS?=
 =?us-ascii?Q?0XZWDuU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?m0CaBKQEaZ2mrwbx7iSqVXyYnnGdF37BHrYH6W3aqp7bfgeokIL0DzhG1zBU?=
 =?us-ascii?Q?Vw/gtqEDGE6+52Jq0DW0EPR7HriiovW+lhzi6qFSUC0eKLWFwVww5TR3VptJ?=
 =?us-ascii?Q?tixNHHdTYeJQczDBETGXJycI9Y0IFJcG273l2/kBfWbRf/O3w1vJd9KsxxZ2?=
 =?us-ascii?Q?FaC/aBsIrbEil9DDNL+H0puiYJxt3v8QEROx5ze2GpezQAI6rlbIeafeNADl?=
 =?us-ascii?Q?9ezTh6GjS5JPo1OWVUJ3hBEGu+lsJW6KZocdsLXzfDE5fQ4FipqoBuDd+fN7?=
 =?us-ascii?Q?PBce0wbugqYt469LucdBk8wuSQVuLrhWqeFEQlOpP5jk5/X0rwxp6dX98zwS?=
 =?us-ascii?Q?Z5coWe5dtb6PzV8LPqmH7LbFxK7Tb+B5SEabkFUCbiI0Q79vL7fuiOV4nPU8?=
 =?us-ascii?Q?nYoXJ1qbnfBD8putnF8X9M4WT+PsnJFj7FWEN32f2w979buAYjgg28zo1Ivg?=
 =?us-ascii?Q?abriC/OK68sdKYwNQ5Raz17tfX3mIN/7lPLuvMIGd1mqoexFdTSdy4cPfb36?=
 =?us-ascii?Q?I1ssMMlZl4cgPlK8Y3rJdT0PXBoKGo1yEXj9n0ElzinIDy0RFz/pE1IBiZkn?=
 =?us-ascii?Q?mfYI3sU7z96cJeWlPh/6agCGD4kbi7HTtOH8UL1OOVcfR1Ygyg+7WCf3IjZe?=
 =?us-ascii?Q?bO1H9aDfFXYbI2a6dn9JwPszXe6JhKThk7Jb/5J0NhYP1veNg1hgcg4rG8yC?=
 =?us-ascii?Q?AiOXiJ+9xUDLEhwsUwmCshf4gdvdtdPK5iT7WLD3ZvazSR9VXxPxqRZqL0CH?=
 =?us-ascii?Q?pYJpZml5Wmfcr7x7bFXuSKZLHzU6lLE6Y+Wy+XuUIXIo7mJ4S0AvRjmGeu0W?=
 =?us-ascii?Q?bvjY9eHBQlNVClyLK9HO06SCFff+RHxT3FNOOiDqhQo5GVi7eLP1jTgw9/Gr?=
 =?us-ascii?Q?ZKUEPKB3H0MbDykdDMlW8cy5uoJ8ykhr6wrhjP6OaRS7pN5xD982OFO9b+d5?=
 =?us-ascii?Q?wSqP6yhi6wZlqp0J+uz42Yc+VWvN/JqWKTLvFvuRBHEDS0Uy0KkTrvJ5B019?=
 =?us-ascii?Q?xxPFk04+uUYYy+oQ2i4YiHgJdTZjROTMDpqOhdrOOn4FkB6mfwzi6SdP3XH/?=
 =?us-ascii?Q?Xqo7QhwsCH8AQHzCzKkn5jI9yEGmNUxZ7Ez+NugpaJ/WPcmiGDoxcxMMFN6i?=
 =?us-ascii?Q?0g3TM6eCJP/d5QZAnb0w+pNQIuUkpStpPoQDZJFbNH9By20GEfCKM0AWwlfw?=
 =?us-ascii?Q?ljJH2ZzqfeThnNbA6sKs1W3H2IOQrnIZgDkN5KwUujyUC86p8UGOOuqdpChp?=
 =?us-ascii?Q?VYrfqFy8uZcwy2MCznKXQev7J2mEFz+35z3bX7s5WTduLHUeD4/NzrMps766?=
 =?us-ascii?Q?MO0jYvfx3EymM50W3o9hxCDlXc5FzXmD1Pl0GTbiY8uFqN3okGCaihOBVNZx?=
 =?us-ascii?Q?FAPGI9htndtthHJdxMH3+/wtSQrk9XfuFDCsA5+3uzqy+hEcK8OnhjA0bJOv?=
 =?us-ascii?Q?iNbbxcIp58MueB6fhqHqyYBmn91w8cKDMxSd9Tr641vlQf9zJB68KfaQtY0/?=
 =?us-ascii?Q?IQrxMenhvcZlPu2Udu4Ea/iQLFFGlV5ZjOkz3njETZJNBX/eMONAIMXh2FyF?=
 =?us-ascii?Q?tMUD2ULc+cqm8GPDgl4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f67a76-d457-4513-5f9f-08dca22b82ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2024 04:31:33.8787
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y1auCUXKKJ2OoJO46iJ9uGOvalbOpcUadkXnAXx6WkkXuVuj6w2qzLwkPPv2bVkcKxWJti61Gn8izjuz1OdYnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4282



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Friday, July 12, 2024 3:58 AM

[..]
> Thanks for working on this!
> I made some changes to master, and I also merged master into 1.4.
>=20
Thanks a lot.

> I also see undefined references with this, related to device parts things=
.
> Which I guess means the original patch was broken.
>
=20
> So what I did is cherry-pick the rest of patches.
> Update 1.4 you will see what happened.
>
It is looking good.
=20
> As for device parts, you need to fix them up.
> I do not remember if we discussed it, but I think you are abusing hyperre=
f for
> no reason there.
>=20
> So my suggestion is, send a patch replacing all the hyperref cuteness wit=
h
> simple ref and fixing broken links at the same time.
>=20
> OK?
>=20
Ok. Sounds good. I posted [1] addressing your suggestion.

With the patch [1], please find the pull request reference at [2].
[2] contains the pull request with blank line merge conflict resolved along=
 with the change of [1] that you suggested.

[1] https://lore.kernel.org/virtio-comment/20240712041433.3246718-1-parav@n=
vidia.com/T/#u

[2] https://lore.kernel.org/virtio-comment/20240712042628.3247126-1-parav@n=
vidia.com/T/#u

