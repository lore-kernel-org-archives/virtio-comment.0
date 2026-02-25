Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012054.outbound.protection.outlook.com [40.93.195.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98763D3013
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 15:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772031633; cv=fail; b=E554+oy57MsCUypI9S/eNZEb0A3QCYu17STf021tecbyin1YfUgFxHKzZ6k1vPbivewmAr9TvqNg1xTRyrJbJS6ejTaagVpr6RbWic9D8wwjUH20sMTlW4L2P/IOXMk57cHkpeFslhCix6DMfDirZWqHT44nBrAopTElmrgl7aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772031633; c=relaxed/simple;
	bh=W2dmioiZLtdV8Fm23eGUU/69s7aiA8oKP0iGre2UsOI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HsJfJ5Bcp+PdWCVsAOuhph3sAHU1FYqOOYDyO6f5+GYWv3qpwnbUDqKEBxZgEdEAUXLhPgQje9xXLBapdli+odgwbYrPhs0tM9B1yuEJ8mOrXqV7frlfgcylrMqPk70j8NB29HCxZVaTtolAgjchY3x0GIXUB3EWI0Nk/BgUpoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=midsijtp; arc=fail smtp.client-ip=40.93.195.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="midsijtp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rzIrN7dUD3qx622RGLZMYyC3DMqfjUpEHZkCKArU+3VvNaxvToeHDYe8Rah1bB28o5Rxfk/lwYHv5X/A8rVHlQi6Cfo/HMfOtTpC1lHHyIdwjIjnaIiAP6IvWPNXo+l+y0KjbZ9yJ2K1WpxlL3LiBxG1UKMJl6flRFIuf32ZIkRrawWGuAizuViRX1+Zj7BY/EG+YmYECZsAgwTsZcnkioyacFdGCs7Ry6I9TwPpz4aK2tRUVTrMMKKYrvSOUSOdmANyuThnGeHQgcV7nZPJZiG5hazWDF3ASg/ZDahypyedMBBa5x1nvk9DdDKc+V8enW7DFvx2uKse38h2gwo7kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2dmioiZLtdV8Fm23eGUU/69s7aiA8oKP0iGre2UsOI=;
 b=uBH75lH2xhT/qziQabkOn5S219h7y2zotUg016CSMhiCu/V3DYNPWHJDU5x7MtcRtK7OkKGJYllb0lUFK/phFQyf5VdTtX9mnx+zCovc1xLO4XDMjGjICgiyz/h7AIfdR/7KUlbF6kBO04gNsP2Dl54C5oo5+F0DxA25Bu5EzxOfZoYpDBRUk6FGrfgHsibwXMyBlMR7BZqCBKhEgcdo06Zk5rAQwk/s73nNCvTbr1AZ0cxhRYBnm17/IJU5sUy+pF4xBO6DRIBpg8QbpQJSxuF8hOXXfKw99idFq3tjJKNE3KObZk6zA2uJnXsTYbXulGPddGV++HR2h4J29jsfAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2dmioiZLtdV8Fm23eGUU/69s7aiA8oKP0iGre2UsOI=;
 b=midsijtpQ2+SRvCuKU4S7/qE3PprWjPObnCVYfS89IwnOYwKRK22aZN/iqb0qvlRvJis3mwX4vG8+KeJHYqMZQIM18HgQK2OglelmdNwI2lAJlZ343aAYqHS85p/57vdSaXL8HTzhV9lKoGPa64/6LfVJ0YbKK/y+Y5ovGxyuBR3WtLqDivySYMDyRwwPVX1IeIwCV/50plae19mvbfZHiMKwnsUsxN03yopHmOGjv2yrQo4OW2EFhqYV2ronnO5JdTJQcf1nXDHaMp3pHeplHbDjhone+jtLwlft6SjOncmJkCN9PTLKYoy47QrWf6HjBvJ7v1Gg1UN/BBbIjtdtw==
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 by CYYPR12MB8891.namprd12.prod.outlook.com (2603:10b6:930:c0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 15:00:19 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6]) by SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6%6]) with mapi id 15.20.9632.010; Wed, 25 Feb 2026
 15:00:19 +0000
From: Parav Pandit <parav@nvidia.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, "Michael S. Tsirkin"
	<mst@redhat.com>
CC: Manivannan Sadhasivam <mani@kernel.org>, "Bill Mills
 (bill.mills@linaro.org)" <bill.mills@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "Edgar E .
 Iglesias" <edgar.iglesias@amd.com>, Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, Alex
 Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
