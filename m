Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013047.outbound.protection.outlook.com [40.107.159.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADFB8836
	for <virtio-comment@lists.linux.dev>; Mon, 28 Apr 2025 07:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745825336; cv=fail; b=KsSadl+SqF7+PtKFX6ZjxCrzv13h9TCvYvkyB/EgeOp7ls3hk8AX1JOTJTietC/JHwyAAFFiNZIyitm24Q+l+5VTh2mn2u26IlM99+k0aqVJ/Xkvc3JJ3JC1gEf1Hc6VuHD38RS7BmEodhXGsob/BfeeHrECNYCMLOkjdRY23uA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745825336; c=relaxed/simple;
	bh=O1F2A4GOyUjJIw47k9lmEMmux3f+6vxlm3mRBVtawYE=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kRVzDhwM4Y7LWjP0ux81yp6Iuac6uWIXRQXJzmGQWH1Mrk9aV/Z4LbigQgxeaB7CHgD40tWj2kC2EkLjvhYsvFkA1dIEEkZuXOhVW4nIg1+mAx29IvC0bDA79hmunN7w9a+sUmeaYgtnAohUo9kEZOMPxSD3+MIZh3itQJRmCgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=aWtRzPtU; arc=fail smtp.client-ip=40.107.159.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="aWtRzPtU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LRLfbrjPwtH9rGDS8mjHZTwEh7lGL5nKKwiekcMRPwxXSPvOYiXNfp8V2csiinlOrNpO41bLQWh1zpZprTsHWWAMjBGR3OytHBN4XJn9jNLy9F2G7OxYudS9t/xu+j0KDYO17o1HeoSNsunpJEQxX82E8c4qyYcaybb9Cdtv7XukLMMNh25DAZcwLHjuOM54pqzI0OHokzm89lpcRc8nP90o7uzyQz5+CxIYTG12iN6N2+PWUiasTWbHcdjHkUbqvBALYZhrQbYWpro15uL3L1iuHH4fbwAMjBxzGZw7WBMeZ5RbJ4BtxqcMzb6Ef9AJtqJrSHt4ym3LkAVXeqA4kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bh6ynqp6kRdNsUUHotSkctrtkzoSaAWG1fLrgaizcN8=;
 b=Nuwa/Tigv5jNwssQxK9hxiPl/ods9DBAlozubx34DaWm1myglea//9GXhkOXEJBKVSNEyGbY0Vsl3SiJs0mRnvcs5jHma4GUVMzx82t8pbZoWQu6Q9nTCvIAE6SEv8FvS4utM0gm5sgsgzSZQulzg6L4YzxJKs0SMuBWp+w77WtybF2JCEbSmwInVVxCkUjrCIzHhFGXR2kzpnldGcCBj/JsJ2NHm+kREjEbyeUJigwc4ioeJu9t/pCsURwf77pjcfwPwtqJsS+WVPC5BwomJtIj88HfQDqt/QQPJ5eHYS4C4ZQiOZzH8AbjGDsSBxBzcgKifTaEjRsCZmMrnNNp2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia-bell-labs.com; dmarc=pass action=none
 header.from=nokia-bell-labs.com; dkim=pass header.d=nokia-bell-labs.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bh6ynqp6kRdNsUUHotSkctrtkzoSaAWG1fLrgaizcN8=;
 b=aWtRzPtUCLSWir8CPI8RT72QC+7Uylfrbuw10oiYmy1nNFAbtPa/QOZ7WUP1rrX1yERS0sAtWMkwOorNdIFnVfY0xk5A7LYPGecmr3aQZtd6+0uC9kAZ08j2KCW6+JzWW4QdmubUADuiorMe4IgMxM8ognofqvU0GwXIU1LvWYK+5y6hw1ys6tMW8ZzIMyuTG5WtUrjCSy1lJ5B/opDQq5qrSB9e32ct/povjb8tTgLFM8agplr22eIHSym5uS9846UMuLpxyy2HghOttgNhbuFKYC9tIGbnxnyAGlK5lqzsknmkxOz99sTGmgemMVFTCyn/15OJIgGT95FSQFi0ag==
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com (2603:10a6:102:133::12)
 by AS2PR07MB9121.eurprd07.prod.outlook.com (2603:10a6:20b:558::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Mon, 28 Apr
 2025 07:28:50 +0000
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56]) by PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56%2]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 07:28:49 +0000
From: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>
To: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "eperezma@redhat.com" <eperezma@redhat.com>,
	"ij@kernel.org" <ij@kernel.org>, "ncardwell@google.com"
	<ncardwell@google.com>, "Koen De Schepper (Nokia)"
	<koen.de_schepper@nokia-bell-labs.com>, g.white <g.white@cablelabs.com>,
	vidhi_goel <vidhi_goel@apple.com>, "ingemar.s.johansson@ericsson.com"
	<ingemar.s.johansson@ericsson.com>, "mirja.kuehlewind@ericsson.com"
	<mirja.kuehlewind@ericsson.com>
