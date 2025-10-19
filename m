Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013014.outbound.protection.outlook.com [40.107.201.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1379D2E8B85
	for <virtio-comment@lists.linux.dev>; Sun, 19 Oct 2025 12:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760878240; cv=fail; b=Ntl9rO+emHUrD+ZRb5e6qfgBDMptHv2HRxWxF40cRGjjFcbj9q3k97ErOLMJnzVb/X1aqOgHLszWLZagwNx8kEFeYMjKVnz9TpS2ZMo1kpwHkvW2Zy9gejMd31Qmgylz35LoTgzhT17F5dSTBT4HjuStnDzseVROyLwZL90bJb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760878240; c=relaxed/simple;
	bh=YAIlVBOXa7Wz2hdAgn6/cdNeaIJncmN2EH8nqFPMmJo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GGyAPAAIRXQG2UieIxcbqtuEquCEgAWm2ssg9g6ScL7zHCPsV5VIzt4Saaz+FzvYyMDqIQCJC/PUOnA5Zp3cjLFMSGqR5vV6wAHdiN6OYTsY9giopJNc4oskzO6QxQwZlNeXFtHzVZnx60Ysz4XTHSmq8OZGMM/9j4QGw9hfLCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Cqnl/Mdq; arc=fail smtp.client-ip=40.107.201.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Cqnl/Mdq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MYw94qjyN4KT7ZTm+lHZsjq7+eZ5B/harg4PPQRD1u8TAXmUyj5Ve5zXZ8tLZiqSa2YL6dC93lJ8P40R5+I/8J+GwQIWa7rSjDMmQBHK4z/7r5Swdb2mZsCHdD8l5TVqVzHIendzGPNMcpIRQJtS1ATI7ncuvXBjvRlq7IaRA8fBn2zEEvFYnD/79dN4pZ4FiyfoaJGMR1xIHLXS0PofU7jtuOXNBk9Nw1f/VfXewTSLR6SNwtXNlHCqsBAid04SA+iLlbdLiSz6YmgG+cGeY/CKzihhwezAVsDGNpnOhhMsyOD9FKoqUDy4qsf9gvkhP+W2wZp4zlAxWtFCOQVn8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YAIlVBOXa7Wz2hdAgn6/cdNeaIJncmN2EH8nqFPMmJo=;
 b=YVdQ3bJGrBGddaEn1OzKj3OitHFjf18EmiB/E5QD/uY0wax1dCu0Fdemn+S+/4F+lpxlmDuihytjnNj+G+s2cgNvVKzJVJFwFtTwlv7zr4W7Du8xaPBMleh9iwzZ2vmPgI47neydoApGG5nuWtU1KFPVO5Esf229YgH8RHfAoUTrSaZHJJP+4tDpgBa3b0Hqg1CPDf3DVIyO2ZJfRvfs2Lv6r3kdgXryrwkFLE9v3+jPycQrMlItzE0NuFAYrVHni+Vx2jyjEAiajddH7uIvdW+nj4HSGO3csB/xCcbeueTKWeqacfTUM38QBR5g3cWuNQQaaodVoOOnFSIPpTRFgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YAIlVBOXa7Wz2hdAgn6/cdNeaIJncmN2EH8nqFPMmJo=;
 b=Cqnl/MdqeklsZJftwH0d3Y5v1o692mLWDt1S0+0imrJS3EPOdhnxXGw6P+tEYO17sXZSs4Xdkb9i0dXeHDGx1vC53UOWyTcDPsuHgGF50cB9aT2pOZazQHPB2/NYc2sSpJgzJkS1E7b6nbZ0ADtgU/jaYF74OD/KQ/o5XJoUHIwL//mETTvkHKNfOlym+GeZrDkXZ4ETs9V0T06aoQM72TXx5khxzt3tkywgMajW9UajpVHUjaG50uBvx1QzCKmIBAsg/Kp+FlPdtT8UKXfwTM8bkBKnrc8rHnqkwEzY/SLWzogV6gVsn+INCNgwRfev2zaDjHY1iLYxcfkvbNEnxg==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by CH0PR12MB8505.namprd12.prod.outlook.com (2603:10b6:610:193::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Sun, 19 Oct
 2025 12:50:35 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%5]) with mapi id 15.20.9228.014; Sun, 19 Oct 2025
 12:50:34 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, =?iso-8859-1?Q?Alex_Benn=E9e?=
	<alex.bennee@linaro.org>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: RE: [PATCH v3 00/11] QoL tweaks and github action
