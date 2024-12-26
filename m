Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2DF2914
	for <virtio-comment@lists.linux.dev>; Thu, 26 Dec 2024 05:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735189322; cv=fail; b=r/I4jqF6x2Sv1Vag2MMd+J1gAT8ZonwJuLiXs3snWJ+NjNpXFEnccleJjKrtfvNDwiJgTiLZK/dwoxCudSdxencfeLF3UdZ+/9hB75yczvvwjwKxGkAiMYY6iziob6usnjkX3oFQLMeo4do1zab6GcmhkJ/zReIC6XVOQrq0R3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735189322; c=relaxed/simple;
	bh=NccBPR94db1AMxlD1dH+gDL/NR1iC8fqFQjmEQB0fMk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=T9K8mrF4rD4OveXhbwRl/0RiUE9CF2e5Alh+4gBIJS6cfT2knHKW61mDPfZ1gBurOPpgsRVp2jCkVU2YuYLCG/EWUCtDIhBIkMuuVVp5Arfz557nyc/Wl5+9HyEJnXkFPYlQOi4+ly17TILY1mDXc0IQCq+SDcq44zDW/d6jtwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uUE8RTbM; arc=fail smtp.client-ip=40.107.237.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uUE8RTbM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lk4OHOLJOCkeqbpZdt1XqfEQgbiI1/Fjoh4eCOcbDPbiBv/0ea7GGMsrApSz/f3Q8xv56H9xrU4/844K0y+85is5TeSWJYw5hghia60mn1HSMa8jOI72SzNBO2Jx/jrozmLEHH/IhcQi0XLuVXOYYRlVw+bUAO9rDujX1Rk6j6th4kjsZvvo6kLqlIpZ92j84mm1/OzC52iw+ttpMJsfOalgHaKWVHd+lugdlKhfuNwls03GPac3kh91IRTegIpDsQogPbw9z45btbiROgXTWQ5Y0cc0cUHSPjnLyTUHQdbcJl/ncr61CsEwyfN9JvE3rbWEM8ftXjl58NeGZGgBhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFpzL9UHnUaNJvkkBhfrrs6/Njn5hvW/BHj2yH1FWZE=;
 b=J1xam4BPXiet2vXvaX797oZ0HpzsgCs5Uh/hOAChr6qMlv+LIXHM88kabodR6dutW5Ks/u1/xpMddG09z/H+6Yp7fFzY8o1+T5JrKKANuFxuT6bj/hGQAlhSDc8m9ptBIc7QUIq+Uu4UC8yQvpZeJLMYSfEh9vWKLmsJiHahF/ayeh2J3OIbp3V8IhZhpUDoYYarWDWbDYtCb3zJqc1/NNCOcCcwqcEqY6E4YoLnJuL7kZRiMDiv7Dpr4VVz+BsDBTpVbvWAlbPenJWyl01mDkPqLMtLe3NzFin+smws/fjGqv9RMWjvWZcqM/xu2lryc6USnPwz2FpHzd3QvE0AmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFpzL9UHnUaNJvkkBhfrrs6/Njn5hvW/BHj2yH1FWZE=;
 b=uUE8RTbM6i2GgrKM0JnsIHXN2vuT50QA3KvhmxbLgFdRvVkpIeeyVsf5c9AIAIxu/pV7DP8zo/PHfV3pzIKYCVBIYbwkA52Dt6fOcYF44/7OThE4xwYjmIXDnE0HBfD/3THfPq4j5vY6sQxohH7h+eGiRQa7dW6rzQvz7UzaHNNCXvUkM9rNZGpVkBHD00TbTTaosYUoYrALItM9vPRhSLnDsTjcAc47r/mLMWT6eU8gUA3cYKORtzTjb9UgGLVUsJ9ymQscj0r3e4unYQ5dgEa/CaAW2FYrT4qTIXBeZVwhgJ38JNfry9qzCw/eDHia/lrMn2dFhLyAKVHqDAa32Q==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DS0PR12MB6533.namprd12.prod.outlook.com (2603:10b6:8:c2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Thu, 26 Dec
 2024 05:01:53 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%7]) with mapi id 15.20.8272.013; Thu, 26 Dec 2024
 05:01:52 +0000
