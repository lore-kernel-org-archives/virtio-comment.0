Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2063.outbound.protection.outlook.com [40.107.100.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C1B172794
	for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 07:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718091707; cv=fail; b=qTMIDuKIPtxGXQpvNhN184WLXuCKkR6kZBhaiqYkDQi8Xq221TULg4qcv25KXynOzduYroGGzh6CE+P37CViWQ7AQu9loduZAM7JZilo7lDtKOvXQ19FUsgURohQiNlqw3I5kdc13Boe7MTKsZMVLFCKMa7G0x5uYDavxZJvdig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718091707; c=relaxed/simple;
	bh=E7dokQGHws0ytHii3Ku2nBGMQWwHs1EnrmQhQTK9oa0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CdLHwFYjjQYqc6StS9jdk9VpLe5/1z8Fwcu81AdU+dmFtj7gbKXD0+w8SEE8Y02+SnIyAOTjYlCymOrhdVAzKwqIQnmTIB5+yxwiKyga8shRJkp30tcDqEk1LHh71s3WG8eBLfcwlFEgrmWhaWL1Tc30TiYHAyMglqrD/Z7cXhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WAEMSw+Q; arc=fail smtp.client-ip=40.107.100.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WAEMSw+Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HSPArAPvoXLZMHcLbGoHvDZJKOUTWl9ToU1qKatlfc8B7p7d67C7z68tDy0XigCGnZHEIZiKncFBZhroW2bRHUO6d5T5dgSQjxhm1Gb2vaAOprAC2JIy8syfGI9yNveCY38e/lzcA3R9C4r/fT329kOrs51yo7QN/xDo8ChPb9RwrUiA4bYjDMcRoSbbdYFC7DGIYAkqdxxmN6kD2IJbYPjoXP4aRrAcNE/qdx3S9SL/1wq1Yc3ctbSxKd5hdP+lmG2iIgrEfPAyU7lTN4sehd1EstayEG70cNuFeasTzO95NxmYOT2nqMmo/a8qxUvuB/vxTDML6AuqcPYQN0kLbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7dokQGHws0ytHii3Ku2nBGMQWwHs1EnrmQhQTK9oa0=;
 b=iaBphvH5bXki6f6KgEtp2RrKmT/2TlwvmbDp3y8NGwESpOyXlaO5Wp8u1OW1NSidAPhRoYoQ34L6aM+J7rM8dTqn2pJk+a7LgmwlDLsuUextXhsYLGxyUfgL6BYW58Apm4TxBxT/Fww9wk1i6/GWro08xhzVGl2edrSSl86eajedW2QTx1O3ju1XV2Wah2jOGga62PPsC8vHw2tmrWxoSKvP6QjbUFbqorsShEDa2AaQYnD0mCeBrX1TLid+cGoHwxIad5vzhBTzdzy1ZOQXytrAKtthlrDBfKWmd6dJvcM7ZnW+nXc70W4L8i0M8wA55lkhNOZo5DXpWxLj8vHTZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7dokQGHws0ytHii3Ku2nBGMQWwHs1EnrmQhQTK9oa0=;
 b=WAEMSw+QDIRQTRCQVVH0UvAXY/BZ6vtS++a3bGArK+cdY93TrZjmC+WbZ8M7SmgFzvYOJOl8h2DBcT7XuvxRSotFkggi59nkBIITHCXDUYDEr3IDuXEozT0bvTv3/g/pSjAKQ2erA2W2no+V4Cs2O/R2Wn0q4RkurEgT+Yb1pDKbVWFknhHZqui4dMecgJU29r/K0A9uX7QPcI8EbDzRgb/KK0YD+eUYUF6s8Z+PAfOozJ1ve4pnJc78DlVvaqLF39fv+iIpKAbhEcQsTAFIZj7jOaVNN3dIE+QY2lLeMF5YiGT/4f9D43QkxdVpAHPE81Jd2p6bu4s8msFD93ffaQ==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by SJ2PR12MB8160.namprd12.prod.outlook.com (2603:10b6:a03:4af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 07:41:33 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7633.037; Tue, 11 Jun 2024
 07:41:33 +0000
From: Parav Pandit <parav@nvidia.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, Vincent
 Guittot <vincent.guittot@linaro.org>, =?iso-8859-1?Q?Alex_Benn=E9e?=
	<alex.bennee@linaro.org>, "stratos-dev@op-lists.linaro.org"
	<stratos-dev@op-lists.linaro.org>, Manos Pitsidianakis
	<manos.pitsidianakis@linaro.org>, Cornelia Huck <cohuck@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>
Subject: RE: [PATCH V5] virtio-transport: Clarify requirements
Thread-Topic: [PATCH V5] virtio-transport: Clarify requirements
Thread-Index: AQHau8GUIND+r1IV+UyIhrsUeJlUDrHCENgwgAARHACAAAmT4A==
Date: Tue, 11 Jun 2024 07:41:32 +0000
Message-ID:
 <PH0PR12MB54815595D5B533A6E38636F2DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <9d543789de03d26a27a43ae8f7621d07d66e8731.1718084050.git.viresh.kumar@linaro.org>
 <PH0PR12MB5481413D59F2DC236F0B59DFDCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240611065816.lq3ehs7fmpjbihip@vireshk-i7>
In-Reply-To: <20240611065816.lq3ehs7fmpjbihip@vireshk-i7>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SJ2PR12MB8160:EE_
x-ms-office365-filtering-correlation-id: bd56a3f5-7ce2-49c4-faa4-08dc89e9ea46
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?SbhuUOk+iU1HLVn8zU09ZpQ9fCxuBRS22X7n03MpgoyMdAsncidm/U3H1b?=
 =?iso-8859-1?Q?F2utDoWGKU20dls8ieC0tZk9ZOgPVBFQpDS+mTlyRQFsudmDkKt0KZBxBU?=
 =?iso-8859-1?Q?EoTc1WjHRBK9WuyflHN4RN8zG0JKBJe8dXlUeFxODnsyIrnakyykZwRo9C?=
 =?iso-8859-1?Q?/O5dxqQstaTR/9QnWPSejzTT3vlLpsZFFCTBCgom7q6o9qnPXjTIcBFVK3?=
 =?iso-8859-1?Q?qm+OYbkwt/zYuNGQq0LWZugpmzVB0gf7Zr4M1FyYXRChzmlFFQZrTkxt6L?=
 =?iso-8859-1?Q?wy56KGxBfx8UhJhWijxidXMQmqX4Ef4zj5H96CvT8kdDs6DdVk+7c944Yt?=
 =?iso-8859-1?Q?m/3ZyJv6LcM9BZJEZBRDweAf9e7Qi4e77jGtAGt2w2yFQJNj9qz68DcNhG?=
 =?iso-8859-1?Q?GIKgVyUywC+RxPruyCCzNdUqFdx7Wvg5FIFXVF7rrDx9cYAMlHQQcUeld7?=
 =?iso-8859-1?Q?MKjOaSkbpAAT1ElZ+dE2pSKkDN8lMDETA1bBcnxt6Ot9IId8au7t7A4/Ay?=
 =?iso-8859-1?Q?teVmiNMTKDSEHOB21HvpkKGp/KKKOpACsrvq6Fcm7F2dIYrTTWCP8ACos+?=
 =?iso-8859-1?Q?QMwb3zUhjDENcHABYFcXR6heSQqacDhRHlo6PYvz0G58kaTdy7GsNB8T7T?=
 =?iso-8859-1?Q?zRwKRwEmwcoApdieiiHvyGKpe5+SwoiwfOmyv9YvRNf94o1ivsVQpayl8/?=
 =?iso-8859-1?Q?yPGPk6+yRL1kyahdvYfhn8MwxdcSSLuspLRQ6sqgVDnIASO+sVPT+0JLIE?=
 =?iso-8859-1?Q?Sr/MIhW95w+56FNfxpg2XOvQqMuxBPHpppMDXo7qp3DSLqW8wXuFSbfj3j?=
 =?iso-8859-1?Q?TtOScWnqfKdqrhP+OKRrDN8meBr25/am8424ZYm7SoNUs2Epn7uBS5IBGm?=
 =?iso-8859-1?Q?L0sMdHRpSGGxbuvf6nTAbrOxVOqiKHDHqMcjerINh7zilB6X2iprka43i5?=
 =?iso-8859-1?Q?3GfJiIN0HKE1QJWADEFZL+Q9/voDDKfuZUJceMrieQ2BHJL/GHCfUt3q1z?=
 =?iso-8859-1?Q?N0sgY8iI00U9wGaOsAIs6naBOAgRtGRZVeAy4cZz+r6jJFxyTFBSyBhmhy?=
 =?iso-8859-1?Q?WxTM+p6ohM0kVFSJe8yUgDLQgYSUyxeD4Vm5u57n19/6Vp35+FTnqtZw76?=
 =?iso-8859-1?Q?L1i119T2tMJcD+3Jummv/B6o3CgpuMVHZkesAs6QKijJWVFfAp/SdwhuSf?=
 =?iso-8859-1?Q?occoEpUTUXjO6ghbuZWNqCvjVtS9g9ES7gjMGxxX5RKEXFXu+D4Bcu6c/M?=
 =?iso-8859-1?Q?qHN67aV5tPjS7CL4wkrJt1KmPBb9pirh8XzozCSP8blUaN7uztchQ2EgK9?=
 =?iso-8859-1?Q?GQKZL5RvUIjXIMGsCRyEPYaHuC1e1EIOpwGS40bPI9Sq5XIJuPl/myS4gQ?=
 =?iso-8859-1?Q?N1HTomPDnpRkR1jaf8ie+F/UoBXGrihUpVYANQJ1QO0ilIES7Crkw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?pWgufyLuaoA56XTA7KD1hCRKzltSiXFjSoWjaXir4YtF5WA2rxp336Eisu?=
 =?iso-8859-1?Q?/NnnsjiWQvBHps+anRp+eNKq89HoYONxgwjbK7aHz4gTdBy9DcDbN74pJ8?=
 =?iso-8859-1?Q?XZ5ZCgNSIMscPhqBBq6hVBIBizWWh+u4tHaiiwxCBUNQf23bzMpj1J/2p0?=
 =?iso-8859-1?Q?a99eL+995nG2MPb+Nn1is9aARNRyHVZw5TPyUEg5ZY87ai4zl+3O1FSMZF?=
 =?iso-8859-1?Q?GQ2L1JFa74y/EGVdJaMnWyleviGR+5WhX9xCtS/f0k9UTyLn7hbP2RE4+7?=
 =?iso-8859-1?Q?MLw4VO4yJZ+XbARnKkafDuhTQZFXoJNWgffT0Ryr2IviHzvpEBIns8i+8f?=
 =?iso-8859-1?Q?/QX/obWevWDNMTLFlrcxbWt93KlsiA+g1lmJ+oqXnooa6RxFzK8H7PHAUc?=
 =?iso-8859-1?Q?lKtr/hbshG+FF0FEM9nCtC6N4MfSpkjkPlf+4FNDdWet9Z2/UAP5bgGD6f?=
 =?iso-8859-1?Q?JvLXjFNEhMmvdgv2mv3b73i5tPTWJh/vSrGQbwmYke2QNZAXCQgkloYRV1?=
 =?iso-8859-1?Q?XtnkMZcasH7aVTNz7/rtsNGJ3rwNOqAxOL0i7z5BQ0IBGglacH2yBLIB8+?=
 =?iso-8859-1?Q?mPcLNo2iV2vgkGHjwWx072SCqr4sGglPSTnwBqE7GaO23KVEEfregDShYB?=
 =?iso-8859-1?Q?EOzlGE4gNZxeXrHGIcTaOKK2b/WZGFAk1igL3/uM/Nbp6tCf0Pm6I6zAbg?=
 =?iso-8859-1?Q?qJ9hBxdGoZQP10Lj5TTD+BFK7XUOiq07OksNPMSR3HGM7Dz5/pX32VdmuI?=
 =?iso-8859-1?Q?lYwML2++tsPh2ScAIEDXU0u2G6IZRADcxKeOaiKAzyVmqMp8ZBnhKVCXxZ?=
 =?iso-8859-1?Q?GuGDcC+aorg1HzwSsaepJMiDC2X+Xw6WI9udsPYkgtJr7mohLx2QdM2sKR?=
 =?iso-8859-1?Q?na6NjCZwYF+Ey+GvyZSvKLOu2hCtC1lgskILJqNPqH/COLnclEjYBqjuuh?=
 =?iso-8859-1?Q?wJUklFVIXG2MkXkUfx6wZMOnw+jRTZ71Cfktu2kaZJrgyr8nprtU42BRe5?=
 =?iso-8859-1?Q?5YzSwDyBN6lfWSShGcVrQXc1pvs4YVkIDMXbX2lPRTwC9HiHdkHzTkCR0z?=
 =?iso-8859-1?Q?xo8Moh4+CWnC7i2dy9oY2CHTV+7V8AXmnqX+14SGvmPJqwNF6Vk3JTwxZn?=
 =?iso-8859-1?Q?VmelyknZvF9S9HCLMuzsJzUpLsrFZw402BLKXp9q9eOsd0rVUrrnekD3At?=
 =?iso-8859-1?Q?NvNb9xFg/jenz+E7JpnFFlANANy+B/zhMb72eSUM7PpUCW7vxbt1Mihvsi?=
 =?iso-8859-1?Q?HIFH2hUUZ1oUHII31B24ELHnmjKeVQShSl8H5dahe8/reXoMvhN5sd0NY5?=
 =?iso-8859-1?Q?5UzEL/iM/VNi7EfTazfzr9CtrYfnhI2yisTSzMBO0G2/QaiqDJx2KcgsII?=
 =?iso-8859-1?Q?UOEL6eLNuNOTqH7n8k/qT+QQhnEHoce8yVgR3466MVT/yE8I1GW6Ilikj5?=
 =?iso-8859-1?Q?LooMVxB6mCttlBhe5aUangAx+ZnE68npQ5fyVD3We6GMfGTXnjIGBIlSL3?=
 =?iso-8859-1?Q?VQP+jkp+AWM4AtDifTUkrGsBUpVELbloFbqM/h+TQfe6G4uRz8mRb4efRZ?=
 =?iso-8859-1?Q?/jGkXTvcr1ppOZZ58DqqBRzM32u9M7+2nHKvU5s3U46SKj8KEQta72iLw2?=
 =?iso-8859-1?Q?Y7cdlHxrez/bM=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd56a3f5-7ce2-49c4-faa4-08dc89e9ea46
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2024 07:41:33.0118
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YMhCrodCMyR7DDWsOuoebpnMijlZeqOSLACDjdqTNFtdSV/Y+1Wx+1ZVZAHrq7nz6QVYubqi20B3fqvw/sryrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8160


> From: Viresh Kumar <viresh.kumar@linaro.org>
> Sent: Tuesday, June 11, 2024 12:28 PM
> To: Parav Pandit <parav@nvidia.com>
> Cc: virtio-comment@lists.linux.dev; Vincent Guittot
> <vincent.guittot@linaro.org>; Alex Benn=E9e <alex.bennee@linaro.org>; str=
atos-
> dev@op-lists.linaro.org; Manos Pitsidianakis
> <manos.pitsidianakis@linaro.org>; Cornelia Huck <cohuck@redhat.com>;
> Michael S. Tsirkin <mst@redhat.com>
> Subject: Re: [PATCH V5] virtio-transport: Clarify requirements
>=20
> Hi Parav,
>=20
> On 11-06-24, 06:10, Parav Pandit wrote:
> > > From: Viresh Kumar <viresh.kumar@linaro.org>
> > > +\subsection{Transport Requirements}\label{sec:Virtio Transport
> > > +Options / Virtio Transport Requirements / Transport Requirements}
> > > +
> > > +A transport provides a mechanism for the driver to discover the devi=
ce.
> > > +
> > I would like to add a normative.
>=20
> Some background on why normative statements are removed for this
> change:
>=20
> https://lore.kernel.org/all/20240521073925-mutt-send-email-mst@kernel.org=
/
>=20
Got it.
I agree to Michael's suggestion "I feel a non-normative section is enough f=
or this."
So following his guidance, we should remove it from the requirements and ha=
ve this as,

"implementation guide" or appendix section and it also looks good without t=
he key wards too.

Otherwise, this requirement section becomes the example of how not to write=
 normative in a normative section.
(and we want to avoid future such examples).


> > A transport MAY provide a mechanism to create and destroy virtio device=
s.
> >
> > (for example PCI transport provides this).
> >
> > It isn't blocker for this patch.
> > In case if you spin v6, please add, else will send this change after yo=
urs is
> merged.
>=20
> > > +The device doesn't access or modify buffers on a virtqueue after it
> > > +has notified the driver about their availability.
> > > +
> > This needs to be corrected to only say "modify".
> >
> > A device may still access (read) what is already wrote, for example, us=
ed
> index of the split queue.
> > Or packed queue flags.
>=20
> Hmm, we are talking about "buffers on a virtqueue" here. I am not sure if=
 the
> device should access them anymore. Once the control is passed to the driv=
er,
> the buffers may get modified anytime and device shouldn't access them. Us=
ed
> index or flags are configuration things, accessing them is fine I guess.
I missed the word "buffer".
You are correct. Above now reads good to me.

>=20
> > > +The device resets itself and the virtqueues if requested by the
> > > +driver, in a transport defined way, if the transport provides such a
> method.
> > > +
> > > +\subsection{Driver Requirements}\label{sec:Virtio Transport Options
> > > +/ Virtio Transport Requirements / Driver Requirements}
> > > +
> > > +The driver acknowledges device notifications, as mandated by the
> > > +transport.
> > > +
> > > +The driver doesn't access virtqueue contents before the device
> > > +notifies about the readiness of the same.
> > > +
> > This also needs fix.
> > A driver may access (poll) for the packed queue flags or used index of =
the
> split q without device notifying it.
>=20
> Maybe this (in a similar way to the device specific sentence earlier) ?
>=20
> The driver doesn't access buffers on the virtqueue before the device noti=
fies
> about the readiness of the same.
>=20
Right.

> Configuration specific fields can of course be accessed anytime.
>=20
> > > +The driver accesses queued buffers after the device has processed
> > > +them and notified the driver of their availability. This mechanism
> > > +is transport defined.
> > > +
> > > +The driver asks the device to reset itself and the virtqueues if,
> > > +for example, the driver times out waiting for a notification from
> > > +the device for a previously queued request.
> > > +
> > Please remove "virtqueue" from above. The "device to reset itself" is
> enough.
> > "and the virtqueues" is confusing, it sort of implies the vqs are somet=
hing
> separate from the device reset flow, which is not true.
> > So device reset is good enough.
>=20
> I wonder if it will cause some confusion, i.e. about the state of the vir=
tqueues
> on device reset. I understand what you are saying, but is it a given that
> virtqueues will be reset once device is ?
>=20
Yes, it is given.
See the spec snippet:
" A device MUST NOT send notifications or interact with the queues after in=
dicating completion of the reset
by reinitializing device status to 0, until the driver re-initializes the d=
evice."

> I looked at: "Basic Facilities of a Virtio Device" -> "Device Reset", and=
 it doesn't
> talk about vitqueue being reset with the device.
>=20
It is covered.

> Also there is a separate section about, "Virtqueue Reset" and it talks ab=
out the
> possibility of a virtqueue getting reset alone.
>=20
> Maybe something like ?
>=20
> The driver asks the device to reset itself (and its virtqueues) if, for e=
xample, the
> driver times out waiting for a notification from the device for a previou=
sly
> queued request.

A requirement should be,=20
a transport should provide a mechanism to reset an individual virtqueue.
(it is not must).