Thread-Topic: [PATCH v3 00/11] QoL tweaks and github action
Thread-Index: AQHcOgMDA6OGPwWp7025CEp5o3+NGrTGa7bGgAL8+wCAABDUcA==
Date: Sun, 19 Oct 2025 12:50:34 +0000
Message-ID:
 <CY8PR12MB719568D45914289CE12CDE2BDCF4A@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20251010162858.4107388-1-alex.bennee@linaro.org>
 <87ikgdippa.fsf@draig.linaro.org>
 <20251019074820-mutt-send-email-mst@kernel.org>
In-Reply-To: <20251019074820-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|CH0PR12MB8505:EE_
x-ms-office365-filtering-correlation-id: 50328a02-65f1-47f7-d4e2-08de0f0e1879
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?t/7pRYcu/OTyGzHxEq+WyLbxscCVcNMNRAdF+ge3sc0e5Gq29AJ3Cq9S3Y?=
 =?iso-8859-1?Q?tJp8P+KqvEiEID7THrtNbtxyRdUMB7QKJTpebWXeXaXXOuv/ilM9y1hd1d?=
 =?iso-8859-1?Q?ucqEeIDQ5Ez3wFFuJW1Oy7CPCbwpPUzQ/HCrFL5YTMF/LdiD52x4eZWIvO?=
 =?iso-8859-1?Q?VVFTNR6FJk3r2Q4eP0BD99xFsrsD3QQaKhos5NHEdC+25FJVb9HwD7L6Nc?=
 =?iso-8859-1?Q?pthNfa3Z6TepjepI1ChNXQQNwxxgJTV4OcDO7HaL1EQ7TCVrQ/UtqvgwSl?=
 =?iso-8859-1?Q?Kvwt2xEYuc3fHB1FIsZsecTJfQ5IPPpgDbgWocl27luWsHifi/fIRiTA4p?=
 =?iso-8859-1?Q?GXAQd8h4hJlywzeHcMFpzAtvtfCxMT8yuG6aCgz8W4Ve5oqT6onzCgHxGT?=
 =?iso-8859-1?Q?C8RkBq/HCKhsLfNQJU6Zslq/GGjGikAmz2ViSCou8F8qA7IXPkXxuyY0gF?=
 =?iso-8859-1?Q?LJzfbnnUEuai3TFYlik3T3QC4pVmRw6Dzb71q3AHwteniGT1wdUSJyf2Ny?=
 =?iso-8859-1?Q?6Ejbco1bPpVYB9+ngiTzDZrK0gB2i97GV4xNOaTsMcyqbuiomhQhF+NvaF?=
 =?iso-8859-1?Q?4YRvX++Vq9KLL2jsGI3XUZMWxVwlLhzzDcp4B9mqdI29cOdeyXOxwDZHhi?=
 =?iso-8859-1?Q?sCMhNm3dLLD3KsKBRAotZeRoII9vlIepTp7I8WOi1Y50fJ99uC4H8Nsa5T?=
 =?iso-8859-1?Q?WmsBKEJB7yi9zWaW+HRoiTDyss7WCLF813pU9dZHFhlhqWt7FOuYObnKCp?=
 =?iso-8859-1?Q?xYPW241/uyXxiJF/tOlEAUzMJU0kpdCUtKwJJ2HgxwWUA0cT+P2yYlJdzB?=
 =?iso-8859-1?Q?PvG/Vl922KO3eMNgUNNiogpqPLLwkYP3IqyCTk1Lr7NKmov5rVuiJilYyj?=
 =?iso-8859-1?Q?8Mk6xcNY/NpYktCeVf5U72het9yf3vGOhYqNba8pdyBE3rB/GRQTrdC1ua?=
 =?iso-8859-1?Q?M8hGL8lpBdGy3LgIeHtxFhb/OQc4At8uNomDXT/lzPTPOeaNFEjo+xKxMq?=
 =?iso-8859-1?Q?uzr6/EhrA71PH/EGY3bQDYXrJTtWW5e+Td/XO5D37s/zH4HeQNziybPtHr?=
 =?iso-8859-1?Q?rHPyRfByhtlLtSYvWxuCD8E/bPMz4r9MlEW4oNPxmixNZMFPcsKDIN/VXo?=
 =?iso-8859-1?Q?NEaDUJfFmwqkXWpH6qOEcrk/k+mBAs1AxW29VpmEyB9I5q95GoJPXgnTVn?=
 =?iso-8859-1?Q?YM9ZQaz0gW6W4b3lpki1pTuhJCWJK+Sb8ud5CjmrFXSzMpHGr8h4+n2pMa?=
 =?iso-8859-1?Q?1Kj5ZDRfUHmLmHtA7U9iPclnZbR/LXXBdo0rj3ZqKZgWJWqrAY5iE/buvw?=
 =?iso-8859-1?Q?veRaCNE+oDwHqvLRJXJWi4WVO31L6MCnQFNeKzjxUQw5GkMt3+vKH139WG?=
 =?iso-8859-1?Q?ZLnHQoBNTr3ZXeSgiulRq7FiV7PZz9PC8bRXZYUixn4lxb7hDguuR4Azct?=
 =?iso-8859-1?Q?LpWy+V+rlJx7t0g9M7LY1Zak56nfG8OU5uj3zAlGjPJIV4YhxPQ6e4CCbL?=
 =?iso-8859-1?Q?qMW6ibrj5DqR5jYeZ1X+VGWaqHEzysme2Gtq1DDQJlHRHK7yi319wGpTb5?=
 =?iso-8859-1?Q?vM6YSaVatP4Tz9ySVn8ItkRe8rCr?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?NoPW4o/U/ixhXnkviY2MO99metd1X8jmExhHcVuldltgKD6Dv1cZR2psdc?=
 =?iso-8859-1?Q?XtgPYRqMsNstFPGcHxQyJ2M55/QtD+PQqt1SiJE2DFo2bgTU/hAMAKBRZ6?=
 =?iso-8859-1?Q?74scBH7n88GjdqIR42V7bgtNh7E9U1NAaG+/tm8KQ4428htNRoj36ZqUhi?=
 =?iso-8859-1?Q?JQcmTJ4IQNcKmFx3lQfubM16zhpFF3Omys76CD5u4dG8Belg59TS/WYhJc?=
 =?iso-8859-1?Q?qliKi2XwZxU6PEfxKD8F1A8cl9ZgiXsKI4iSZlI7njouWDQCe8oYn3v9L4?=
 =?iso-8859-1?Q?wv7b0C4s9qBufEYtDpdweXAJ/ukWEwbyLTiR5ezQvJKxhYiMRYee6Ckfqv?=
 =?iso-8859-1?Q?rTbACU2bLEuFQ4LiZ3hfpXzsfwou2Rc/ITebSIzL9bkadQEku9ds+ZesAv?=
 =?iso-8859-1?Q?YtZMwmEA1OfDU7LcDgCGu9qG0UhKHE9GX1rRvKUM8ZmtTx3OyqdGmsO3NB?=
 =?iso-8859-1?Q?Fy97HksNiNXI2yZrdoNO75F5GzDzisauGZh/dDxqD8qHaL+eM1yVpdYnnQ?=
 =?iso-8859-1?Q?ojXemsERVA7HMfksC5JswGMLb1FCmIrj7sSaU0JGA91Yog5GWI74DUty0o?=
 =?iso-8859-1?Q?fuzXZYjh8bnpReu2e5t1ZXMCeQHyS8AXYNYhEzessK1+JtxIzzmLDg9BHG?=
 =?iso-8859-1?Q?7JmxulIdjFkTxnq27atdJiHy6CKkG/fIghuElzUQQJiwoO0b9vJsYN7NQe?=
 =?iso-8859-1?Q?xJGPOvpLTy+EvVR32ofSZUS02rLlakgN9q7GU2kDvIznGiMveiDUe6qjuJ?=
 =?iso-8859-1?Q?Oc+lGDhi0s3PFeDyyTbHO0Y201OOxvseIbX7t1DXrVSRSRJ5KLZ5dH3uND?=
 =?iso-8859-1?Q?AEl3O9qPhBIUFFLKyrKCuF22NhkKO0JbrJPOMfHibLwKljvTQZu8mf6pEC?=
 =?iso-8859-1?Q?Rp4n3K0aH9+sps7j7K1+Y8JJkzzRbyF1E9rJuW9/dT2B1ZUgZC2WpJ+peP?=
 =?iso-8859-1?Q?vnsF8GwW2qQFgYo/z/WKwdfVIk0cU7ZovLkDapcq1M1I9fnXnNxxL+VX3f?=
 =?iso-8859-1?Q?QJ9tmoCruz4P4n9zvoUV0KTzaJ1tNLjwYC+/HRU47t8SYaQrDEeaOoFQBs?=
 =?iso-8859-1?Q?kNEBibYWuaW+O4LfbliQPb0wd53uF4ceXumneQjfMAp/AiGeOoZ+BXQN6a?=
 =?iso-8859-1?Q?BQOr/ywAaAoU3L+4nyw3noRntBIjF8Xt96DD4Wu7WI4kX+tcsFoQ37qcqS?=
 =?iso-8859-1?Q?4vYnF5Jfwd/R83L/s4C9/0EBjKASdso9MztZqdYSlD8f8tqNFvh3A4cnLt?=
 =?iso-8859-1?Q?+3NY5xn/Nng/3f3XYhdnh3YgkzQSbEY+4d9zkinO7oXpcOyEAvhU5sdoZO?=
 =?iso-8859-1?Q?EJZBYjgnsP/5pBuMEZSqxKdfiBCWbDSKpHL8sd5br8J3Eiy7Bku83oxmtK?=
 =?iso-8859-1?Q?6HSGRZaSBqJs2yAZfhaVnmgWPJRTmlCksbKaYHdE8mU5DCoYJnm4VuizVI?=
 =?iso-8859-1?Q?l0rFr41K22/DTed33LvYGv5Zg7PWleiOiEUmyjFQB357jsmEqdZo5jhntH?=
 =?iso-8859-1?Q?yAOZ2mjskao74hXl2wwsDKFAv4QuBhuubRAJN8AaJdZfQcBiyMcuOQIggf?=
 =?iso-8859-1?Q?AU6LOhls0fP46gs7TvlQxii0H9+FHELeNXjoJqMeSRAt0jfCw3NAI9x2EY?=
 =?iso-8859-1?Q?CCKpNFAgGO4LXkzUGPlwow4jUl+eR4j3lb1rOVMGcJA6uMECHYFE8YdwxG?=
 =?iso-8859-1?Q?mf/dFs0k1unKP9rV3Jc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 50328a02-65f1-47f7-d4e2-08de0f0e1879
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2025 12:50:34.7490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ShQb0Cucblc77URP5Od3BAA9BNvKJJZ2lVq6wzP1dRf87UVPJprpaTxaW6F47ymRYNiLcN2yLP/899XS2DLGJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8505


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: 19 October 2025 05:19 PM
> To: Alex Benn=E9e <alex.bennee@linaro.org>
> Cc: virtio-comment@lists.linux.dev
> Subject: Re: [PATCH v3 00/11] QoL tweaks and github action
>=20
> On Fri, Oct 17, 2025 at 03:10:41PM +0100, Alex Benn=E9e wrote:
> > Alex Benn=E9e <alex.bennee@linaro.org> writes:
> >
> > Gentle ping.
> >
> > Michael are you happy with the marking of the draft now?
>=20
>=20
> Could you fix the layout in the generated pdf?
> If we are auto-generating it we better make it look sane ...
>=20

I didn't get a chance to go through v3 and some holidays due to my new year=
.
But short update for some of the patches, is that after discussing offline =
with Michael and Matias, we will be taking the patches through master for n=
ow.

And soon I would be tagging master for 1.4 release.
I imagine that Alex's patches likely will be after 1.4 release.