Subject: RE: [PATCH v1 0/4] virtio-msg transport layer
Thread-Topic: [PATCH v1 0/4] virtio-msg transport layer
Thread-Index:
 AQHcjuFu3dyU46FhXkWSoPS8nyUxT7WAvzgggAoZRoCAAGdhoIAAMZEAgAfGMQCAAAUmAIAAIlAAgAACG8CAAAYFgIAARRCAgAAB9wCAAAEjAIAAAL7A
Date: Wed, 25 Feb 2026 15:00:19 +0000
Message-ID:
 <SJ0PR12MB680642C4277CBAC888052FDEDC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
References:
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260219185034-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <C6374491-FCB1-421F-9273-16B9CB954F5B@arm.com>
 <vigplm62id3vzr3fzekbn5io6qcpeqksgxph6jm4f2qzoripkw@sdh7k6ohw63t>
 <359B0C17-9D57-423A-A229-6CEDA19C975A@arm.com>
 <dyiwq5xhqeoaqmzquzzx4wxsptm6uvrnfgspi6vmcaucq6jn4l@6dvya4te4vsj>
 <SJ0PR12MB68068259D212C6AC8B6A5DEADC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <02226901-7670-4AAB-8F55-0B2FB7C0CA49@arm.com>
 <SJ0PR12MB68068FA1D1893B774C5A8A15DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260225094902-mutt-send-email-mst@kernel.org>
 <8B4F5FE2-1F80-43BE-A60B-5C24B69C8B4E@arm.com>