From: Parav Pandit <parav@nvidia.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	"devel@daynix.com" <devel@daynix.com>
Subject: RE: [PATCH] virtio-net: Change num_buffers value
Thread-Topic: [PATCH] virtio-net: Change num_buffers value
Thread-Index:
 AQHbVpVXJB3eBmv4ZEexViKG9GakbbL2frMAgAABQgCAAVHo8IAAFAuAgAACvPCAAANVAIAAAUMAgAAERICAAAENwIAAA8AAgAABxPA=
Date: Thu, 26 Dec 2024 05:01:52 +0000
Message-ID:
 <CY8PR12MB7195E5A1D321CABBA97D3FD7DC0D2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20241225-buffers-v1-1-712e839e8ad1@daynix.com>
 <CY8PR12MB7195705CAFA8759355685905DC0C2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <24facd94-87b2-45d1-97ca-851595e8cf41@daynix.com>
 <CY8PR12MB7195C2A20025389351D15B8DDC0D2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <dcb6ad57-5d36-40f8-b161-7570dacdea4a@daynix.com>
 <CY8PR12MB7195C321CF982819C5393358DC0D2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <11feddcd-464a-4697-8462-32c165a7df49@daynix.com>
 <CY8PR12MB7195520E85F38BB409949868DC0D2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <b037a580-0428-405a-ab2a-f02025fb8132@daynix.com>
 <CY8PR12MB7195D574A42D05E798E50D1CDC0D2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <c2de0712-b8e4-4799-910a-20f2dd16efe3@daynix.com>