Subject: RE: [PATCH v8 0/2] Update ECN and Add AccECN feature
Thread-Topic: [PATCH v8 0/2] Update ECN and Add AccECN feature
Thread-Index: AQHbr+nGHDNXAcfwtkOsqWlB4T90wbO4vhxQ
Date: Mon, 28 Apr 2025 07:28:49 +0000
Message-ID:
 <PAXPR07MB7984EBC6EA1AC23A86872821A3812@PAXPR07MB7984.eurprd07.prod.outlook.com>
References: <20250417224044.21348-1-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20250417224044.21348-1-chia-yu.chang@nokia-bell-labs.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia-bell-labs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR07MB7984:EE_|AS2PR07MB9121:EE_
x-ms-office365-filtering-correlation-id: 85155694-99b4-40c1-ac43-08dd862651c9
x-ld-processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007|38070700018|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?g0zVTNFNOp+S0E36av+lJmVQfyWvJo3OGDEK6yeRwvIU+U+o6FtWyrzqzgtZ?=
 =?us-ascii?Q?xQ2K9UEBh90QSvS+B3z30O5cHaQuOxwX2VT/6QXI82CKzK6jSSvie8HIl6Ad?=
 =?us-ascii?Q?JzpQ3fVSEuj/QzauyAo/v98UW2PkiAsppCGnxcZnJ1pGxk1nWNC6z4sbERHS?=
 =?us-ascii?Q?mfXJDveuxV5/bw+h2Rx7KaWlqNR52wBLa43Y9Kd++V+zdxDt4c3voEl02Rqx?=
 =?us-ascii?Q?5nt48To23ejbZlatCy6U/cA5XQ6ExPaitMbTFb3wG9XBOTxNNBSTkZFQBhjn?=
 =?us-ascii?Q?Kh7jJvwXnBzxy6W+SkDg0JMTXRBb9uukqD585bQA8DvYxx4qQORUYyZZpISZ?=
 =?us-ascii?Q?kNbA4AAupOwNgsJeYjTLAvs+6ANy2LPnJI2ho79f5f95hslKC9pnnHZvlR2u?=
 =?us-ascii?Q?esdA4teDhoedOSv0ifuuh/VCWAPzwn4fFbcUdcBXxpTLEPGMEUXUOk2PwSTT?=
 =?us-ascii?Q?5fO9yTyhH56k5YPPV6OA3QYTwCSkJLJWjUpxhLROKFYd6N5mZ4xcoPGGn/gk?=
 =?us-ascii?Q?l/DvHTMdRWmKpL+upPNCaMAeX/NqEhKa7RzDSzROL37fNo0kPyOva5/jUGQ4?=
 =?us-ascii?Q?WsmycJSn6THRoUH2kBmp8iC1TAZKwvRq3wn/4mrWje5ryDzJvz6V0NpJEupS?=
 =?us-ascii?Q?59vboSt+A4uzRK1sAPvF2vCcoiygI6EJiO892g+NxKAeSGvq9GMdtsQam3F1?=
 =?us-ascii?Q?lRtFoswdlKAR8xjEg39xnzquG19XVJOIq+qKOpMTYycIvHMIX+8yYSC3xXAW?=
 =?us-ascii?Q?kV7j7d73QYiH91t3MwRcwyjB0OO4tYWzcn5Vst+/ACoTUg/8Va4Jes/5b9DF?=
 =?us-ascii?Q?Xk3yRuPIZsBcHJU/KuWzIU+Uw87DVWe3Smv7FGyOTHfd++78Zm+TGsDpUPji?=
 =?us-ascii?Q?bjTc8A/jjMYpg7T6s+o15jJoP8h3NTGcO0X3Mi6eFo7c4/asVu5FLW8nJjDU?=
 =?us-ascii?Q?EutpJRC5spwwkYThsv/RqXhLvMVwrArMDb+jlhcw3Djuqtkj52/nAqlCLkIE?=
 =?us-ascii?Q?wUk4TZA2f2ALQt2VRsvZBHxUA8VFs65Y5LrBv6rd2CcVu0w29oWAHg4+UpH+?=
 =?us-ascii?Q?hOjBhzjqGVREAbPN2bgvJ4hPm22AcX2XAevqvQjtsUsZB/hgwgFlkWup3ylC?=
 =?us-ascii?Q?aLI3e2A/QeyLfbplWz8m06kIHf6C5lyS+uVpcsK7Pw+UmAYWEImYssvqGxgZ?=
 =?us-ascii?Q?4BY26vWDQ/Sn36lQ59hit3Q3+itGGdrEr6bPlmseGiw4HTdNakBzDyLzr29Z?=
 =?us-ascii?Q?FOjbrbDsZ5DIxq+3yWVkjyCnXNlkEfMIvF3CU7h/1hulKU6X4nINiawsIdDs?=
 =?us-ascii?Q?uxPFi+1OeCVosUiN7Gso+BhseSvpu5NW3fp40qBA+Hws8HGy0Nl8JWbQARfO?=
 =?us-ascii?Q?3jPjPmlDxRmx5XvjVwW19ZKsuJ1O7fxdgyiNZgOxPqgchBJK5Y7NT84gozas?=
 =?us-ascii?Q?bhW5u+DgsH6cir5euDrn7fyLd9ao6KrCjHo1zfFk/O86p8+4vQkTafuqdagW?=
 =?us-ascii?Q?CLmpar0ayQPNois=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR07MB7984.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ccZm3EYI6phQ5CviwIX03RG3h27v4hGvEcYzk2J0h7KxQD5TzZ1emSFeNKMM?=
 =?us-ascii?Q?xpWgo1UACeUzQBifCfQH/pnQ5fwd9WV1scgclw1yDR1NY9sm6JIUIHdK+osg?=
 =?us-ascii?Q?4DIcSjS50NG3h81aksB9jW5gdPmnXusUa3TP+wFl6NV83BYJyZhLnRIDraiz?=
 =?us-ascii?Q?UucQl0dnoUf9KNIWqfLfx/sfweVFeaGjDl6W4ce0BEfeaYIRI+RbWWbxPLYA?=
 =?us-ascii?Q?iFO7DkVCN2OHWzpekR5yqZNNns8oy1ijDH6JFDmF0aDd4pfmWCE0Pj35x6WN?=
 =?us-ascii?Q?5spBSbniomUxINEASSM8rS7H4So+WxWUeqK4cDLIJb7UzbCwgga72h56kUwV?=
 =?us-ascii?Q?Id9XsVu7Xhcxe+7gHGjzwuSRA4fS8pGYcvcba/ItwK6v5x71kGYcBdA385pi?=
 =?us-ascii?Q?Pp/pMGPqtcEE6VLH7GxYkfdObdaFGBcJp4/79UtY/p2tEsUepNVsUjUIKNj7?=
 =?us-ascii?Q?RAmcjAN2pFRYtTYPz4tm98jMFrWjTZh5AVU5Z7JeIZIa4Q95sBf2/XU0LdH/?=
 =?us-ascii?Q?d6MEriZUa3S8i/9Q1vnyae0GJZViCQ8tdUetDMWcLbKCJS1pOp7tXiLJJuqB?=
 =?us-ascii?Q?ceV75zqs7m4RwoGKv70Oqpugz8bZfmAtNF7Zoa51C4+SHVpV1GIPNtKdB2uU?=
 =?us-ascii?Q?QK5msHAMEydJ42ZxNTla1VgqT45Ai6+OhNeGNYrZDjyGkHgexWRJxi76lBnR?=
 =?us-ascii?Q?OxHXA0NhrX7hroHa87skgjBCK4KkpRQKd81cNPNvQ9zsUDecS0eTz8zjJU7I?=
 =?us-ascii?Q?2rDot11iKvZVytUAWz4wubyaLHyRkHoh/WNq2mTHMWv8XWnrxGCe+NcJ95By?=
 =?us-ascii?Q?cK3eHftpGjsuaI1OvAwDHTBYrmmQEDqnT/V4dpYTOG77kNUUS5zTJTacCr0V?=
 =?us-ascii?Q?gG0WPavZpc6CrR6pbBHgTE/IHN7sboGWaLbfD0kriRGI7D0vMiVOxGsgA8Mq?=
 =?us-ascii?Q?8PyTD2cJj+wY+7ioCMLs1HD03qb7SUYYu72yNMDTJ0FQXNi7ciLSKK4W7Dn3?=
 =?us-ascii?Q?0bo+mhN7WwgEo/x7zTZE+BmMd+mszIJcqthbn3D+Dh047fJ3L4J6sgxI9uej?=
 =?us-ascii?Q?V/KvuTp1fwPDbIBGzaUAnsbzZFAg6HcBvu5tTF9emZlrVQzrinUOtbYWJIew?=
 =?us-ascii?Q?ovhOn/50tfQPnYeX8n246/hVJGNBBBGMy+buyAPJ/wd2t2esL+baghHYfWGX?=
 =?us-ascii?Q?VIrwgGzJOuoxxNvrHUQiB03tcZG1VfgO0N7+cmuM5SGWqgD+W8kV8Yc+5wDE?=
 =?us-ascii?Q?K0o09HFFXkxrHc74YmDpzkXmb+z6NO6f6BH7bcEdh0ew+d9jZfRLo1SiDDBl?=
 =?us-ascii?Q?DMEFK1sAvqlz5nj/9IfQTaSmcSeiEP+f2ZnPcWcbV/2i7kAyKqv26He1lLUd?=
 =?us-ascii?Q?SU5tqLiRAnaphUc+chmNjSlYrXmgIN77AEqNq1BJ97eVK9tlyEt/k2ka7Vgr?=
 =?us-ascii?Q?esqrZm34+KM/ncPurWna3pjce+kruX0tYhUuJk/E7LMtQQrEF4L8p9YK785h?=
 =?us-ascii?Q?duhRjZ6iYzM10nPybYGbd89wSc3WrgbgcEKM5T8UrtlGhdLNpJcL13sdjzHI?=
 =?us-ascii?Q?uUM6hca/NDe58EkWkiSYPy74IIrkEWGpEm7V0lhIQuMAxQWlKq6BfCw/kqpk?=
 =?us-ascii?Q?rQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 85155694-99b4-40c1-ac43-08dd862651c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 07:28:49.4951
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sT53/gO2Ws303JLisGFPTAHoCSu8X4ZCIU1h/Iz550ZCl9G/i/6pjgMfuXmCHI7tTk9yUk3vV0Sd6L/p0W/mBX51yM39uAw/PO18g0zmatRxY5a8C8l+n9gIR52eGVIa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR07MB9121