In-Reply-To: <8B4F5FE2-1F80-43BE-A60B-5C24B69C8B4E@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB6806:EE_|CYYPR12MB8891:EE_
x-ms-office365-filtering-correlation-id: 4f9c5d51-a7fb-44d5-508d-08de747e97e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 hEvEGuuZa/0nahb3O+V8k3GO3EAKanfwBvKWS9Bucj6RdHETzDsSWybuVviVFT+juVcfIfWlw1FiKvU1sba36V3ha3E1K8YS/dK+5lx5PI3Sm3iEM58qlN3fksjlzeyHMlUArSI+TGsAMNUFIK9E8JKxK7n9Zj/d33n4eKjLF6Kqf6gZfw0o0q3trPEZeNMO0FDfJ8h/7JF+wDAZds3aZfEpQGZqQRxrftphUHgPRsF0e36yEgVG8H2YqTzDZVZhuOYZ5nSgKNvCXrPptZzI4r9zSG9Sr6aMkkX4X5bJ7FxQEXg/3X3htg20IWmpKkKUsktOdpwdBp1Ekl/YCFj1HKF9vN9c4DE3SPVbI6O/Hh8r+24swCwHr6SWNJeKD3iWKZwXUGh9jyDSzX2SkVdnvhxMdzEc2x2SgE/Pc1Ef50Zekjb/J9OVRspn8LWtsrj9RP3xLfHYG2+R3EMJoqeDaMTcQkHY7VLJlS5sdJTVQNyVMeukgMIL1zUcRAgZPr3j0hRybRJc0TZLYNHftQrM/CON1n3Ij5KxiA/Xnrl7fWL0Q+RdPxYXLau79KC+mIwxW1Nt0j3joShSlYHNBL17X6rcs9sNa2RFFZMkCLi9sSJMsSd3xGPFKhD+/7b5Er7k/gvgaMNl863IodW04QPsUa7HfNZiNEmJfUA6h+Arpk7Q+5nRZM7iT+H71As0Dvvwe5HNKbx8doNZ9vls7dVBuO2daXo7SWYTptEZXOoLG3h1tfyjBx6FJiKRKXhWH42z2AxWdvIjSanL5hkdhNoFB3LqHwZqzhFRJEKZLBbpQAk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB6806.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?S1eWsRsgZ0DnHy6npQy3SSEi/ZyLUltJ69cZE8NsmJXJA4k/LYZdw9f1YxOF?=
 =?us-ascii?Q?/sSOM7jbLY/1qWJTOTJrLFEXCYfcFcDAB5rjXEvMXoxkPvRQWzfhN9gzdxzt?=
 =?us-ascii?Q?Q1EYjBRDZe7uNy/1GcN5l2ftfcve/63RD9C3ixkITeoIlJihOiIQ+jw3Dvyv?=
 =?us-ascii?Q?WCe00rqRpZQR2lf98JW7pUY0L/rU9gNHZaeUEc0GZF4iHLyksLAV6M4Fdl87?=
 =?us-ascii?Q?0pnFiN4G5zyfTj74MNxIEP6dGsE/xn3bffzDSHtUF0ypKD3wUL6oF/tMYy4a?=
 =?us-ascii?Q?x2DvhUV1nbDqQYGxnFmlz3vglm3N9V49ru5N5PDlgZiZ9ojrgTiHIE8Ec3GM?=
 =?us-ascii?Q?OBarVs2XqShfnXEU1jNUXDqMmfYslQNRZ3uURQgkQjEqBeR6TME3lXx1vbdu?=
 =?us-ascii?Q?MtECHOxudbED4KdRayKLj2c3BE1TdOcRxH0skJHHyDJ7PewPbp66mn9iKBDI?=
 =?us-ascii?Q?QCoKS9JqiYXVE/rblA+Yc98xc1ArkF5/+gvvZHPQ8D7E2z311Q99xPqvvYTU?=
 =?us-ascii?Q?DpJHPRgaFOLfGamAUCzxyRnB69sN8ET/3Y7eiR/nce4cGXbuvR0nL+rSJK+W?=
 =?us-ascii?Q?v58tRmy08vbzUOP/jJeUaB4MDsCtJW0LrlqurLUCuhuh0pxx8YH+Bwr5t42C?=
 =?us-ascii?Q?O89Um5SzPMLKBLRKBP/lnFp9Wt98k3XRc21/k3yyvdl9MDn74Uwnosj5Eqkx?=
 =?us-ascii?Q?y54XhexRruAAx7PVHQRK4WdYsppR/fK/rZZsYYLpDAOBlqmj1WdKdHNobKAj?=
 =?us-ascii?Q?na23E1ebk0FFtu8YDB2mWq27k8ZWwNDNDIdESFcmgdieIMkwaTCEPGLeK/pP?=
 =?us-ascii?Q?JOLwYVEXnvMP8ZkLjPppLHo8jd6E+cJnQWfyiOvAiEuWsP2LodGlzse1LT2A?=
 =?us-ascii?Q?7rcoyiqqtdcCL6FpeLaWdqmB1gJwe0EH+1LPipt0jrSRuCoCQ0ymZ23nomJs?=
 =?us-ascii?Q?VACOPOirEvqwFyPOWhOywZ8IWBY8dHVpdY8+p1o9nLapPNSjyxhz2QxNpDQC?=
 =?us-ascii?Q?9g5ddTxPxa1g7k5hTImzrxINmsjy3XcZ0JcA3EPXAgmyUR4kyK17lUVxsM5o?=
 =?us-ascii?Q?onxmLdlc3tYAVDx+ri8jHFFhqDuyBBV7Ft0+CobxNPA6nvsNPBWG37xw5WU4?=
 =?us-ascii?Q?CmhQBXVX9hZzMQ0xqHrMeZ8lv7gUIjYRurgFzVayn8gfDQ7pOTNGImoKEE4R?=
 =?us-ascii?Q?Ny3bIbGEt1m2ECzxpOQ1/JVhOj48oT8fudUUZX537h2ogC9AaE/Cz25LqXq6?=
 =?us-ascii?Q?wjTMAo/RRUBbrF24xCyyVL5pxV4992ZNwdtF87Fx2kWpXNBvZhzarJCe4O4C?=
 =?us-ascii?Q?kkaA1FecjV9BBf75r116zr6XkIGthv/wkkb/urpNrMHsfs7OWGcmtMYUr20n?=
 =?us-ascii?Q?R8pRl3aSFgVtaIF2y65yvaClyHAP1LRAuEbU1LL9zOMmkf0Striqsb4Eddmx?=
 =?us-ascii?Q?vEoF8SQ+r0c/vfko3uespSrAi28fPoqGl5+FPSER8d+zZUCDA8L3idy4q0m0?=
 =?us-ascii?Q?ZN9B4TLiwzbBXG3Gd8/opNe3/Py0Oeju9aEbYYce914oQetxc0OkX/1pKgao?=
 =?us-ascii?Q?hNieyIn1/B/AdKCGCsfIN8yIwxW8WZv8Ns8UAL6SmoA277rI8WRainBj8kx9?=
 =?us-ascii?Q?OvKXUorO3Gyx0hgHbCcdgsZgpWu+ovrRBp4g6Nn++FW/rmdTRCukeCNvi5X5?=
 =?us-ascii?Q?Vzk34e+3A9NON9DrpiGDU/oaBcQ61QEgUCjP4O3OX06pcsPs?=
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
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6806.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9c5d51-a7fb-44d5-508d-08de747e97e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 15:00:19.6093
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U72BZK9uj7cQe154QvKGlgPUn9Poo1Bejtbus6LWw9aAaaecKnObH9PYjDPL//7NyeyqbfwUplGLRvAQ9C1mRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8891


