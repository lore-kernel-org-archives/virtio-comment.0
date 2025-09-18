Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013016.outbound.protection.outlook.com [40.107.159.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456FF307AFC
	for <virtio-comment@lists.linux.dev>; Thu, 18 Sep 2025 11:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196767; cv=fail; b=a7G+rKnX1NchJBbv7ypRhtkFw7m21D51awx2f4MNoRv0CzvDn492SACeBE9z5ynViDkXzPdQaumpk1MsI/7p1cwUv56qY3pi89TYbA/9OjeZN4M7RHYnKvtEC37Te5Qo/9TVN3NxHycgcfR1mtKj3gpR8dYw7/fxN7FSCLNubhk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196767; c=relaxed/simple;
	bh=ZBoeP9Hbbhh4nMqpBFBEEHmYSACeXi5T5hbk+gNKZ6k=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nj+wCC4loC2OzFnfRuG8e+2jXkcdqcMqyB7OtWFpAx8+DhxlHOEW96SLZs552s3y1UmkpNKcJPvA0wunBjj0mI+9z2y7/xaT7yIFUDxeCPaDGKQA39OrBVcACIBh2qITgLgzXLrn8BX5PpE5Jx5+ZliWDze4Kdu/fZe4xGCQSHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=JsCX+ulc; arc=fail smtp.client-ip=40.107.159.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="JsCX+ulc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lm71w+zaibHJlkk7GU7U0mrsuRwzkyxg9ACRP20uKHpbzsV/JT14d7ZL5wHZE1Ef2bcgfMV9MMPoooJiyPta4LTSj29800zKT0offPQQUY+TvuPHusIjMl6FoL9+RA9JMzGSNAjyid3uRsbVIp2BnZEh0NtNiTfzqs+4dphCFUUqzlLdQtfu/Vn/jHDQ40jvhMXK+vXGi9RKEUx3HcTaBnjrljO9xXr8NGPHUeE42cgkgRma4N3/mvoMhE3RgRVAVIDGL9uCMq3/xm613+BOMa1Kf4FTJ/ZsM9HChKekJgV8/TOxN4v+RzSe8dJGMF62QdX29dmJ9FbVIKeS2g45yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJP/GWqmDBApa2uojoxyfuWDKxpM0We8m1j8WNiWj70=;
 b=uM3PUUsHxgzXJ/Ugc33i2K5holLj73nFR0qjinBrLMx1jCrzfk2E1xAU3HY3a0UFb4/ROVM7wm2KBH/shN83HZ6zbYlgP3VUQX4ObVPkd5z6zGZ7UoO+XupfVUVU8wCWsm5RH5OKlhzBDvrmAw/jhD7NHrHSR3o3iMK0yEIceXv0l97pHBRkVEgtnAAJv/QaQvQz5VIwB14bptfLHFbcmixyrVLJxK8sCgOZ6dgLo3LqHxBB+9GSOmloIg5s8Uju9/X+sfwzUTIm6PAVO8EEyiGUeiDdDij2dEX/MOlXxEPwBxOQSjF2UVcx8Mpn5js1J/G0/lWV8O2rT9Uv4yMdJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia-bell-labs.com; dmarc=pass action=none
 header.from=nokia-bell-labs.com; dkim=pass header.d=nokia-bell-labs.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJP/GWqmDBApa2uojoxyfuWDKxpM0We8m1j8WNiWj70=;
 b=JsCX+ulcoyJtn/geS5hUTf7E9nIcCD87vVx7zWDplCGqOqKXe4cZX6oG7TUsGZYtL1lv9eAaDf7VF6RnDb+SaEU4eA+RTvfxXLjUIAx9AuZvbFIM6Aj1bt6OMXAXhBctGUyENFmYWyY7+WG5zVPDoHNkj4pCEx555bbQ5lodvzzySuSEilrD14tH5QVs261QciZNJo4Ku+Eb+7tNp0HRKbLCZmUe2qxhghEUgEMvqgBrPVz16EPuJCmoJkirJgfdFzZUjR786cj6ZQz+J4KO6EGJyVkpVmy7z/39iuHEg+SMreHDuncmdVTXQjXcqZHACwb1JBcuvcQV5aAVfj8wCA==
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com (2603:10a6:102:133::12)
 by AS5PR07MB10131.eurprd07.prod.outlook.com (2603:10a6:20b:680::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 18 Sep
 2025 11:59:20 +0000
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56]) by PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56%2]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 11:59:20 +0000
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
Subject: RE: [PATCH v10 0/2] Update ECN (RFC3168) and Add Accurate ECN
 (RFC9768) feature