In-Reply-To: <c2de0712-b8e4-4799-910a-20f2dd16efe3@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DS0PR12MB6533:EE_
x-ms-office365-filtering-correlation-id: 28ee9b8a-5e7b-460f-3dc5-08dd256a69d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?SFzObMYcxOIQCxGfWUxW4qw/8+DAFZVSWiIRb5GfIEIa/e4feAHNxxdxU6V+?=
 =?us-ascii?Q?9NGi6RokIfugv65j/kSH3Y2sGz1fC+5hvYeGAOZ3Pvv2wQE9Oh8n7pIVX7mQ?=
 =?us-ascii?Q?wIxetNDubHSwABG2IM1j9nQCB2nf0xRgSVO6PBC3wCWTTf/yQMQCLqrM4a0d?=
 =?us-ascii?Q?XuFaw9o3jcqIc2QfOkaUOjOO9uKV//dTcwDtjwVo2oqPM+Nf9gJ8iEHVrbCR?=
 =?us-ascii?Q?odsy49xN9wpjK1MA9LL0VwgXj+y21c5cngjxZQ7akwg3UgNja1z+I5xPYgkf?=
 =?us-ascii?Q?q9ZC8O8Z2DZK38yupgVN/FTL/Wl/diltlVN38nmLcph7Lo/r9tk3i3oPRcgl?=
 =?us-ascii?Q?1o8q6tyixGO2Jw9MLH9nTPTpdQGU6UTtFFLMjcqxAYHQ7XJqf6RH5g7WfqNd?=
 =?us-ascii?Q?ZEPmmUBicgIIFeg41Lyyf6wQG5eeJCGahsOppDGRrumHVgrOdz3df8ObEVw7?=
 =?us-ascii?Q?O2QqLDzJ9b9Oddu8XO5pZue9XXoTzR1lheCMKJoAin/Ar0l2KgYvWJVrMGhc?=
 =?us-ascii?Q?9v2ZMQagJiv8ClJL038mRF0FTKulB+T7tCgrCc40JdPYdASakcK6z+7vlyna?=
 =?us-ascii?Q?i+KXmFGKU6dhDPpZPmz3HrSAXBCMA639COimCEqbcZCnv6MuZaJl2RJDwlcn?=
 =?us-ascii?Q?LQSaRYZWLgaKKBQXDV2tdDd/ov4/cmC9AidtaGPGMp3j4BtFmYOj+MAF+xyt?=
 =?us-ascii?Q?vxb+KzmYUJP75qk8x6PWJMpuRzsroime+aFJTI9J8AQgN34ynU9WEpYJl+LA?=
 =?us-ascii?Q?28nfXNp+PEMMTsi6ATNCDprxYy6c54Z+5nnOJ9yaxqLF+oA7AW5Zb2Wsy4cU?=
 =?us-ascii?Q?DbE20GXGm8eui0blwRc5N+zY5jvOxfwhXdcOF4/YVLybJgVCOis0SosSTX4F?=
 =?us-ascii?Q?4yDx/YmzFMUt6jrMZetLITWUO+E42s+QLCFz14V1gcWcS0wnflhZjbSB+LRn?=
 =?us-ascii?Q?kNeVsvCcBFXjWSkVTw+8WIhRf9B5m/vSwGt+t6ytUX02VrNanqOt9/6pn4HV?=
 =?us-ascii?Q?qHzXKNApiaNzeYFWDupnBP2L/D3A3h0jmq2lokCwbd/KhQkFx2RNTJTskjVf?=
 =?us-ascii?Q?EpN3UaRUSZPD6Z5KOFAC6Rg2lBmoEW+ryZhOX0DlaSeMTIKsjqKnpcZaXJqM?=
 =?us-ascii?Q?6lPEn40k2I1aqilOnojf60KidZnSARWb+w5sVv4I2UddPfY1qEq9sy+M4Yda?=
 =?us-ascii?Q?rTQl8KizhpxXbtx2PMRs5eT5ylqEAdJstW81vCV1VAaZi6ZmXFGH6K/PZdLZ?=
 =?us-ascii?Q?Be74bbnWTCV01q3i5X55KirnOihKm0aI/UWbByEZpGqneaTj2YlqGWSaUGol?=
 =?us-ascii?Q?c11cScCrQWZP2DhwquEmt9otKGf66z+sgegZ8SCIEbVCJl+el+LxUS/lQwRd?=
 =?us-ascii?Q?clIX1aZOk6PFOpIy/Y0uAdnB+kCzgfDpP6uAOButdajWy0xrAKzNFryLfNxV?=
 =?us-ascii?Q?HLICdd+7miFIcxhfEZ5nBpqoh3mIujhY?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?tmxMlMOL48RkqU8ZjsanXy58LnGGaig/s1a/YNltJYnBncMy15kQyeyEN/PD?=
 =?us-ascii?Q?SAgpK2NDDUJak2Yu0agHZc2i4ApYubt5qYZd8SzjsewWUTe7MktEfIeL8JyZ?=
 =?us-ascii?Q?S0mATq44cSMV8tb6+XyF/hNytQNiz/mFEPzs015/mECq+E7nCFiQhiMIJMzG?=
 =?us-ascii?Q?XpchXKENnQJIw0fMA0xMQoW+ovz6B51PRS7UVJHhb/goYjoRwNn71YigTrk+?=
 =?us-ascii?Q?T9v3rW2c2WB/Um7tGNb7hcvIMtWv8VvvowVhBBC42zE32zcXhOpxTmIeBMJb?=
 =?us-ascii?Q?CbMyma7+9Lxek7etRFSwDg+ILuepy0lsBkf+4BiOXnfXNu6vZJ4pQH9NePUw?=
 =?us-ascii?Q?E6o3OAiwB1ChbPaA3fvi5+iPULIBKO8LcSzC+tO3GNbu1OFe0jsQlHOL+PpH?=
 =?us-ascii?Q?SVo96pHbFtS/MOlfpMHikoWDyQlEecwXiQzDI2v/F9xpJmzYGo00OCTjw4kO?=
 =?us-ascii?Q?d075FRPA9yDxxWOBdsyqsv+dVnuQ1XRw94B5XYnUMQltMEtP8KsKpLposSjc?=
 =?us-ascii?Q?yR3cK1y3tzbBO++14rAvngFaru1lo1MlqPMxj3ASZOtuhFkLejbCcjZAul4/?=
 =?us-ascii?Q?p5/5L88BSO6TpUtnqJyRdLVZ+iOl2C7IQMnZPECnE655gPrcLzZwnZT4lE0l?=
 =?us-ascii?Q?wmmaW7WZ/QF3jnCd5KTZbwksNQ+SEsbDzAsh+uOw6bTJ9zGdLPu1eYHGNFQP?=
 =?us-ascii?Q?wyqQrkEqAJBb4xUnADK/gGxLlq0W+96mQbqH/LcisXi8kZluBvrVI1vLl2Jk?=
 =?us-ascii?Q?W4k1Yk2YrMnr4BlakhxiuJdLi55Q1P/gFxFbxUH3zDnXlzgCeDvkCad4kccO?=
 =?us-ascii?Q?X7WeljU94D+Z8Q/urwfd2oCcYUgcngIT3OOWm8aE/fOktEFjy3fXfEvfKBxy?=
 =?us-ascii?Q?o+wb4Av8xEnYiNX6CB35fZXdh67hg5aY6ECHv7jr6rzk9fHh/GG8LKQWuki2?=
 =?us-ascii?Q?9llENZYASaK5tJFNa4pip8oK0/X4sM1L7tkG8l1XblOR35EIkEXZx0YbdMGs?=
 =?us-ascii?Q?Jg1gA3yZRv5mk/QYp0stx48jl4x9syVRDryUMSnD8fqlyYtWtzVdDobN4ydl?=
 =?us-ascii?Q?Z2Bc4kXVS1G+YIx2cqZbM63tpfrAYewlpesaJWesSb+FGB0Z3a7HrPaIWnp6?=
 =?us-ascii?Q?n5BoVpdB4UppIB09v41roGa+JrENZIVH8w4gt6gDKhYeYUvNOWFCg47kTSMW?=
 =?us-ascii?Q?rVF5xokZv15vw68JkcH49d5SMTtLWUirAQoi6vmrZZQdvguQ3Vako0OATeDc?=
 =?us-ascii?Q?bbZbOpW0l/KWGflTEiva+tVghR0tx1n/aM71R/PaA7k7eHxB6/olrxVf5lHr?=
 =?us-ascii?Q?f5X+zrkzsuucudfv9rO0qd3wNzN51p/Mcz/lFww4KYV/8Q0pi6r7XZe/mU/C?=
 =?us-ascii?Q?x3sYm/cQo0S3OnX2ae2PDkB5lgswvETFHQVn0wbfdKVH3bExgvcYj2apdeBT?=
 =?us-ascii?Q?HA/WnXxLkVPw+dWebDkR21E/AJ1W2OUP728bD+4j5NNVskIFC5sBw+l4jJiO?=
 =?us-ascii?Q?b4q7LyC157Rc64g4YIBppUNP0Yr01WxdubItP2R8pbL3DsB/KJLZrCX7c8yw?=
 =?us-ascii?Q?KaLnpoBGR5Z2r/B1uvWPs4uJQ8t/XFHz/XBLdQ5Z?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ee9b8a-5e7b-460f-3dc5-08dd256a69d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2024 05:01:52.8199
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FsHu7IuRE1HzsikPmV5StpuDNmJEuGi/p6ePTJW9h8Todhjl/2Vz2mNekU0AaKBYgXuJplCcg9Vad3qm8vHD6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6533



