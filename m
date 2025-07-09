Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7B22877CF
	for <virtio-comment@lists.linux.dev>; Wed,  9 Jul 2025 09:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752054545; cv=fail; b=oj1B0nRe+ikFF8d4kp5WckAqKA140ob8sHa3rLE/2HzRNYcYLfXthn9qRMzv6oR0/kFtbY41i3PMNiuOn+mWyHHCq2COJcrDHTa2yaF5iPq+qSjZWcpwuTc+4maHSSucI+a+VWybu1s3oxFWJYm7ku6ZvDUxN+HxT7+vLJ9Fxgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752054545; c=relaxed/simple;
	bh=Z7IsjlgaufY1h9P0Fp05nCD1W4a88ravOUYhmnayUCs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WgUUJeXS8aqEg7evD4DD7zC/sufYSqI7ZI0lFNJPtEOKp9NdRscZSQNSsf8z9P+vHGAkSpVs4lLcGx6RKEjs8klefgJSNl80A0b6OJV+HY7easinU5LpqYlV1VZk1dqyqEpIlxG+B1fyn3UKlgGRgyvN0w1lHjbyK1/AaVIutTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EyMcZwon; arc=fail smtp.client-ip=40.107.236.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EyMcZwon"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gv4BYN6odgn/LnBkyZCsy6VZVptwIiit7NMZExdjZv5uGl5/E9pKozEfxtzD6j/Y/Hi400vfbXc4r89C5NzuX+VHgB2avvTURikjsMOibHuv04zrQwCuU7PDwEoK9Ig+1Vzq+9kTY9gfLltJMZIYOvrkzQWdNfTheY0I5gcz84y/cZwRvMDLu155FMPyoLsQYkw2PceG1eWPOWTDq2PlGbizd53PXzLA/nlgpxukrPrTwKAndv+olSvtJ5QvDJ/mqT5bVf0knxOnRwydJQizULna6yCg0sMZHE42T87yWK35BV4xfrPo3Hhw59aypuOB95VAPIL9RINPx3Pd8NjCiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7IsjlgaufY1h9P0Fp05nCD1W4a88ravOUYhmnayUCs=;
 b=lBuvd/XV+oW8SR6cYPavOd2w5MubHXSvbU1Rh3OChzJXd43Cc7aMkx2+Y0J41F/wZjDmtM01TqCZmNJQRp5g21FAma1GydjArMHxbOXvN4yKnoT1J46fSV5wuJ0GTdoTwPTP0sGOkuEPBhXVJt1S79deyOXGjreTTMU+yyQ4Z/5bdW2Uh6KBoW4sEi8lw7xhp/JZGbzyEJtyvRgy0ZjUVpuBUtKpY6DJ0WT0OH4trSXbMXRkMMNGhXioQBfqTfiofQpPnlNZwWRCJhRvjmGRaTnB8M0Up2BLb7CuO/jxrQ92/+E6Jvnj4q/pgLQEFKb3mQLLraIYBo3yQwuxj0yicg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7IsjlgaufY1h9P0Fp05nCD1W4a88ravOUYhmnayUCs=;
 b=EyMcZwon0w1QTE0tSBnViW04HF1lye+8Rj3E0AQ7Y/pFq818dBvqW/GQr8ka8K9BogiJT+B4LxJvkfXBQL/A5IjWvC+SMDaUG719M3SSCE+UBal2iq9OFbmXSCZ3uaHJqKA4JZq/pVGS1ZOofit2UCixTj0LLi88qGUQfel1dCnCdpRmRNVb73vdz476Qihs14QFGyabpOONSC2uYjyMltb6P55okG+Ek+0jOAhnHUzwNQKvlEAoO5i2VHeuwBZko+5CliMnNHojCHRFfn3mfDtDsFEPXPdiBV+y32SyqgO/IeKJkt/oGbxdXuZFyhq6oN2VJnkwpxr/o0DBEDSWyA==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by BN7PPF521FFE181.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6d0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 9 Jul
 2025 09:49:01 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%4]) with mapi id 15.20.8880.029; Wed, 9 Jul 2025
 09:49:01 +0000
