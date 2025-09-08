Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCB218BC3B
	for <virtio-comment@lists.linux.dev>; Mon,  8 Sep 2025 17:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757352120; cv=fail; b=eYJmRTF4BvKOuTnX1yiD/Ni2sg3mUhjSXEhWD3CoBwQSNQllJtvWrPsZQJrDavpUo3KbPqf+TzeZRPIlcb1yWRan7E1FON+dwbpWulvPFShrw7/uA9uUbyq0mRVKfYRPDiyrD0w8UsUf5S9Xo00wHCxT3cu2r+/OWZ6a62/rGK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757352120; c=relaxed/simple;
	bh=zUfJZ2+E9K4NkjPY8gxXYxhsp6QLyvfb+KUiJQ3dPkM=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=d5ND6Yxlkf9GbhGsMRJt0nfIXgZcPgjBuoNHB3uEFxcsxj1ycLS4VBOcRIj29NunHH/yRKK2fAWKaq3COhocVtB+77L+YSIV2IRMu/kxOy6FKlo3soUwdBWjV9W7GtnO97ZAY0P6sffnqbBiQDjahWEiPFqJ+8UjCP1R5YHB3Yc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Q3BcR7yf; arc=fail smtp.client-ip=40.107.93.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q3BcR7yf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2J/DwWm7vA2Bn12X+t3imNuUTY0PW7Ju8NSSuhmcUxdQT/mBM/Kvo+Q8S/caeoSo8YJXafolxxf7mv7jKHOO3EQ5UbaFPR7RcxOuX4iIIIJchWzlUB1bZ4gj95bF3r1tK5CWs38lhEu5qkHARa6oCgUvASJnnGEcGuW4Q4eeVRd5EmGTNsJfgkAqJpuM2p4XNiSs1Cj2Wlj76OQcR7jATLWU+WmgSGDGJoAGTGOeYfPdDwXWpVk0LtgmUDGPLs1pkxj//j3feHAs09WrF9nEJNLc/b3q6G0X3MCtOTRpWNLficrkDXYH8joS5mUQfBcDNsMHTcjXCO491kbEOCxUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7Ht62ZfNXW4jepgLbuyt1kjBYVH07PaK2SrW8mYQhM=;
 b=PuTI/FswRh/TtiZnx6YZxqNqU3fTfNzW105WDFywT4NFQxlHMsNwscuNxaDo+7bjoKDQXq4K63ahbjqk4GHwNs5FUtD7geJgv1c32CSvoUJ0+55t4o+2gaS3co9gm3snyzi2R/ccAwEX0NYiVnjun1YnHAy2wGKoowJlNS2UxA0xM3oU1nKBpn+LvDECyJx/kj+eidX0qG77FMRxSl0XH52PxCYDHTV4XIshIsspgHNg6/5IiIbszUdYU5T48D8uFTTOmXO4exSao4BsgpQ7WL1dGZY7hBeVVcTNnTw+OwVBAiiAJy/U9Pp7GgYmj53BPYd9ZSg3ME6lF1VE0AVq9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a7Ht62ZfNXW4jepgLbuyt1kjBYVH07PaK2SrW8mYQhM=;
 b=Q3BcR7yfLu+T4zuUZqK2Xj6HHfOCFcCkhZQHrALakmoeVHMdBBif97eXmKmDbsJC9vLFL8piVWM6a9zi/Z+64iwcQLfID6OlAFsJPy38HMTxiNwt2IRx2VJEQxl9hqu5DDbuuky8pYQyVdoX/w94VBFOh9p2XOkFZrHgSvPaRy2QGdnuLLxdyoRnUc4zLZHY31vlW+X7Yr3jM1BLAUqngEWUXnNETnUekzkQStUbMQYA26rVumHJ0GYTF+Hc0Al830cogn6hEZhKJ0UmMtELEYHnTd7ap3iEkYKbTFy7KNrCahVp8wSUav3ux4L07ljgLmSZCtdhgeiDz/ZHFSEVZA==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DS0PR12MB7607.namprd12.prod.outlook.com (2603:10b6:8:13f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 17:21:54 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%6]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 17:21:54 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "eperezma@redhat.com" <eperezma@redhat.com>,
	"ij@kernel.org" <ij@kernel.org>, "ncardwell@google.com"
	<ncardwell@google.com>, "Koen De Schepper (Nokia)"
	<koen.de_schepper@nokia-bell-labs.com>, "g.white@cablelabs.com"
	<g.white@cablelabs.com>, "vidhi_goel@apple.com" <vidhi_goel@apple.com>,
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>
Subject: RE: [PATCH v10 0/2] Update ECN (RFC3168) and Add Accurate ECN
 (RFC9768) feature