> From: Akihiko Odaki <akihiko.odaki@daynix.com>
> Sent: Thursday, December 26, 2024 10:21 AM
>=20
> On 2024/12/26 13:41, Parav Pandit wrote:
> >
> >
> >> From: Akihiko Odaki <akihiko.odaki@daynix.com>
> >> Sent: Thursday, December 26, 2024 10:04 AM
> >>
> >> On 2024/12/26 13:24, Parav Pandit wrote:
> >>>
> >>>
> >>>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
> >>>> Sent: Thursday, December 26, 2024 9:44 AM
> >>>>
> >>>> On 2024/12/26 13:08, Parav Pandit wrote:
> >>>>>
> >>>>>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
> >>>>>> Sent: Thursday, December 26, 2024 9:22 AM
> >>>>>> To: Parav Pandit <parav@nvidia.com>;
> >>>>>> virtio-comment@lists.linux.dev
> >>>>>> Cc: Michael S. Tsirkin <mst@redhat.com>; Jason Wang
> >>>>>> <jasowang@redhat.com>; devel@daynix.com
> >>>>>> Subject: Re: [PATCH] virtio-net: Change num_buffers value
> >>>>>>
> >>>>>> On 2024/12/26 11:50, Parav Pandit wrote:
> >>>>>>>
> >>>>>>>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
> >>>>>>>> Sent: Wednesday, December 25, 2024 12:01 PM
> >>>>>>>>
> >>>>>>>> On 2024/12/25 15:28, Parav Pandit wrote:
> >>>>>>>>>
> >>>>>>>>>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
> >>>>>>>>>> Sent: Wednesday, December 25, 2024 11:52 AM
> >>>>>>>>>>
> >>>>>>>>>> Linux's vhost_net and QEMU sets num_buffers to zero when
> >>>>>>>>>> VIRTIO_NET_F_MRG_RXBUF is not negotiated. Change the
> >>>>>>>>>> specification to reflect this reality.
> >>>>>>>>>>
> >>>>>>>>> Please fix the vhost_net and QEMU to reflect the specification
> >>>>>>>>> which clearly
> >>>>>>>> writes num_buffers must be set to 1.
> >>>>>>>>> (the last hunk of this patch).
> >>>>>>>>> One cannot suddenly change what was written in the device spec
> >>>>>>>>> as
> >>>>>> 'must'
> >>>>>>>> requirement.
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> This proposal is based on the discussion happened during the
> >>>>>>>> vhost_net
> >>>>>>>> development:
> >>>>>>>>
> >>>>>>
> >>>>
> >>
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor
> >>
> %2F&data=3D05%7C02%7Cparav%40nvidia.com%7Cdd28591d651040288d7608
> dd2568e
> >>
> 0fb%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C6387078546048
> 86818%7
> >>
> CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMD
> AwMCIsIl
> >>
> AiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdat
> a=3DCFg
> >> G1qCgHcdUNLnin4HLF%2FCDRTR7v6qUiebk4tFBlAQ%3D&reserved=3D0
> >>>>
> >>
> %2F&data=3D05%7C02%7Cparav%40nvidia.com%7C18c17324464546a9778c08
> >> dd25667
> >>>>
> >>
> a9d%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C638707844275
> >> 828212%7
> >>>>
> >>
> CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMD
> >> AwMCIsIl
> >>>>
> >>
> AiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdat
> >> a=3DL0J
> >>>>
> MY5SxX4C2q5UphZ%2BVLe07Cdmik9WJG7dWdvcLdb4%3D&reserved=3D0
> >>>>>>
> >>>>
> >>
> %2F&data=3D05%7C02%7Cparav%40nvidia.com%7C649e957573c04ca299a808
> >>>> dd2563b
> >>>>>>
> >>>>
> >>
> 763%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C638707832422
> >>>> 610980%7
> >>>>>>
> >>>>
> >>
> CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMD
> >>>> AwMCIsIl
> >>>>>>
> >>>>
> >>
> AiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdat
> >>>> a=3Dbab
> >>>>>>
> >>>>
> >>
> vvZhhh8eCZAsF%2BMv4W0LjkD5KMTZn6OA4%2FzIMOAE%3D&reserved=3D0
> >>>>>>>>
> >>>>>>
> >>>>
> >>
> e.kernel.org%2Fall%2FCACGkMEt0spn59oLyoCwcJDdLeYUEibePF7gppxdVX1Y
> >>>>>> vmAr
> >>>>>>>>
> >>>>>>
> >>>>
> >>
> 72Q%40mail.gmail.com%2F&data=3D05%7C02%7Cparav%40nvidia.com%7C227
> >>>>>> ecfe28
> >>>>>>>>
> >>>>>>
> >>>>
> >>
> 0c04c7fbe0708dd2560ae73%7C43083d15727340c1b7db39efd9ccc17a%7C0%
> >>>>>> 7C0%7C
> >>>>>>>>
> >>>>>>
> >>>>
> >>
> 638707819369398017%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiO
> >>>>>> nRydWUsIl
> >>>>>>>>
> >>>>>>
> >>>>
> >>
> YiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D
> >>>>>> %7C
> >>>>>>>>
> >>>>>>
> >>>>
> >>
> 0%7C%7C%7C&sdata=3DJcJuXC0tHF%2BQwCjrpwDTnEWRrITD0hXwB3cTkwmZ
> >>>>>> qOk%3D&res
> >>>>>>>> erved=3D0
> >>>>>>>>
> >>>>>>>> The reasoning here is that vhost_net and QEMU set num_buffers
> >>>>>>>> to zero for years so changing it is more risky.
> >>>>>>> Less risky for the device or the driver?
> >>>>>>
> >>>>>> For the driver.
> >>>>>>
> >>>>>
> >>>>>>> Your response implies for the device, but do not understand how
> >>>>>>> it is less
> >>>>>> risky for the consumer of the field (driver).
> >>>>>>
> >>>>>> If there is a driver that reads the field, such a driver is
> >>>>>> likely to expect zero because the two most popular
> >>>>>> implementations sets the field
> >>>> to zero.
> >>>>>>
> >>>>> Why would driver expect zero there when spec said 1?
> >>>>> It can only work if the driver ignored the field.
> >>>>>
> >>>>>>> If the field was never read by all the drivers, it is better to
> >>>>>>> modify the spec
> >>>>>> to say following in the requirements section:
> >>>>>>> 1. device MAY set any value, or MAY NOT event set it.
> >>>>>>> 2. device SHOULD NOT set num_buffers.
> >>>>>>> 3. driver MUST ignore num_buffers when
> VIRTIO_NET_F_MRG_RXBUF
> >> is
> >>>>>> not negotiated.
> >>>>>>>
> >>>>>>> For the real PCI devices, this actually can save the sparse DMA
> >>>>>>> occurring on
> >>>>>> rx packet.
> >>>>>>> (telling 0 forces the device to do the DMA for the field that
> >>>>>>> driver
> >>>> ignores).
> >>>>>>>
> >>>>>>> Also please change the motivation in the commit log to indicates
> >>>>>>> that dpdk
> >>>>>> pmd, freebsd, windows, Linux, QNX drivers has never read/honored
> >>>>>> the field num_buffers when VIRTIO_NET_F_MRG_RXBUF is not
> >> negotiated.
> >>>>>>> Hence, make it optional for the device to set it.
> >>>>>>>
> >>>>>>> Please work with those open and closed source driver's
> >>>>>>> maintainers to get
> >>>>>> their ACK on non_usage by the driver.
> >>>>>>>
> >>>>>>> This change will help to save the PCI DMA.
> >>>>>>
> >>>>>> I don't think it will save the DMA because it is at middle of buff=
er.
> >>>>>>
> >>>>> Its part of the vnet hdr writing process. So its slightly lighter
> >>>>> to not write in
> >>>> simple cases.
> >>>>> How a device does DMA is upto the device on splitting the buffer.
> >>>>>
> >>>>> And if it does not save DMA, I don't see the motivation.
> >>>>> The driver is working with num_buffers=3D1 and num_buffers=3D0.
> >>>>> So what are we trying to save?
> >>>>> Aligning the spec to some behavior to one device implementation
> >>>>> makes
> >>>> other device implementations non compliant to the spec anyway.
> >>>>> So the risk part is not clear to me.
> >>>>
> >>>>
> >>>> I'm comparing the possibility that there is a driver that breaks
> >>>> with
> >>>> num_buffers=3D1 or one that breaks with num_buffers=3D0.
> >>>>
> >>>> When comparing these, it is more likely that there is a driver that
> >>>> breaks with num_buffers=3D1.
> >>> Why?
> >>> And if so, such driver should be fixed which didn't follow the spec
> >>> for 10+
> >> years?
> >>>
> >>> What will you do if an automotive product driver has stringent check
> >>> to fail
> >> the pkt if num_buffers !=3D 1?
> >>
> >> Such a driver needs to be changed to ignore num_buffers if
> >> VIRTIO_NET_F_MRG_RXBUF is not negotiated.
> >>
> > But what if that driver is following spec version 1.2?
> >
> >> We can't make the device compatible with drivers that expects
> >> num_buffers=3D0
> > Can you please share an example of such driver?
If there is no concrete example of the driver to fix, we have a weak claim =
to fix this behavior to 0.