> From: Bertrand Marquis <Bertrand.Marquis@arm.com>
> Sent: 25 February 2026 08:24 PM
>=20
> Hi,
>=20
> > On 25 Feb 2026, at 15:49, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, Feb 25, 2026 at 02:45:35PM +0000, Parav Pandit wrote:
> >>
> >>> From: Bertrand Marquis <Bertrand.Marquis@arm.com>
> >>> Sent: 25 February 2026 04:06 PM
> >>>
> >>> Hi Parav,
> >>>
> >>>> On 25 Feb 2026, at 11:24, Parav Pandit <parav@nvidia.com> wrote:
> >>>>
> >>>>>
> >>>>> From: Manivannan Sadhasivam <mani@kernel.org>
> >>>>> Sent: 25 February 2026 03:37 PM
> >>>>>
> >>>>> On Wed, Feb 25, 2026 at 08:03:48AM +0000, Bertrand Marquis wrote:
> >>>>>> Hi Manivannan,
> >>>>>>
> >>>>>>> On 25 Feb 2026, at 08:45, Manivannan Sadhasivam <mani@kernel.org>=
 wrote:
> >>>>>>>
> >>>>>>> Hi Bertrand,
> >>>>>>>
> >>>>>>> On Fri, Feb 20, 2026 at 09:02:12AM +0000, Bertrand Marquis wrote:
> >>>>>>>> Hi Parav,
> >>>>>>>>
> >>>>>>>>> On 20 Feb 2026, at 07:13, Parav Pandit <parav@nvidia.com> wrote=
:
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
> >>>>>>>>>> Sent: 20 February 2026 05:25 AM
> >>>>>>>>>>
> >>>>>>>>>> On Fri, Feb 13, 2026 at 01:52:06PM +0000, Parav Pandit wrote:
> >>>>>>>>>>> Hi Bill,
> >>>>>>>>>>>
> >>>>>>>>>>>> From: Bill Mills <bill.mills@linaro.org>
> >>>>>>>>>>>> Sent: 26 January 2026 10:02 PM
> >>>>>>>>>>>>
> >>>>>>>>>>>> This series adds the virtio-msg transport layer.
> >>>>>>>>>>>>
> >>>>>>>>>>>> The individuals and organizations involved in this effort ha=
ve had difficulty in
> >>>>>>>>>>>> using the existing virtio-transports in various situations a=
nd desire to add one
> >>>>>>>>>>>> more transport that performs its transport layer operations =
by sending and
> >>>>>>>>>>>> receiving messages.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Implementations of virtio-msg will normally be done in multi=
ple layers:
> >>>>>>>>>>>> * common / device level
> >>>>>>>>>>>> * bus level
> >>>>>>>>>>>>
> >>>>>>>>>>>> The common / device level defines the messages exchanged bet=
ween the driver
> >>>>>>>>>>>> and a device. This common part should lead to a common drive=
r holding most
> >>>>>>>>>>>> of the virtio specifics and can be shared by all virtio-msg =
bus implementations.
> >>>>>>>>>>>> The kernel implementation in [3] shows this separation. As w=
ith other transport
> >>>>>>>>>>>> layers, virtio-msg should not require modifications to exist=
ing virtio device
> >>>>>>>>>>>> implementations (virtio-net, virtio-blk etc). The common / d=
evice level is the
> >>>>>>>>>>>> main focus of this version of the patch series.
> >>>>>>>>>>>>
> >>>>>>>>>>>> The virtio-msg bus level implements the normal things a bus =
defines
> >>>>>>>>>>>> (enumeration, dma operations, etc) but also implements the m=
essage send and
> >>>>>>>>>>>> receive operations. A number of bus implementations are envi=
sioned,
> >>>>>>>>>>>> some of which will be reusable and general purpose. Other bu=
s implementations
> >>>>>>>>>>>> might be unique to a given situation, for example only used =
by a PCIe card
> >>>>>>>>>>>> and its driver.
> >>>>>>>>>>>>
> >>>>>>>>>>>> The standard bus messages are an effort to avoid different b=
us implementations
> >>>>>>>>>>>> doing the same thing in different ways for no good reason. H=
owever the
> >>>>>>>>>>>> different environments will require different things. Instea=
d of trying to
> >>>>>>>>>>>> anticipate all needs and provide something very abstract, we=
 think