Thread-Topic: [PATCH v10 0/2] Update ECN (RFC3168) and Add Accurate ECN
 (RFC9768) feature
Thread-Index: AQHcIOJD894F/xx4g0KgJPiCCFjcT7SJiF8AgA9cXVA=
Date: Thu, 18 Sep 2025 11:59:20 +0000
Message-ID:
 <PAXPR07MB7984B6F7344CE2A109163C54A316A@PAXPR07MB7984.eurprd07.prod.outlook.com>
References: <20250814120118.81787-1-chia-yu.chang@nokia-bell-labs.com>
 <PAXPR07MB7984E74ECF19E28F857E7AA4A331A@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <PAXPR07MB7984E41B6DDA5416F6B9067BA30CA@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <CY8PR12MB719560F13B3D8DD4D6832758DC0CA@CY8PR12MB7195.namprd12.prod.outlook.com>
In-Reply-To:
 <CY8PR12MB719560F13B3D8DD4D6832758DC0CA@CY8PR12MB7195.namprd12.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia-bell-labs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR07MB7984:EE_|AS5PR07MB10131:EE_
x-ms-office365-filtering-correlation-id: de6e0af6-3164-462a-7fb5-08ddf6aacd3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?xzMySZHrorvuDKYM+d4TFC403271pgUHnfWi324eTbKoESgS4bgji2J7yyP2?=
 =?us-ascii?Q?vodrz7RKJhRxIavBIcvDc17cAdz78dSOk82Znhe+zfixVC5pnDtLHu7zQDB1?=
 =?us-ascii?Q?avek/Mkc6Qy3Khw3g739NOkjmlmwGmQ4/gTvOvBeAiCoZu00OeE1OlpgpSmW?=
 =?us-ascii?Q?GShPEHFoj3FtKg1Rf10K/Iu0W/rBEXKq5xKyDVMQAePLfbebk8iLA0OQcOJI?=
 =?us-ascii?Q?BLsT52uHSw9RKlk658t7BqdQnjVMsD2J9RtAp/2FbvK2Vwm7FpTU4qjHuYfk?=
 =?us-ascii?Q?IfaQtzm2yKK33qs9i2WFNaY+Zzi1+AEUerNP1T3RbCBZdoBOUQUNsGmfag7B?=
 =?us-ascii?Q?D9//5rViKe2MUT6SPGEvo5SvOhqg2gLqRU1K5j8/oCbWtKucQiYXYhGM2/3v?=
 =?us-ascii?Q?mdwUy9lNFT4ZDPtbKmeJcnVkcTsCj6Dow4huxvl3CKv7dCfyhqFcZhz8qD9Y?=
 =?us-ascii?Q?sseCgwICBWU8wJLBhfOAJ0CdNSMmf1Eelwf3UvhyX39AKCC92i8P/ygC16QN?=
 =?us-ascii?Q?7cJ35AklzKL/jVOnVuIriEIRhDJjuImlLFTIwslaivy0Difnd2Y+hGggcx2Z?=
 =?us-ascii?Q?xhvwl+NpoUc7y2z5mLtr4RyzBXd7kIz5G/j9sLmMPIoiWEcXbc79LCDr8k5W?=
 =?us-ascii?Q?FoNLMKqG/WX437QOc1oP82BcNxPhDhO0qK5dGePCz2lfALshMbASO1udtEAA?=
 =?us-ascii?Q?WDz8SI064ZxV6lLRJG7RpPthEM3drth8+iMWy/g4emWuYpi3ZUBojmNP7vO6?=
 =?us-ascii?Q?rV+RGjlnXQi+q0BSlLsLitc8kBDX5ZsXa5wKXn4voqFnTfBpkZwunfHA1jOP?=
 =?us-ascii?Q?/pYmXmgd4MsPNyzlcNZE7bGdfLCjXsdZ61yX99gwpfar/yFjuw97mj4lkBSN?=
 =?us-ascii?Q?DWPXZkeMrUv/2tN4aorDDwmuKuTmgFd6pLrl+KtrC/zaPUzaXX4J1Ig+jhhi?=
 =?us-ascii?Q?QqAlYinjNgMj8NMf+9rGUfSYHX09W7xcDPdNDSsLXEoLURFvXGnSdgcKqd1g?=
 =?us-ascii?Q?Q6i8P43/Xun6j2hUTLZmJU5RILpsB8nnD/+PaAsVcSWj+nu1vb7j3ukH0PM4?=
 =?us-ascii?Q?Ue/7AQwAMnxn702SQFdQD7TRVHkBHpf4yeNjpw5CgQyA+O5g3NgJlvFep9ls?=
 =?us-ascii?Q?V0HUZ0LId94JZn33mUcx7uFU8XVHliux9mS59lL2ZNqJxhTgai6SXj4Pnbhk?=
 =?us-ascii?Q?7yfcfSLYJapcddsl5YCTTILxcmjctLekpEaWcoieIxSe16RuRub6g9Zzfxvm?=
 =?us-ascii?Q?lQJcQkktR5wUo3u+rHult2WKbItgzmbFKH7Y6y/K8pFbSC5YtfMf8CvmevPz?=
 =?us-ascii?Q?04gsoUk55gR0X8Pbvds2vtAIcbL2ZkCM34dFc2Dp7ks/SDPP/VmZrTQGmjzy?=
 =?us-ascii?Q?iFQc1b/QC7XpbDsXK77ioxmrZtQzTAZD7mmiMO0dCUtIe94HGHWvjio3tQ0Q?=
 =?us-ascii?Q?43QFblHDgX0cwG5KDKxQZOyqH1oUfsQ0yTMw4/oCmm4RMtnX2XPwfQDKWV0M?=
 =?us-ascii?Q?MsEUGHM34lWIDE1OEcOveeWtiM+2XMawtWee?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR07MB7984.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?sh/KJI1gibOF7JrqwbDp8XNjnljv1k/DR0D9u+gVaupEf+Pv9N4J9zunfJx7?=
 =?us-ascii?Q?cyQZVP9eQWX1b2ZHdZlrfltNN2IVoS+9GPgAhtOjsopK+NGyzTh9hljVa+9J?=
 =?us-ascii?Q?mOMRT4Bnty/G9V7apQ/vhQz9Mngskt3go+KunBDZIPD50SwiERY2aMiiZVed?=
 =?us-ascii?Q?dwX9lzmo1adEEoesWsoNBFF2R9/ZTvIMHIA19hhFvC/hyiU6uPRxDUXCGW43?=
 =?us-ascii?Q?aUmgof/PSYsMUGPUKzWTshygLYDMW0L/yHKVGw5n5lJVDVENG0q6KUE8HRhp?=
 =?us-ascii?Q?p0qcfHFTfgPtK+7Fa568uuffo+stFeYONOc+KHu8oyZzoKPQjCwqidglA+7h?=
 =?us-ascii?Q?6mFayIlx1lNUZGplRKB7WuUjF48o0ZWwN1XjWqO5FmszTLy7AiTFsFRcH/RB?=
 =?us-ascii?Q?jsXgIqxmKHcuPr59UgPEb1uIHKwTgcUMjlrdWERJ/+/lQIzhwMRlbc9rlsOP?=
 =?us-ascii?Q?wybB1X3S6zLz7pc7Vp/oP/L0W31iZ+lPfPKvT5830tyLWgtjHXr23kbQwSTm?=
 =?us-ascii?Q?hRqHBJQgSkyeS4/7GRQUOXBRnEm4t4Fi9gWAcjEIT2iW8UGQTRrayc0gu7a9?=
 =?us-ascii?Q?NMCTxCrW+iXmZ9lkjn8oeH/yooHYJSb8xSVW2I38Ef2/7d8sNJlCge8n3fA0?=
 =?us-ascii?Q?cVPD101ArdfX3sofo/BZNeHyfgUzB4q/6H7GKcylYXv9xwRBEBJEAO9zrAae?=
 =?us-ascii?Q?asYVwI4lTAE31XPpkSXV8RS3Za3+4zSwQTffqFCiiGXpRbK9nHw9SsyTLT1m?=
 =?us-ascii?Q?LGhTyWdFiPem+4IaNwmgO9kHQGAmW2sPbMgcYkZTLnnWC7o8w3pxAPHeT0+j?=
 =?us-ascii?Q?Ed6ynalkfaBRdBHuj0i1PVTuPpLG76F65e3Vo/tr/TdHtCSMu0ZYNT2aC8cg?=
 =?us-ascii?Q?+cTHODzvRl0I4qD8mDYsEQZyMpbk0LWnRxOaH0yZW+3ZISc9sEcM1wtNQ2a7?=
 =?us-ascii?Q?bldj+onPXEupjUXutrmOyxvMFcwNgovBQOsO9cpp+Wr4E42poD9IsScgbC6T?=
 =?us-ascii?Q?S5PwpC6vpmCciWuUm0ec7+RBGcDPea5wkBGQEFyBr82bh8potEZxo8Qs5BpG?=
 =?us-ascii?Q?JKk5FtgDFvXRgnIHfrJvG2LGRaykBPfFCiJWPYNXHpkxOHeA4789d+DJEqMs?=
 =?us-ascii?Q?GfrDXqttaCGpHDveshjvS8XcYhRwI7q+r+qyJauv/RvLRHiQ3cQ6Wc4W3r8y?=
 =?us-ascii?Q?XC/a0W0xFF5ti9trGj71AndXQlKTwhvi82Y6CzhzA3RM/Z08WZByIEWL6/ks?=
 =?us-ascii?Q?EvLaP/Y1dXtgV1fyk2IJb2dRSTtlw5n/3Ig2CiDKR2d2qljYQwNdBA5wMraA?=
 =?us-ascii?Q?k++2jWfr74BaupC2lYPNJPaq201yD9W5qLzWHE1XbN/dtjGJhhoIc+HoD5Xt?=
 =?us-ascii?Q?SgwsgIioYdHJ4QCMQEzNCEdAqweN3u4esURAmhjQC4T378kfoIwamRR5MjwO?=
 =?us-ascii?Q?w2n+QPltPVhhRxUxf2dN+JSL41HcXrxi+9VFX1uzChGS4rJtukp9o8fD4qRv?=
 =?us-ascii?Q?5tB0fpxTilnKgfXkZZ9Z5t2tikzuoDgu7ckTubXsqX8ApvFA/sgmYuhWjI43?=
 =?us-ascii?Q?hlEdBUz/LC3yJZTSuEnCqfatdYIm4OKeohLo3R2nWn8EUal2nFsG7ySf5mlp?=
 =?us-ascii?Q?9A=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: de6e0af6-3164-462a-7fb5-08ddf6aacd3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2025 11:59:20.4546
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9hiDHdprpVxEBr/vo/lmLAhQJfJwd2Dr/EkVQl4av4UJOpxPFSQkM+8Kg+3sscmYxfJyi7vrbfKxirompeKgasCPDo58MLTpDU67JOOBbcnW3E8pvyToWmFFZxq47DNa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR07MB10131