Thread-Topic: [PATCH v10 0/2] Update ECN (RFC3168) and Add Accurate ECN
 (RFC9768) feature
Thread-Index: AQHcIOJOgIouIrxM+0OhyNbdrVBT47SJiDgg
Date: Mon, 8 Sep 2025 17:21:54 +0000
Message-ID:
 <CY8PR12MB719560F13B3D8DD4D6832758DC0CA@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250814120118.81787-1-chia-yu.chang@nokia-bell-labs.com>
 <PAXPR07MB7984E74ECF19E28F857E7AA4A331A@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <PAXPR07MB7984E41B6DDA5416F6B9067BA30CA@PAXPR07MB7984.eurprd07.prod.outlook.com>
In-Reply-To:
 <PAXPR07MB7984E41B6DDA5416F6B9067BA30CA@PAXPR07MB7984.eurprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DS0PR12MB7607:EE_
x-ms-office365-filtering-correlation-id: 630d0bef-62fa-4d03-cb2f-08ddeefc34ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018|921020|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?berqsdPushXhQcsFaVu2jqxEwZSKvH4xq1UUqGQEOopRYkISKPX11hX91WV/?=
 =?us-ascii?Q?3pZF3Xp3Ft6MzCObZwWvoATPJGA6aY2oKUpe3Hlr7u3Q/1KRujYXkc5u8wRw?=
 =?us-ascii?Q?csbJDX96JbQlcutjKmIWy37rLDnhmkHoffBw7oLj0rqe+6qRwQEmtrxZO+qx?=
 =?us-ascii?Q?MuiJaDntZRVUVDxkczBOaDUX8huiGAjg5QJ+pQAUosyQ8PMKw1IgfRJiS6Ij?=
 =?us-ascii?Q?5uH3mjpIl6WZE3t6Ux8UvrkNNP/nI6VemSBunP6Wg6krwwoO+UZDLFa5xrb+?=
 =?us-ascii?Q?6AbHAenm8CRAKzm0QMjt5Uhkms2RHwGnb1C6pH4oTsznspHN7Oz8eylmWNKG?=
 =?us-ascii?Q?YY3VEUE9Hm0+k8iuZIwJWoy6TSAmmm5wh3wAOWqdASJG8cmbaNOwYlYR6HQ5?=
 =?us-ascii?Q?5Hew8rFB3K1otCBzQdYHSzUV36DFvF9XyuO7atDSdWJ0dn9hMC7GN+eAqG5P?=
 =?us-ascii?Q?qc1GtWFRlXXRe4XRiCS14SYQcBTuH6aoVOZDwoAux3yJaabcgCXi4UlcCD8w?=
 =?us-ascii?Q?yqwaU498+tquywjzXqqGkZg7S4iEuAooZDLibSNFumIuCm/NuYaRQ0+n6MOj?=
 =?us-ascii?Q?vacsIb0ss88n/imc0xsiRwFa96gJkkfEUKJ6W6eaAvvwCRZMD1Dn0z+Bg9EU?=
 =?us-ascii?Q?tlfEDf/A09pY9MWU0NVuuyMz2w+BoqgQdM2QBYXefCBQrZhSR27F1uJBwlxq?=
 =?us-ascii?Q?g1BDy0bFcbTbCUmrRkkNDL15bBRkMIPjVIGRt4n9+UusEgt9/UAxHs2WGvfD?=
 =?us-ascii?Q?Dpz11LsjQyqa8qrqnl+ME+mFh41mSH7NVvj2f6qHUCakxwBsCVJs4+DeTxjY?=
 =?us-ascii?Q?35QAQtHg+PcOdT60KNndyJZxHp+4k6w3yKvgUF41k8Sn2e0eD92eP8sEqXOP?=
 =?us-ascii?Q?tzxVV9IH4n59OjxA19156eZ+4qcfkXBeV47MSTjgJcUfEfRoJzvb4yU7qRHs?=
 =?us-ascii?Q?vpAdBFtxxk7X2WmLhO20e241ckrhyZ5ksfp6gzQb4/GhYIcRlwtmUS1pirzw?=
 =?us-ascii?Q?mN/lftBQKMfdUaCCQviP+YNZOhusJ1L7Qqx36T57McPbciIF5giiyFkuhRdN?=
 =?us-ascii?Q?/Rl1Lr/YY5kxAaO19kjedHVS95OR/bo82UBxsUoyUOlhxfaat6B//LsYros+?=
 =?us-ascii?Q?w9ONn7RdqhJdAyyR4On9a96N3ICs9rSbtS01mrLZr7cdZA/ndFUhohBGxHW2?=
 =?us-ascii?Q?3PCHvh8p0wC/NoZrLferdm9mUMKZdS2jvK+c621Um68xnOVFwa9UJaccp7um?=
 =?us-ascii?Q?20XmsJKak74wazTy7lHybkOfakXsBDBg5xCFx203TfU2YcF6xxhTBJbGLF5S?=
 =?us-ascii?Q?p2FQLn4DMH9ACj2I0TdHB7CxqG5JKQ1O+eOEgLzBJvlP7Ay1IPV0uyxmhK7i?=
 =?us-ascii?Q?7O1DacwKE8zhyHmIy3P3a+TfGPP8IDZipoRNfiaQUidUc56Md5gweqfDVYQb?=
 =?us-ascii?Q?DeIPjNqIMos0MDxxqO5sCAGMen6Phqz4sjCr4mC3eRlfCVyBBPKC4Ha6NFSE?=
 =?us-ascii?Q?P03TZJywQkp1qN8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018)(921020)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BNmnarwnOwI7Bppx+zOektlakTt3BZHT3tGXfHcdWgwhOBS4ZOHEh126REUG?=
 =?us-ascii?Q?nV3/zVzviRdUoDFUcfxfTbGk3MjpnvUfCuQ1/PPUMFe4Z+r7PgCLgbbj6nux?=
 =?us-ascii?Q?mogKDHrh0nV5it0LOw6p5jOMk5XDbDGaOchCUKSGWC5ECcjL+0bh8XdksQa4?=
 =?us-ascii?Q?SfqVfJHIhPnolKthpZrViCGRj547BcrC4Dfx6L0mmij0Ks5uSaUtq/t/gGX9?=
 =?us-ascii?Q?H9DkJ96+mq2Z1vsGZwyidkPR2nwMLdRxu6zOSX/pH6qHH7RCsq47CEOphlqY?=
 =?us-ascii?Q?obZCvUg3U0NaApO6aK9Lwc3JiXHbiVbFP3XuAtxbwVm6LCxJbUhRkUSOy6Pf?=
 =?us-ascii?Q?jgglULglApQeWtE3Qbnt88++EdAZbA05PdZYImM1wB9EQMxSOzIfXsm3cfqm?=
 =?us-ascii?Q?QE+Udo3DuY9lsHzx91F+hLJNKnYu2RMljwsGPtQDoesEDsKYCcybvsU0wWTF?=
 =?us-ascii?Q?i2xVgxTksU457Zx82odN1tzTxa/DPdICMA0yxDMPaDymguEWPf92KKY/mfra?=
 =?us-ascii?Q?bKEYAFYWUQVDACbLj8jC8dbe/edvBn/9yM4H9X13Gf7SfktuErTgrZqtmQph?=
 =?us-ascii?Q?oYhfxDd2jq2MOsuIrtjwqNijmjFR2Bs7WxOmclTUhIwX2xw41ROk3FepbqjW?=
 =?us-ascii?Q?/UdH5AF47zORnuhfstxyGMz/VsH/vgotpI3DZU1ZaWEFbLrfZQSBvHfNc1GT?=
 =?us-ascii?Q?Q/A7qmasjutPTN6VWlkDE1ymGEyC6Yox5qCvYQhVsjDeBQ5m4J9pflv+/XVF?=
 =?us-ascii?Q?qFAKK8eBz4cIzQsYQWGYPQCCrwE8sqFEtqxnwC5YEbMATJA4UyxeZc42Kzjl?=
 =?us-ascii?Q?XIeqk5Y0s92x2fuAmWgo4MOPKkuo0a1sVG3ri7RpwH8NBMkCoNWsdDE/6tHx?=
 =?us-ascii?Q?1+/n/u2QPBl99QUXM+JNiUrqaTtXRgFAdqPaCis4d0ZOIvG3Q2v7Wfz9AIx1?=
 =?us-ascii?Q?ZlV1zwf6F1sQr0zWNUAr7EwfgwmtufSE1TRp5Esw3r7E7Ucaemtff4zIM8sd?=
 =?us-ascii?Q?529qcaf5IGJSnbueLQ1FXTl4pchMt5brFT1aVvVRbSK3BMejCgt1Ilxu9mg2?=
 =?us-ascii?Q?oeMQc9ZEXZXNLBmDIRujpv1eeWFj0anga1S3OxGzcwf/lb+yo8U5P4pginvK?=
 =?us-ascii?Q?RHW7/rSUslcBNnVNl542jkL7LdTwKBWvVw/3m6iTP0BDBPimI4t8cLVc9Apo?=
 =?us-ascii?Q?4gqQq0LZNMysgzDoGGvNHjWUeyIyTaHowkCVveBZ0Yv0pKXpTjCL0YcI7kUk?=
 =?us-ascii?Q?WLDJleWDRlwA9MsMyz89KWbOP5NkV2BzDis/UGB9nxHmUtAha8lrzKeaVl68?=
 =?us-ascii?Q?0BXmGRg/tL1WJVB0uqT6GJ1pLVG5Lgt4NKsd22i4G97AprUMiHgj/Jrsq/8L?=
 =?us-ascii?Q?zRhJM83N6+DuryVynpCHoSftRZTpJMguj5wN98LIRcPifhSKE8AgHM+uepn9?=
 =?us-ascii?Q?lsZK3FkwE7VvzEPN4EgopouiXf1E0/wE1J96xs8EL3UJMW1sCkRXMT6C19kc?=
 =?us-ascii?Q?PtIj9jeyaYYA8Qh/Gl/n/c3SQasG2QQPXyBrRIc2N+DJgbyGTmRdYfJK1jPn?=
 =?us-ascii?Q?Atv60BofRvXDRRjCZmk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 630d0bef-62fa-4d03-cb2f-08ddeefc34ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2025 17:21:54.2825
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KxPe+4wJRlk4rezfnTIW4YMvCMn9/kNP4dtMYjgzdgxHaNsPAzfpgJH/s4nP3rK0SLSl4EdgKMCoQRbZ4Jga5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7607