From: Parav Pandit <parav@nvidia.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>, Albert Esteve
	<aesteve@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"ribalda@google.com" <ribalda@google.com>, "alex.bennee@linaro.org"
	<alex.bennee@linaro.org>, "adelva@google.com" <adelva@google.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "hverkuil@xs4all.nl"
	<hverkuil@xs4all.nl>, "gurchetansingh@google.com"
	<gurchetansingh@google.com>, "daniel.almeida@collabora.com"
	<daniel.almeida@collabora.com>, "changyeon@google.com"
	<changyeon@google.com>, "acourbot@google.com" <acourbot@google.com>,
	"mst@redhat.com" <mst@redhat.com>, "eballetb@redhat.com"
	<eballetb@redhat.com>, "agordeev@qti.qualcomm.com"
	<agordeev@qti.qualcomm.com>, "gnurou@gmail.com" <gnurou@gmail.com>,
	"dverkamp@chromium.org" <dverkamp@chromium.org>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>
Subject: RE: [PATCH v9 0/1] virtio-media: Add device specification
Thread-Topic: [PATCH v9 0/1] virtio-media: Add device specification
Thread-Index: AQHb8LTLBRb77N9LUEyiaoa5CXxgRbQpipaAgAABHyA=
Date: Wed, 9 Jul 2025 09:49:00 +0000
Message-ID:
 <CY8PR12MB719541D2A89FB2730AED842ADC49A@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250709093456.350242-1-aesteve@redhat.com>
 <aG454cwrUWP3xjAU@fedora>