> -----Original Message-----
> From: Parav Pandit <parav@nvidia.com>=20
> Sent: Monday, September 8, 2025 7:22 PM
> To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>; virtio-com=
ment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com; mvaralar@redhat.co=
m; jasowang@redhat.com; xuanzhuo@linux.alibaba.com; eperezma@redhat.com; ij=
@kernel.org; ncardwell@google.com; Koen De Schepper (Nokia) <koen.de_schepp=
er@nokia-bell-labs.com>; g.white@cablelabs.com; vidhi_goel@apple.com; ingem=
ar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> Subject: RE: [PATCH v10 0/2] Update ECN (RFC3168) and Add Accurate ECN (R=
FC9768) feature
>=20
>=20
> CAUTION: This is an external email. Please be very careful when clicking =
links or opening attachments. See the URL nok.it/ext for additional informa=
tion.
>=20
>=20
>=20
> > From: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> > Sent: 08 September 2025 10:32 PM
> >
> > > -----Original Message-----
> > > From: Chia-Yu Chang (Nokia)
> > > Sent: Monday, August 18, 2025 4:52 PM
> > > To: chia-yu.chang@nokia-bell-labs.com;=20
> > > virtio-comment@lists.linux.dev;
> > mst@redhat.com; cohuck@redhat.com; mvaralar@redhat.com;=20
> > jasowang@redhat.com; xuanzhuo@linux.alibaba.com; eperezma@redhat.com;=20
> > ij@kernel.org; ncardwell@google.com; Koen De Schepper (Nokia)=20
> > <koen.de_schepper@nokia-bell-labs.com>;
> > g.white@cablelabs.com; vidhi_goel@apple.com;=20
> > ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> > > Subject: RE: [PATCH v10 0/2] Update ECN (RFC3168) and Add Accurate=20
> > > ECN
> > (RFC9768-to-be) feature
> > >
> > > > -----Original Message-----
> > > > From: chia-yu.chang@nokia-bell-labs.com <chia-yu.chang@nokia-bell-
> > labs.com>
> > > > Sent: Thursday, August 14, 2025 2:01 PM
> > > > To: virtio-comment@lists.linux.dev; mst@redhat.com;
> > cohuck@redhat.com; mvaralar@redhat.com; jasowang@redhat.com;=20
> > xuanzhuo@linux.alibaba.com; eperezma@redhat.com; ij@kernel.org;=20
> > ncardwell@google.com; Koen De Schepper (Nokia)=20
> > <koen.de_schepper@nokia-bell-labs.com>; g.white@cablelabs.com;=20
> > vidhi_goel@apple.com; ingemar.s.johansson@ericsson.com;=20
> > mirja.kuehlewind@ericsson.com
> > > > Cc: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> > > > Subject: [PATCH v10 0/2] Update ECN (RFC3168) and Add Accurate ECN
> > (RFC9768-to-be) feature
> > > >
> > > > From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> > > >
> > > > Hello,
> > > >
> > > > Please find ECN and AccECN patch v10, which aligns ECN=20
> > > > functionality with
> > > > RFC3168 ECN, and adds Accurate ECN feature. The Accurate ECN draft=
=20
> > > > can
> > be found in
> > https://eur03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fdat=
a
> > tr%2F&data=3D05%7C02%7Cchia-yu.chang%40nokia-bell-labs.com%7Cd1311e975a=
c
> > 94b79f21708ddeefc37fc%7C5d4717519675428d917b70f44f9630b0%7C0%7C0%7C638
> > 929489231872264%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOi
> > IwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%
> > 7C%7C&sdata=3DYeCWaS2RbAfon6y92FL9awtR8cqfENSxV8gJbxF8rnY%3D&reserved=
=3D0
> > acker.ietf.org%2Fdoc%2Fhtml%2Fdraft-ietf-tcpm-accurate-ecn-
> > 34&data=3D05%7C02%7Cparav%40nvidia.com%7C7dd1f434ebb34147585408dd
> > eef96ba5%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C63892947
> > 7274023499%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIl
> > YiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D
> > %7C0%7C%7C%7C&sdata=3Dzkg7PUlHKc4neNHRSFUOw%2BOYv%2F629BeO%2B
> > R9IzYfSxS0%3D&reserved=3D0.
> > > > And the Accurate ECN draft will become RFC9768.
> > > >
> > > > Best Regards,
> > > > Chia-Yu
> > > >
> > > > ---
> > > > v10 (14-Aug-2025)
> > > > - Update AccECN reference and it will become RFC9768.
> > > >
> > > > v9 (19-May-2025)
> > > > - Update descriptions for VIRTIO_NET_F_GUEST_ECN,
> > VIRTIO_NET_F_HOST_ECN, VIRTIO_NET_F_GUEST_ACCECN,=20
> > VIRTIO_NET_F_HOST_ACCECN (Michael S. Tsirkin <mst@redhat.com>)
> > > > - Add reference sections of RFC3168 ECN and AccECN (Michael S.=20
> > > > Tsirkin
> > <mst@redhat.com>)
> > > >
> > > > v8 (17-Apr-2025)
> > > > - Further typo fixing
> > > >
> > > > v7 (15-Apr-2025)
> > > > - Fix typos in AccECN patch (Michael S. Tsirkin <mst@redhat.com>)
> > > >
> > > > v6 (14-Apr-2025)
> > > > - Shrink descriptions and make more reference to RFC3168 ECN and
> > AccECN
> > > >
> > > > v5 (06-Mar-2025)
> > > > - Update feature bits of VIRTIO_NET_F_HOST_ACCECN(69) and
> > VIRTIO_NET_F_GUEST_ACCECN(70)
> > > >
> > > > v4 (05-Mar-2025)
> > > > - Update commit message of AccECN patch
> > > > - Add reference to RFC3168 ECN and Accurate ECN
> > > > - Simplify feature bit descriptinos to avoid duplication of text
> > > >
> > > > v3 (21-Feb-2025)
> > > > - Separate the original patch into 2 different patches
> > > > - Fix several reabase issues in v2
> > > >
> > > > v2 (17-Feb-2025)
> > > > - Rebase the patch on top of v1.4 virtio-spec
> > > >
> > > > ---
> > > > Chia-Yu Chang (2):
> > > >   virtio-net: Fix ECN feature descriptions
> > > >   virtio-net: Define Accurate ECN feature in virtio-spec
> > > >
> > > >  device-types/net/description.tex | 83 +++++++++++++++++++++++-----=
----
> > > >  introduction.tex                 |  6 +++
> > > >  2 files changed, 65 insertions(+), 24 deletions(-)
> > >
> > > Hello,
> > >
> > > A Github issue is created for this patch series.
> > >
> > > Fixes:
> > https://eur03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
h
> > ub%2F&data=3D05%7C02%7Cchia-yu.chang%40nokia-bell-labs.com%7Cd1311e975a=
c
> > 94b79f21708ddeefc37fc%7C5d4717519675428d917b70f44f9630b0%7C0%7C0%7C638
> > 929489231891807%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOi
> > IwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%
> > 7C%7C&sdata=3DSPJnBLMQDRjpuyyvkSUgSkF%2Fgm%2FwHhm7gkSBVRIyDm4%3D&reserv=
e
> > d=3D0
> > .com%2Foasis-tcs%2Fvirtio-
> > spec%2Fissues%2F232&data=3D05%7C02%7Cparav%40nvidia.com%7C7dd1f434
> > ebb34147585408ddeef96ba5%7C43083d15727340c1b7db39efd9ccc17a%7C0
> > %7C0%7C638929477274082837%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0e
> > U1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCI
> > sIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DCAl70tguuFmE7BRdgR5BvUzBJ
> > I1rugsi1NnxetFNyBY%3D&reserved=3D0
> > >
> > > Best regards,
> > > Chia-Yu
> >
> > Hello,
> >
> > Since there are some weeks passing by, just want to check is there any=
=20
> > update on the voting for this patch series?
> >
> I would like to finish the review by 12 sept.
>=20
> > Or do we need to make more changes?
> >
> > Best regars,
> > Chia-Yu
Hi Parav,

May I ask is there any update on reviewing this patch?
And if everything goes well, is it possible to initiate the voting procedur=
e?

An Github issue has already been made for this: https://github.com/oasis-tc=
s/virtio-spec/issues/232

BRs,
Chia-Yu