> >
> >> and ones that expects num_buffers=3D1 at the same time so we must
> >> determine either of them that is less risky.
> >>
> >>> Please get the ack of all.
> >>   > >> Most drivers should have been tested with vhost_net or
> >>>> QEMU
> >>> Please get the ack from the maintainers that driver has ignored the f=
ield.
> >>> At that point this field to be marked as don't_care/ignored field
> >>> instead of
> >> forcing 0 or 1.
> >>>
> >>>> so they should work with num_buffers=3D0, but they may not be tested
> >>>> and break with num_buffers=3D1.
> >>> This is hypothetical. Please get the enough data.
> >>
> >> We can't survey all the drivers that may exist in the world so we
> >> need to make the safest hypothesis.
> >>
> > In that case, let the spec be as_is. Let driver fix itself it was broke=
n.
> > Change like this surely need survey from all the known drivers.
> >
> >>> We have PCI devices that do num_buffers=3D1 and tested with Linux,
> >>> dpdk
> >> pmd, Windows drivers without issues on num_buffers.
> >>
> >> We are determining the safest option for drivers, which consume the
> >> value, not for devices. PCI devices with num_buffers=3D1 may be tested
> >> with the listed drivers, but may not be with others.
> >>
> > Then those drivers should be fixed.
>=20
> It implies breaking drivers that works with vhost_net and QEMU, which is =
not
> the safest option.
>=20
> > For risk analysis, please get the maintainers ack and then making
> num_buffers as reserved field will be more natural that will match the
> drivers.
>=20
> I agree num_buffers must be reserved. More concretely, drivers must ignor=
e
> this field; otherwise they will break with either of vhost_net/QEMU, whic=
h
> sets num_buffers=3D0, or devices compliant with the current specification=
,
> which sets num_buffers=3D1.
>
Right.
=20
> The question is what value devices should set this field to.=20
Device should not set it. It should be reserved field.
Setting it to 0 will break X drivers.
Setting it to 1 will break Y drivers.
None of us know the count of X and Y.
To me presently it appears X =3D Y =3D 0 because devices with both values e=
xists.
Once you get more concrete data and ack from the driver maintainers, than m=
aking it reserved will be good.