> >>>>>>>>>>>> implementation specific messages will be needed at the bus l=
evel. Over time,
> >>>>>>>>>>>> if we see similar messages across multiple bus implementatio=
ns, we will move to
> >>>>>>>>>>>> standardize a bus level message for that.
> >>>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> I would review more, had first round of sparse review.
> >>>>>>>>>>> Please find few comments/questions below.
> >>>>>>>>>>
> >>>>>>>>>> I'd like to comment that I think it makes sense to have a basi=
c simple transport and
> >>>>>>>>>> then add performance features on top as appropriate.
> >>>>>>>>> Sounds good. Simple but complete is needed.
> >>>>>>>>
> >>>>>>>> Agree.
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>>> So one way to address some of these comments is to show how
> >>>>>>>>>> they can be addressed with a feature bit down the road.
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>>> 1. device number should be 32-bit in struct virtio_msg_header=
.
> >>>>>>>>>>>> From SIOV_R2 experiences, we learnt that some uses have use =
case for more than 64k devices.
> >>>>>>>>>>> Also mapping PCI BDF wont be enough in 16-bits considering do=
main field.
> >>>>>>>>>>>
> >>>>>>>>>>> 2. msg_size of 16-bits for 64KB-8 bytes is too less for data =
transfer.
> >>>>>>>>>>> For example, a TCP stream wants to send 64KB of data + payloa=
d, needs more than 64KB data.
> >>>>>>>>>>> Needs 32-bits.
> >>>>>>>>>>>
> >>>>>>>>>>> 3. BUS_MSG_EVENT_DEVICE to have symmetric name as ADDED and R=
EMOVED (instead of READY)
> >>>>>>>>>>> But more below.
> >>>>>>>>>>>
> >>>>>>>>>>> 4. I dont find the transport messages to read and write to th=
e driver memory supplied in VIRTIO_MSG_SET_VQUEUE addresses
> to
> >>>>> operate
> >>>>>>>>>> the virtqueues.
> >>>>>>>>>>> Dont we need VIRTIO_MEM_READ, VIRTIO_MEM_WRITE request and re=
sponse?
> >>>>>>>>>>
> >>>>>>>>>> surely this can be an optional transport feature bit.
> >>>>>>>>>>
> >>>>>>>>> How is this optional?
> >>>>>>>>
> >>>>>>>> As said in a previous mail, we have messages already for that.
> >>>>>>>> Please confirm if that answer your question.
> >>>>>>>>
> >>>>>>>>> How can one implement a transport without defining the basic da=
ta transfer semantics?
> >>>>>>>>
> >>>>>>>> We did a lot of experiments and we are feature equivalent to PCI=
, MMIO or Channel I/O.
> >>>>>>>> If anything is missing, we are more than happy to discuss it and=
 solve the issue.
> >>>>>>>>
> >>>>>>>
> >>>>>>> I'd love to have this transport over PCI because it addresses the=
 shortcomings
> >>>>>>> of the existing PCI transport which just assumes that every confi=
g space access\
> >>>>>>> is trap and emulate.
> >>>>>>
> >>>>>> Agree and AMD did exactly that in their demonstrator.
> >>>>>> I will give you answers here as i know them but Edgar will probabl=
y give you more
> >>>>>> details (and probably fix my mistakes).
> >>>>>>
> >>>>>>>
> >>>>>>> But that being said, I somewhat agree with Parav that we should d=
efine the bus
> >>>>>>> implementations in the spec to avoid fixing the ABI in the implem=
entations. For
> >>>>>>> instance, if we try to use this transport over PCI, we've got que=
stions like:
> >>>>>>>
> >>>>>>> 1. How the device should be bind to the virtio-msg-pci bus driver=
 and not with
> >>>>>>> the existing virtio-pci driver? Should it use a new Vendor ID or =
Sub-IDs?
> >>>>>>
> >>>>>> One bus is appearing as one pci device with its own Vendor ID,
> >>>>>>
> >>>>>
> >>>>> What should be the 'own Vendor ID' here?
> >>>>>
> >>>>> The existing virtio-pci driver binds to all devices with the Vendor=
 ID of