In-Reply-To: <aG454cwrUWP3xjAU@fedora>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|BN7PPF521FFE181:EE_
x-ms-office365-filtering-correlation-id: b4d65f08-34b0-4126-4996-08ddbecdd525
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?9ZrhePG7akQ16/Mui5qX7aDg613KbffBkZ092YxjVCCFfu7ZoM2oFvyhlxke?=
 =?us-ascii?Q?VF0EVbCk9PmKgXTzTmn2Nqbg4uk57FnF1Ono+RFc6i/Wm93u/b3Fay4gcDX9?=
 =?us-ascii?Q?pnThQBEmPrm0PKZFbGK/BfjwpV/PH41OlrupYNx+eMM9ojQoh/xGqyk1euwa?=
 =?us-ascii?Q?6SUo6uLp75cFrWx80n8dp0YMUN9O0fmSSgUUvt4/LNpdFfkGgvi3oD3tCdEi?=
 =?us-ascii?Q?IJpnWsUxtO3AyOVenU9Hi60d2kkr31ZolTAwpRnxyCMC4maQPE7ipneU75Ns?=
 =?us-ascii?Q?gJ52k2Ez0yqYG00h92XYLnTJigOoRige2aYj1xgRbRJ7+cDGnkCo6d0lNn54?=
 =?us-ascii?Q?//8iQxybPUntc6lciX+NJQjXPKtCxQd7lTwFIqDR6qX2wmSJ+xXyANLGvVas?=
 =?us-ascii?Q?5TfMNiE1XSe6u/+1t1zl/YPK6NNJZSwOOaqVbo4TBpdyvuzFcRGzW+iFLxYS?=
 =?us-ascii?Q?/hZnjU3fQcCVp1q4PkFIv6n1/UosBKeo6wLNP/Fp3tlr3EvJ8psXtIGgHo6L?=
 =?us-ascii?Q?m1InIHEhh9y67oFTmk6xkhzcdYTJWTGmIIFoe00zTtxvT8ew466mccrsRX0u?=
 =?us-ascii?Q?DFRB4/CWcs3KnSDrcTGDYoZ5TEPwYYDxTN0zLAobMx/vexNZNDms2k5d/A8h?=
 =?us-ascii?Q?+qzE7Xuppq1K3jGZ8GrmJFdMGKqX9yPVCeERf1sVL2Olxwi2ut/qgrs8OgsU?=
 =?us-ascii?Q?g77QeBv/uvvchEbE59CPAjyzS02MwxLS0aDnDMjyVe3zp0+MXdiL9hr1s7fv?=
 =?us-ascii?Q?wp7Z99g1OlrTHXk9Ui7mVUBtf9r5zuSicx/1prsJO9XCsU9RiKS4eV6m1qvT?=
 =?us-ascii?Q?TZRdDNqHJXIkcuJCTuadnFKG0qd3pKiu+Kzn8gQbc1KZT1L8uCf8oal16/FR?=
 =?us-ascii?Q?wG3iqjmcl5pktYQh4/eOQBOHUojhLJAz0Pxzd02er+WyeeL0uDldouWiQCAb?=
 =?us-ascii?Q?s7GV8wVF2WlirUM3hkpiK2L8sVk7hfvY+7R3OsSPoCg+7XoTaHaeMr4PDr9L?=
 =?us-ascii?Q?SVSI2GCVD/wvsJyE6F3LLsWn0Xl3DCstT69iR3PJtMRwTe50rARtHkPZMYXn?=
 =?us-ascii?Q?v+OBuka0mTk8zN0G72FD63JvtHKGZB07gLpDtkd0KcaQ2v5dzE2a6h+ZRHh2?=
 =?us-ascii?Q?zlpmhOnIPsqugJL3vM5Xr6KbKhpBLn5Mr921w3sRHvDLVydB1I3+vMg1tpa0?=
 =?us-ascii?Q?DR58DD/bIAv8twDk9fa9SghV0v0BtZe93wrDyZj9sZ1tQmIRYgHiH1lyB7WB?=
 =?us-ascii?Q?uvrvu+QWbicy7VsWb9pbrECTbTzEDoHksGLBm0ndJCcXE5+6NTRD+1SnYlt2?=
 =?us-ascii?Q?J8AGCZej7L33VXsRJ49VABrBa1nMnfGLw3pn829nXPfKZ0BDJWWpQgHwuJy9?=
 =?us-ascii?Q?KCk8nuQ1sJcGj92cwJwqyHJcN8B3t93Hy0UApS1n1R9wyEc0eO99akQXyebF?=
 =?us-ascii?Q?QnbVagGvS1GiqGZ5qVhw9luAY1j+YWf334x2FG8Yq4hXhLIjlnRrlQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fRSpPVXdOYdinpR7kLKXvbnaJZe3dUVlbyoxv2yy+7dEFL0MHe0otDbsEGF+?=
 =?us-ascii?Q?gXRauvIAAxQIRH3EVLPDLyGN9McrXZwDMVXeWjmpg8WrFZc2RRIbwPwnUpwJ?=
 =?us-ascii?Q?5yUwFHzjCwKChRjqZKU04qrH96eJhLwrPziXJ3rSFCmzJlnrYwt6PLZad4su?=
 =?us-ascii?Q?bvUFYcY5vaCHRHNsOcDry2F+PdA2b6MqMB0IZOmIFuw5Ue/ESkDjPw34EwlC?=
 =?us-ascii?Q?oC5hBXjs1kjtAcaWw9aqrrqSlQEpJymP54NRC5DlJUtgYI98RCUpA+/Acx78?=
 =?us-ascii?Q?1qwgwunJeWfjP4LRzYsWOHd5uUjSjFLZtwFkvQfsBc5suQH+drZ9tXIawuPY?=
 =?us-ascii?Q?3gVEP3eW73kyEgwsJubVg07gjgvzsk2jVFwfmApx8OWVS9boMtgMu6v8Nf76?=
 =?us-ascii?Q?c3EAKxDXiX0e59+2TF+MN17H00pSycx50g4t7oeYXL/lCLdcnybl8T3CMN9k?=
 =?us-ascii?Q?6UC49bo4E/BVKXHYpkOcmSAD/rYsvfDrQ1IydzPTXxp0NdJOlS6W1BuTSLlk?=
 =?us-ascii?Q?7waO4g3dOMFc2V+DupCGqMmx0lI6C5ZgmcK3ncYccCeYKD9LXz3RQPRqtiiy?=
 =?us-ascii?Q?xHKGfTSPKJBIMOSF/rQzf/U/Pa6iXuYHEqTaly8VDU1XMYHkUUVA595Px9Pc?=
 =?us-ascii?Q?w2mJT6Er7HxaBB+oj9t6TKMe2gWsuF3cpKPfCA3rzPifYPRPkZ/BbwcySSpG?=
 =?us-ascii?Q?wFCPAzeuIP7vc62hL4N3KSQwVWr55o2PEXF8x5/x6O0hZiL3K7MH5gywcPi/?=
 =?us-ascii?Q?lINvCzRrztY6jefmFb1TbBM9rcsJFVRBA3ASoyoH/qLg83LM++djouzjtvvR?=
 =?us-ascii?Q?UylICbCzKicwbBsG98DQ06NNxF3/aV+xvD9lqyd/qXYVHeWQ2IWDtCPkNM0P?=
 =?us-ascii?Q?eC6m8eq30Zlrt4vBNP3QvYNEjWTjzIDEi7f2AcBjU9dD12H+F5NiQSe3z32f?=
 =?us-ascii?Q?wEsqWbrLiI1ab9SqsFiGrL4ByWrK14QhfFgWm1VUIrWTQPpWazUb1k1XVnlM?=
 =?us-ascii?Q?blmsuYQMbDypAxY0nktu0c8ZPOvmKXfY1PaSRbNcHkq8mtS93L4FqarRXX7A?=
 =?us-ascii?Q?k+XB1JgDqADyt9YUGpe4sR2q+kNQFDES3Rs3frXj06xa0yH96OrCIUXxfnuu?=
 =?us-ascii?Q?C5phgUhjCdZucR5lmlPE1j85OfZ3SrF0D2JUJD18ZfsW0ic+DtnFRK8fVVbR?=
 =?us-ascii?Q?NouwUwBgKu4LhfO1oFJshQ3MHwzGdnFjfs/Pl1V0EOyZEE6IMO6jl/flFLFE?=
 =?us-ascii?Q?4xiiBdBs5hTnZeJt36Kabe7+zn2YxkUr68p7kL+ZsULYxCm6cfmYPdY4U63f?=
 =?us-ascii?Q?LvPKlxui8ST8qNAo3xLCqt4D+qInF5MbZRw3AwTCUtH/I8ZgixVaRxPENcQR?=
 =?us-ascii?Q?ECkrSQCRSdwbFE0yvsILyqNaRdFGdxs7RCYBeFMMl1b7kDUaezGPyREHhmzM?=
 =?us-ascii?Q?+IiE78ezAfc3Rd6cuesgYUaLcXA9+xZlEdwy/lPeqQ1MbwbkhQcgnvs3TPqe?=
 =?us-ascii?Q?nhbTIgar/lEXWTK1TYoEkp1E++qR4UQHTQJ2/d54Cp/sRXfQGAYNmrjL+6u9?=
 =?us-ascii?Q?zwGe6n0j7obVn8uc1qoOU16ShnR9r85jGtLskB9LgQH716bJQhc7Tf0aFqE7?=
 =?us-ascii?Q?0zHgSqEWAk4yNQG746mQgoKMkR28Hzi5FicI+bSxnYPv?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b4d65f08-34b0-4126-4996-08ddbecdd525
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 09:49:00.9475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YMANIObp1ITysSHj7Aan8LAFBvyAIDkx1BkweYg1O1RbfinN4m/Cqvx4pNi3hqR8R039fukDWAi3RWhpHwtj7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF521FFE181


> From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> Sent: 09 July 2025 03:14 PM
>=20
> On Wed, Jul 09, 2025 at 11:34:55AM +0200, Albert Esteve wrote:
> > New attempt of including virtio-media
> > device specification.
> >
> > v8->v9:
> > - Rebased to virtio-1.4
>=20
> I wonder if it wouldn't be better to just send a patch that fixes the ser=
ies
> instead of the whole series again. Such a change would be a non editorial
> change thus not requiring to vote again. The v8 has been already voted an=
d
> accepted.
>=20
> Matias
>=20

Right. I was able to apply v9 without merge conflict.
Even though, I prefer what Matias suggested to send the fixup patch so that=
 v9 does not need to go through the review and vote again.

