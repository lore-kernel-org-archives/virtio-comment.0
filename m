Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011035.outbound.protection.outlook.com [40.93.194.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFA331A7FF
	for <virtio-comment@lists.linux.dev>; Mon, 27 Oct 2025 18:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761588268; cv=fail; b=UxU/oU7KnPTog0W+fTKt+UXYlay2lQtioepTltoa8a8wNQIKWD0FyRi+gKOq7gsIaBnBlpc+6NBcBa3bx6lJ0PermlqLxIE2eEvwLnurPmlby79BoECNRRGm3fg9FkZ6NPpE/7KbpYS/2TGFriAWXLXMTqnTVdhOriVEAmP+RuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761588268; c=relaxed/simple;
	bh=8PlFFPdmeRSXKH4VQa8iV+Bd31ZhZHZDdcHv2rpXa9c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lyGUIKZ+S/HQ8G9GHysEsmIRAnEqrzbVOiT1tACiKOFDwPAkSI1ILi9gj6e/FMM0Huba8cNVGpHutypE4vdKZyMvCNz6CYsfcJa4DBAhLhbPH/BKo0Cp/oGnJIReUIWbdB1/eh4auHB0G7e+9RkvRu6oXbzWmpgKddZy0HhRAFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ERl+QwE4; arc=fail smtp.client-ip=40.93.194.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ERl+QwE4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DN7S6rw5M0JHhzGRKMmcfvnwfI2Qba8CN89fwDG91Ug/jKGRpl1+BodvanFRfi9JLr53U783MWMEHDfpBPokG5v8gO6bULMOO3YWgHJG5CSqva2i5FvLm5xl92wPJLhyTd1MbAseyDK60b1esDLbNhHWjG13ATjFtim90YyNias+M945ocS0PCHmW9S5hLk5rYu9m2wOFVKD8SPwiiYoeucn1dBYt2LA21e8DHpqdiUVZAkWLbhPYvLHu/nrwvIb57jT2nGsda4zcguUDTUTz4vRDDgRrJvTC3v0GYq1UoK9T3TudeewXp28PR6aoj4KkjipFgJr2PCQtNUvo7e3UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dbF/7F8zcQrB4U18CzQ3Dl9II7SjOQWR/oeytwpIqcE=;
 b=Mv8V75ojXphM1i2DL5oDdPhWI8ubVpDWFmBU3i9kJrL7WxOGGr0zbnzr0R1Ln+V8137cft9JdykO9BDwZDcJT5uCc/c9nJk6RK74at5ITMEgPDGU0e0isrkj/MzaIfQSuOc9PtMSvLH9VRJihmy9/AyF2zJ1zcPPwpy/puVGqylwLbqFlV1G/DG7QrbHEN+9b6e4aGqoNhqYDTDShvf/jZMf7uNTHrzPhgu24ITHOBRsmEkPLVdu0Z6eo0/4IbMsNuPkCaI0sbbU+PunzvudXycYiqawQLv62RdFQ3f55wCmdahZQrQaul3tCHjusmIqd+kubVhRwi4OKzmmGZlMLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbF/7F8zcQrB4U18CzQ3Dl9II7SjOQWR/oeytwpIqcE=;
 b=ERl+QwE4oYSKHhjIpGJyRjYMReF6oNR8NhlqRXuhhRkNptv6gxRewTwqKmlq2853p5YstcBQ6kOUGUQx/fceK7dmjO6jhtvKAbBf+q+X8Z4e2IlT/fW+qVO/bPHTpw42crrAIckkOQVJ/N/elP53pB+k4DGW9W8JJJZbwHOG4lON4QThL06VwE06ap8hpAgcCw6OYOQhNzr1qNDFPfYBlLWjWgs3/QR8ZSY8MZ7EuhEi7Awlax40G84qq48O20xGaR6q2a7Uw/mysCJNVEeRNI3gZxlIk5pf1pyhgutif16dLikRPl6btYVlRKC6qw0ApAF/pPvAnBjGDoJijSW23g==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by IA1PR12MB7592.namprd12.prod.outlook.com (2603:10b6:208:428::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 18:04:22 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%5]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 18:04:22 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "mvaralar@redhat.com"
	<mvaralar@redhat.com>, Shahaf Shuler <shahafs@nvidia.com>
Subject: RE: [PATCH 0/4] editorial: Prepare master branch for 1.4 spec release
Thread-Topic: [PATCH 0/4] editorial: Prepare master branch for 1.4 spec
 release
Thread-Index: AQHcR2oUx7Fm6uhzsU2LljkS4jUGVbTWR0uAgAABzjA=
Date: Mon, 27 Oct 2025 18:04:22 +0000
Message-ID:
 <CY8PR12MB7195D654CC8553C5B686105ADCFCA@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20251027174756.56284-1-parav@nvidia.com>
 <20251027135611-mutt-send-email-mst@kernel.org>
In-Reply-To: <20251027135611-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|IA1PR12MB7592:EE_
x-ms-office365-filtering-correlation-id: c99bb002-e475-465f-aee6-08de158341e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?VA39iFqA4GSPKOEE7m1l0xjuFjxHO7+Hgxw7FjlMJspTsHL4iIdFJ/DFLWo7?=
 =?us-ascii?Q?Xr6ZvdtDSsOm4wOQAOafAxlBjtJ6DotT1u230lQEdV5M93OvEhBcMhwbCj3v?=
 =?us-ascii?Q?O8HMV4CZBvKIYwTSUUFyA+2QmZHw+ijvgZIGVyQidml2VVt9iZ2xsS6R/12F?=
 =?us-ascii?Q?fRjH8t7cP+LenMmK9wSZT+IctG0+KuY3jR/M81nwoWbYgV9qztWMM5nNqmkE?=
 =?us-ascii?Q?nyLz6mEA+O9ETnB4DxEdqWSPLIOYAGIDh44Wxms47V5azGeRf/3FHQ5DCzsi?=
 =?us-ascii?Q?owN6WRcUNb1m1f42W9nI8iutgh73a65v+UZlW16WsAHwb40UoST4Ai43+7gf?=
 =?us-ascii?Q?cTaAM/9xx+seCFDA4JuT/x2aAdRr2w740biFzqhdNHIPAOSLkid960YSzBXL?=
 =?us-ascii?Q?R9L0UT5e3IwjiUpH3eZ+QLMhJy6uaJLkCyKfMxwwl8oFmyJif+Fpqm9lm/VW?=
 =?us-ascii?Q?azarMR4bj87nylp3VmCbHrFWuMh1WJSk2bUm1NyjA9Vg/jepGc9WPXDGm8nv?=
 =?us-ascii?Q?nQVTCDImXx4bE0l0HCDG45DUsmGVvtk3+9huQ4jdQAOMajyGvldnnkzlsMrn?=
 =?us-ascii?Q?LXmtXSGyUER33MsuR1ECfk1CW/pBfIDIRzpvHpdu7VFcLV0zluKpKVu09Yii?=
 =?us-ascii?Q?MlIb9G0Qd3k112cJy3bztR+bDHAA1wIiNvVjpOp//VxUwIWv0pjvITMf7mes?=
 =?us-ascii?Q?t3WpGbk+XW0uItzZfTcek0D+yQPPKwdC8CF6WAjlaHNINBhAmVPvDGNgGR4y?=
 =?us-ascii?Q?tiBFk4s02GERjGPgXpfWutZRCRBRU4Ug2IR3H08T2ZJXmCCehU6pQvIjHjNz?=
 =?us-ascii?Q?X9m6MN0p9AeH8bL8Not+F/ZgpF4xyNozengrIO3Nu+kx14OyfBJlDWbaXF+p?=
 =?us-ascii?Q?zUK8Tk/XGOjlEliIiOVh8BHLdcmcsh6lLs+rUKHBLe0tO5ZV56ZRwMUDb7/V?=
 =?us-ascii?Q?AtUPqbGld7WdEWnwCeKvQobxyHLEt8xORlMiQoISnKXSb929ih5hQ55pFcpR?=
 =?us-ascii?Q?POV6/TXpwPk6SRH12AFJh1iuz3QqWM9FXNMEPizp9U65owAc5lys9poD3xWu?=
 =?us-ascii?Q?cMGsiIU6nLNQv2gdFEzmIaqTxZHUqVNfPAlxu9kHErcoh/iGJ7Igk34NGTKk?=
 =?us-ascii?Q?kJDcrkVXulIhGBvopISsdx3HbpJOQIPmbMnhMaOhiyJVdAf5Vuc2cQmZKGxu?=
 =?us-ascii?Q?lAZgWSWarMS4P23TrylNfAwxN3WZjARnuvrtWQ5NT3WuexR0zN2y3z0ab17W?=
 =?us-ascii?Q?nf75ShtSHyBUKa/cKPRlFgnZ4XMPi3QkEcch2OJro6kzBsD9Yd9YSK7cULhe?=
 =?us-ascii?Q?1oCiOo0B879ul7H4mRGpgOCWkm49lAq72oQ1M3ellbxOuxTS0GYmmmtAHVUU?=
 =?us-ascii?Q?Nkxhmd8suQy2GAOpGqlATmLODKSKkQ+JgdJhKONzAfkFtXCqwJH4xt9YgUqQ?=
 =?us-ascii?Q?fnFx9ztJuqWcskckoKCTfH28xwDDEOMV81LCYlSi+kdZ6pKQSEQYe+/rUuB7?=
 =?us-ascii?Q?6WhXcQnghSaHKWWfxl0szYX9MYOnAJrzl17Q?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?tL5V2mI1YuOBVKE4IL6mPCJb9CR4aLO0lgaWDLG1uUAfDWoWSog9YnJRaBbt?=
 =?us-ascii?Q?sfumQAdqGMy/ZcpTOVbj2KbrN735FenCG7iVcedYhewEAdRxYJfx49t4k5UO?=
 =?us-ascii?Q?wV3MJA4/z7gA5TxWk+F27dSZFpuOiASSln34FRogiGTPKcrW9LlOlqFyQXoi?=
 =?us-ascii?Q?OPfcAw7UbvPRTmx1uewrjS2ioxZpDYfd55YELN7jP0Vfr5rJyNm6+jUiEocv?=
 =?us-ascii?Q?nhSGr/2mwwTD7CqM6HdZS70IQAlGdfdikbecLN1bx36AeOs1yyQ4G+5mRBjQ?=
 =?us-ascii?Q?SnwKQHcK1PiZx1KRIvYSJdy3WY7jaOYGEqm6MqnSvD6nnfFltMXxN5iy+2v+?=
 =?us-ascii?Q?iHElVwYl+GiyCnsfb88G2MAhC11c/SlZumGVa7hLdF0xf6G0o99GrmmKSN9S?=
 =?us-ascii?Q?A9/BE+eGNPROlYVRbQjPfO+GTGO6hIfyRMlU/ZX0lzcP7pONwC69FKib+rHN?=
 =?us-ascii?Q?w0897llXfFI7333U62igNerprgoqiX7c/2lUeyhgTD0HDOdC1FgQjWEI03Vi?=
 =?us-ascii?Q?SYD7/yoB77unbAn76mNXbPI1iddunVdqCyp7rJv13EnTiHv5RetvIVdy3KkB?=
 =?us-ascii?Q?G0PrXzms4y/KGNlSy0BuNolSWe4fL6nGEr7A90BDW/MEp/THdhlslAcNqx7I?=
 =?us-ascii?Q?MTnJR693awzfu+T6uS0IdZtpEJVwhQXm2vJF7ZZ91xmJErkpO0jSS6jWX10z?=
 =?us-ascii?Q?qS+Yz0tYf1E3xPJ1+LMTqfoJRMHC2t0DhhCbrCmpKlYWP+QNTTQReTgBAgnW?=
 =?us-ascii?Q?RK8Sr531yp/1u7pK2Punzi6GKSf+4o1jXr3JF5eRnu1Z7Owh/0ETw+bUCqo6?=
 =?us-ascii?Q?rz8GQgttrW+lsKhNrIekR4Mejoe4Vpf7uxxx1DPa+d/CScOhAEztKvrvir8T?=
 =?us-ascii?Q?90G6fFQ8W8mNaRMl758gg1XldO+eagYvbJuiaskEnSHq0E5ePNBUgkISSLTp?=
 =?us-ascii?Q?CvLk6gx7MQCX5OfKrzT4AXqtMQHqIjY4A9hd5NgzKZrlo8Yjyj0zKSlsvmI1?=
 =?us-ascii?Q?9x99PjN7VQekyolMXMMSQI09PxZOGEd67zDsVJTvNQAvJ11i9uITfj1x+/Z5?=
 =?us-ascii?Q?NL55vjCG4y5yMur7kjg26y+OCKi7SenbLlCuxA6jQREpxscAkUuyJzdeE56I?=
 =?us-ascii?Q?/UgPpvt9xpxZFy/p5jZdIbJcIigIrWc8xA/u8VhdXt2wS2AERukDLYglAPhI?=
 =?us-ascii?Q?SvAyMBsFhZrshhYqp6yVzXnxZr6Y4tCjLvHEOjHo+vBSX8Bz2jnTJGs7uvCs?=
 =?us-ascii?Q?k7jUvwbRqS9QBei+TepReh01xT8J35fKz7vQ4wCNqWSxe7nZZo5q462xMQpS?=
 =?us-ascii?Q?OXJ6P8XSg4D8Vxwf0ToZKxAIp1VAuuwAupUTlfWnCu0gQkzflbsya8VBWcgJ?=
 =?us-ascii?Q?LhqUpKGTLiZlcD1XdIqwEdDPr9ygkNlZTufcIebyC+FK0BH5xqGQ0oIZcbx0?=
 =?us-ascii?Q?D5ZV1vFclTyXh+ZdUPKUiGWzienCoIURkxMzPexVzOiCpoo8IAFJX4THjmwi?=
 =?us-ascii?Q?uL0Xqcs00IrCiFRJWhDthlfSKceNsWSbiwziB2if/Cfz6sUPFTykeZlTIx7C?=
 =?us-ascii?Q?rLCOKuFuM7Uex2C4CFA=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c99bb002-e475-465f-aee6-08de158341e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2025 18:04:22.2591
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H/c2huZ+2SVxmNVfzs8TIw98pUxbNJKHlFiW/Dt7ZsUwBmI3ZTOGCepLzsN/gn7fj8UeYHcRTBei+KIALQAiBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7592



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: 27 October 2025 11:27 PM
>=20
> On Mon, Oct 27, 2025 at 07:47:52PM +0200, Parav Pandit wrote:
> > Hi All,
> >
> > This short series prepares the specification for release 1.4 version
> > from the master branch.
>=20
>=20
> I noticed you updated latexdiff module - intentional?
>
I didn't. :(=20
Latexdiff is able to generate the necessary diff without my changelog patch=
es.
Below is the version I am using for last sometime.

latexdiff --version
This is LATEXDIFF 1.3.1a  (Algorithm::Diff 1.15 fast, Perl v5.34.0)
  (c) 2004-2018 F J Tilmann

=20
> > note:
> > makediffpdf.sh still have fails and needs resolution. WIP.
> >
> > Parav Pandit (4):
> >   edit: remove old changelog
> >   edit: add changelog for 1.4
> >   edit: Remove annotation of special character
> >   REVISION: update to 1.4
> >
> >  REVISION      |    2 +-
> >  REVISION-DATE |    2 +-
> >  cl-cs05.tex   | 2120 ++++++++++++++++++++++++++++++++++++++++
> >  cl-os.tex     | 2605 ++++++++++++++++++++++++-------------------------
> >  4 files changed, 3407 insertions(+), 1322 deletions(-)  create mode
> > 100644 cl-cs05.tex
> >
> > --
> > 2.34.1