> >>>>> PCI_VENDOR_ID_REDHAT_QUMRANET. So are you expecting the Vendors to =
use their own
> >>>>> VID for exposing the Virtio devices? That would mean, the drivers o=
n the host
> >>>>> need update as well, which will not scale.
> >>>>>
> >>>>> It would be good if the existing virtio-pci devices can use this ne=
w transport
> >>>>> with only device side modifications.
> >>>>>
> >>>>>>>
> >>>>>>> 2. How the Virtio messages should be transferred? Is it through e=
ndpoint config
> >>>>>>> space or through some other means?
> >>>>>>
> >>>>>> The virtio messages are transfered using FIFOs stored in the BAR o=
f the PCI
> >>>>>> device (ending up being memory shared between both sides)
> >>>>>>
> >>>>>
> >>>>> What should be the BAR number and size?
> >>>>>
> >>>>>>>
> >>>>>>> 3. How the notification be delivered from the device to the host?=
 Through
> >>>>>>> INT-X/MSI/MSI-X or even polling?
> >>>>>>
> >>>>>> Notifications are delivered through MSI.
> >>>>>>
> >>>>>
> >>>>> So no INT-X or MSI-X? Why so?
> >>>>>
> >>>>> Anyhow, my objective is not to get answers for my above questions h=
ere in this
> >>>>> thread, but to state the reality that it would be hard for us to ma=
ke use of
> >>>>> this new transport without defining the bus implementation.
> >>>>>
> >>>> +1 to most of the points that Manivannan explained.
> >>>>
> >>>> The whole new definition of message layer for the PCI does not make =
any sense at all where expectation for the device is to build yet
> >>> another interface for _Everything_ that already exists.
> >>>> and device is still have to implement all the existing things becaus=
e the device does not know which driver will operate.
> >>>>
> >>>> And that too some register based inefficient interface.
> >>>> Just to reset the device one needs to fully setup the new message in=
terface but device still have to be working.
> >>>> That defeats the whole purpose of reset_1 and reset_2 in the device.
> >>>>
> >>>> This does not bring anything better for the PCI devices at all.
> >>>>
> >>>> A transport binding should be defined for the bus binding.
> >>>> A bus that chooses a msg interface should be listed that way and bus=
 choose inline messages can continue the way they are.
> >>>>
> >>>> If we are creating something brand-new, for PCI the only thing neede=
d is:
> >>>> 1. Reset the device
> >>>> 2. Create an admin virtqueue
> >>>> 3. Transport everything needed through this virtqueue including feat=
ures, configs, control.
> >>>>
> >>>> And this will work for any other bus or msg based too given only con=
tract needed is to creating the aq.
> >>>
> >>> I think you misunderstood a bit the point of virtio-msg bus over PCI =
so let me try to explain.
> >>>
> >>> You see one PCI device (regular, not virtio) which is a "virtio-msg b=
us over PCI".
> >>>
> >>> When the virtio-msg bus over PCI it will communicate through this dev=
ice with an external
> >>> system connected through the PCI bus.
> >>> The driver will enumerate virtio devices available behind this bus an=
d register them so that
> >>> the corresponding virtio drivers are probed for them.
> >>> All virtio-msg messages required to communicate with those devices wi=
ll be transferred through
> >>> a FIFO stored in the BAR of the pci device and standard PCI DMA will =
be used to share the
> >>> virtqueues with all the devices on the bus.
> >>>
> >>> So the PCI device is not one virtio device but one bus behind which t=
here can be many devices.
> >>>
> >>> Is this making the concept a bit clearer ?
> >>>
> >> Yes. This makes a lot of sense now.
> >>
> >> This is a virtio-msg-transport device that needs its own device id in =
the table.
> >> And its binding to the PCI transport.
> >
> > ok. how about an rfc of that idea on the list?
>=20
>=20
> I will let Edgar answer on this.
>=20
Sure.
Also please explain how is this different than SR-IOV devices?
On a PCI device there are some child devices exposed using some virtio-msg =
bus transport.
And all of them are going to share same PCI BDF.
These individual devices cannot be mapped to different VMs (secure or regul=
ar) in a performant way either.
So what would this virtio-msg-transport device achieve?

If there was no PCI bus when implementing the virtio-msg transport, it woul=
d make sense to avoid trap-emulate story.
But underlying transport being PCI, its back to square one for the original=
ly described motivation.

> Cheers
> Bertrand
>=20
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose the c=
ontents to any other person, use it for any purpose, or store or copy
> the information in any medium. Thank you.