> -----Original Message-----
> From: chia-yu.chang@nokia-bell-labs.com <chia-yu.chang@nokia-bell-labs.co=
m>=20
> Sent: Friday, April 18, 2025 12:41 AM
> To: virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com; mv=
aralar@redhat.com; jasowang@redhat.com; xuanzhuo@linux.alibaba.com; eperezm=
a@redhat.com; ij@kernel.org; ncardwell@google.com; Koen De Schepper (Nokia)=
 <koen.de_schepper@nokia-bell-labs.com>; g.white <g.white@cablelabs.com>; v=
idhi_goel <vidhi_goel@apple.com>; ingemar.s.johansson@ericsson.com; mirja.k=
uehlewind@ericsson.com
> Cc: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> Subject: [PATCH v8 0/2] Update ECN and Add AccECN feature
>=20
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>=20
>   Please find ECN and AccECN patch v8:
>=20
> v8 (17-Apr-2025)
> - Further typo fixing
>=20
> v7 (15-Apr-2025)
> - Fix typos in AccECN patch (Michael S. Tsirkin <mst@redhat.com>)
>=20
> v6 (14-Apr-2025)
> - Shrink descriptions and make more reference to RFC3168 ECN and AccECN
>=20
> v5 (06-Mar-2025)
> - Update feature bits of VIRTIO_NET_F_HOST_ACCECN(69) and VIRTIO_NET_F_GU=
EST_ACCECN(70)
>=20
> v4 (05-Mar-2025)
> - Update commit message of AccECN patch
> - Add reference to RFC3168 ECN and Accurate ECN
> - Simplify feature bit descriptinos to avoid duplication of text
>=20
> v3 (21-Feb-2025)
> - Separate the original patch into 2 different patches
> - Fix several reabase issues in v2
>=20
> v2 (17-Feb-2025)
> - Rebase the patch on top of v1.4 virtio-spec
>=20
> Best Regards,
> Chia-Yu
>=20
> Chia-Yu Chang (2):
>   virtio-net: Fix ECN feature descriptions
>   virtio-net: Define Accurate ECN feature in virtio-spec
>=20
>  device-types/net/description.tex | 77 ++++++++++++++++++++++----------
>  introduction.tex                 |  6 +++
>  2 files changed, 60 insertions(+), 23 deletions(-)
>=20
> --=20
> 2.34.1

Hi Michael,

May I ask is there any update on this patch series?
If anything is needed from my end, please let me know.

Best Regards,
Chia-Yu