> From: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> Sent: 08 September 2025 10:32 PM
>=20
> > -----Original Message-----
> > From: Chia-Yu Chang (Nokia)
> > Sent: Monday, August 18, 2025 4:52 PM
> > To: chia-yu.chang@nokia-bell-labs.com; virtio-comment@lists.linux.dev;
> mst@redhat.com; cohuck@redhat.com; mvaralar@redhat.com;
> jasowang@redhat.com; xuanzhuo@linux.alibaba.com;
> eperezma@redhat.com; ij@kernel.org; ncardwell@google.com; Koen De
> Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>;
> g.white@cablelabs.com; vidhi_goel@apple.com;
> ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> > Subject: RE: [PATCH v10 0/2] Update ECN (RFC3168) and Add Accurate ECN
> (RFC9768-to-be) feature
> >
> > > -----Original Message-----
> > > From: chia-yu.chang@nokia-bell-labs.com <chia-yu.chang@nokia-bell-
> labs.com>
> > > Sent: Thursday, August 14, 2025 2:01 PM
> > > To: virtio-comment@lists.linux.dev; mst@redhat.com;
> cohuck@redhat.com; mvaralar@redhat.com; jasowang@redhat.com;
> xuanzhuo@linux.alibaba.com; eperezma@redhat.com; ij@kernel.org;
> ncardwell@google.com; Koen De Schepper (Nokia)
> <koen.de_schepper@nokia-bell-labs.com>; g.white@cablelabs.com;
> vidhi_goel@apple.com; ingemar.s.johansson@ericsson.com;
> mirja.kuehlewind@ericsson.com
> > > Cc: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> > > Subject: [PATCH v10 0/2] Update ECN (RFC3168) and Add Accurate ECN
> (RFC9768-to-be) feature
> > >
> > > From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> > >
> > > Hello,
> > >
> > > Please find ECN and AccECN patch v10, which aligns ECN functionality =
with
> > > RFC3168 ECN, and adds Accurate ECN feature. The Accurate ECN draft ca=
n
> be found in
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fdatat=
r
> acker.ietf.org%2Fdoc%2Fhtml%2Fdraft-ietf-tcpm-accurate-ecn-
> 34&data=3D05%7C02%7Cparav%40nvidia.com%7C7dd1f434ebb34147585408dd
> eef96ba5%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C63892947
> 7274023499%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIl
> YiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D
> %7C0%7C%7C%7C&sdata=3Dzkg7PUlHKc4neNHRSFUOw%2BOYv%2F629BeO%2B
> R9IzYfSxS0%3D&reserved=3D0.
> > > And the Accurate ECN draft will become RFC9768.
> > >
> > > Best Regards,
> > > Chia-Yu
> > >
> > > ---
> > > v10 (14-Aug-2025)
> > > - Update AccECN reference and it will become RFC9768.
> > >
> > > v9 (19-May-2025)
> > > - Update descriptions for VIRTIO_NET_F_GUEST_ECN,
> VIRTIO_NET_F_HOST_ECN, VIRTIO_NET_F_GUEST_ACCECN,
> VIRTIO_NET_F_HOST_ACCECN (Michael S. Tsirkin <mst@redhat.com>)
> > > - Add reference sections of RFC3168 ECN and AccECN (Michael S. Tsirki=
n
> <mst@redhat.com>)
> > >
> > > v8 (17-Apr-2025)
> > > - Further typo fixing
> > >
> > > v7 (15-Apr-2025)
> > > - Fix typos in AccECN patch (Michael S. Tsirkin <mst@redhat.com>)
> > >
> > > v6 (14-Apr-2025)
> > > - Shrink descriptions and make more reference to RFC3168 ECN and
> AccECN
> > >
> > > v5 (06-Mar-2025)
> > > - Update feature bits of VIRTIO_NET_F_HOST_ACCECN(69) and
> VIRTIO_NET_F_GUEST_ACCECN(70)
> > >
> > > v4 (05-Mar-2025)
> > > - Update commit message of AccECN patch
> > > - Add reference to RFC3168 ECN and Accurate ECN
> > > - Simplify feature bit descriptinos to avoid duplication of text
> > >
> > > v3 (21-Feb-2025)
> > > - Separate the original patch into 2 different patches
> > > - Fix several reabase issues in v2
> > >
> > > v2 (17-Feb-2025)
> > > - Rebase the patch on top of v1.4 virtio-spec
> > >
> > > ---
> > > Chia-Yu Chang (2):
> > >   virtio-net: Fix ECN feature descriptions
> > >   virtio-net: Define Accurate ECN feature in virtio-spec
> > >
> > >  device-types/net/description.tex | 83 +++++++++++++++++++++++-------=
--
> > >  introduction.tex                 |  6 +++
> > >  2 files changed, 65 insertions(+), 24 deletions(-)
> >
> > Hello,
> >
> > A Github issue is created for this patch series.
> >
> > Fixes:
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b
> .com%2Foasis-tcs%2Fvirtio-
> spec%2Fissues%2F232&data=3D05%7C02%7Cparav%40nvidia.com%7C7dd1f434
> ebb34147585408ddeef96ba5%7C43083d15727340c1b7db39efd9ccc17a%7C0
> %7C0%7C638929477274082837%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0e
> U1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCI
> sIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DCAl70tguuFmE7BRdgR5BvUzBJ
> I1rugsi1NnxetFNyBY%3D&reserved=3D0
> >
> > Best regards,
> > Chia-Yu
>=20
> Hello,
>=20
> Since there are some weeks passing by, just want to check is there any up=
date
> on the voting for this patch series?
>=20
I would like to finish the review by 12 sept.

> Or do we need to make more changes?
>=20
> Best regars,
> Chia-Yu

