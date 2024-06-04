Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708421C294
	for <virtio-comment@lists.linux.dev>; Tue,  4 Jun 2024 05:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.156.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717477637; cv=fail; b=Vx0rJjaiqBHlVCNnGYkZflnZ5r6Emq8hiB2Hhcn9bMQnmZWbbtHLzf0g2nneOUrUCi8R0EmjmQvtTsAiQ0JwjD4L88hIfn0LA0xhVLuEYcgXod9/teE0wypiBzBgU7lUjAIzP1k/2JrPI/N+mnejWCK26mCkTDNgqth5/DhR53s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717477637; c=relaxed/simple;
	bh=hEdFvarR9jIolxVX89Tg77Wl43Lk8i180PLtuehI5aY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bp6CpTkTmL0Mtj3LpV7qHuOjwUU14dR10//0cIjzL1VgrNmdIYBX2EubQqhDtriF7WWstKRtbtxs4MVxZTfoRJluTko6UM9d5bSq13Yligy790WUR8ELNx90BvL4/mgQmIJF0jnqBlc6W+fkOCawitv/hcVIOCpPWWG2gWuOqPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=H5rCvrYM; arc=fail smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="H5rCvrYM"
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4542xUIu007263;
	Mon, 3 Jun 2024 22:07:02 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3yg35hfvbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 22:07:02 -0700 (PDT)
Received: from m0045851.ppops.net (m0045851.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45453vYj015826;
	Mon, 3 Jun 2024 22:07:01 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3yg35hfvb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 22:07:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDuyZyvAclk/3zVKocxY/+Nl+fUCWTTk4ooX5dNA1dyAc6SrQhASOC6sZbPEkbX4UVl4b+hv7w6268L3jrnEC1qmiLfXibUp6ph7aZpRdnuBl91kOe+Mnjk1jqXIApKv+WfzHbltQUhDcbG6QrR1QvkCflh/9iZnK8zEt5Ev+oW73lL2Vj+mIxgHYCIeNj5lDDlxu119qNhFM6u8YFPJqdawMX6FubY84D9ZIgWuz9pxvI3JXLmSfjZq6s3Idqhwmm5Pw5aGXRo2AMVwJLvj0sY0bwQDESC/nDRzhclcM1AMb6NrWBnilhx7bpmL9SiyQimjLdKs5eATxUKHUxW8OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXbYIhO0Vb7KeEaVZysTSSpg9Xy1cZhvLrSn/HIwdig=;
 b=UAwv1K2qBOjjAlYG0iPgsjKbm7D+57wuxwFNUeBLsF/K8x+FWX7E8BZYpuFsW9cIceaZHWIuBj2LZ5L4QbKX+dCGqWVCK4wN4hofiMGR4z3cotE5M2jWxmSSzbiccgApyE5kAsT87sWcijQzST7ym0y6+sHEMzMMHlLoOAhfxaCukeSlxUMp4hT7jWvE11OoXS/h6NlzhEF1BQmk62OoRptpYOl0Yy4DKnGsikaUfv3bIczLkTAA6rVslJt7F48fFGeqqT78HUj5Ftr5844NCxG3eEADLsGvYOKZoGRUHE+UpsGIOFpHhXsDf5L1h95YBs7akNf5q+rhR91eGATdtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXbYIhO0Vb7KeEaVZysTSSpg9Xy1cZhvLrSn/HIwdig=;
 b=H5rCvrYMu0xWv+yiKjStK+MxW9XttDMI6KzkWeyOYWg/aokhQlISoVY31RfafEMxHMUgDA/jWvALI9M7XA/MMrQrEJD+v9L5ZWQu1m6838v1313+PRyu4D07jU9Xot+W1NtccSGcAa7EsKByFWHU0lvRSnwJfAHMvQ1MhKh7c5o=
Received: from SJ0PR18MB4477.namprd18.prod.outlook.com (2603:10b6:a03:304::23)
 by LV8PR18MB5939.namprd18.prod.outlook.com (2603:10b6:408:228::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.26; Tue, 4 Jun
 2024 05:06:59 +0000
Received: from SJ0PR18MB4477.namprd18.prod.outlook.com
 ([fe80::7c90:e416:9ec6:583b]) by SJ0PR18MB4477.namprd18.prod.outlook.com
 ([fe80::7c90:e416:9ec6:583b%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 05:06:59 +0000
From: Satananda Burla <sburla@marvell.com>
To: Parav Pandit <parav@nvidia.com>,
        "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>,
        "mst@redhat.com" <mst@redhat.com>,
        "cohuck@redhat.com" <cohuck@redhat.com>
CC: "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
        Shahaf Shuler
	<shahafs@nvidia.com>,
        "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
        "peter.hilber@opensynergy.com" <peter.hilber@opensynergy.com>,
        "jasowang@redhat.com" <jasowang@redhat.com>,
        "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>
Subject: RE: [EXTERNAL] [PATCH v10 11/13] virtio-net: Add flow filter device
 and driver requirements
Thread-Topic: [EXTERNAL] [PATCH v10 11/13] virtio-net: Add flow filter device
 and driver requirements
Thread-Index: AQHaq3q/OndytfEWhEyscJyYOyv1J7G2y52QgABS2ICAAAPKkA==
Date: Tue, 4 Jun 2024 05:06:58 +0000
Message-ID: 
 <SJ0PR18MB447755648B087A2113FE0C0AC3F82@SJ0PR18MB4477.namprd18.prod.outlook.com>
References: <20240521122937.2004180-1-parav@nvidia.com>
 <20240521122937.2004180-12-parav@nvidia.com>
 <SJ0PR18MB4477D6A644C2C0A7F7E14DF0C3F82@SJ0PR18MB4477.namprd18.prod.outlook.com>
 <PH0PR12MB5481D8FD1CC10D99E6102DACDCF82@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: 
 <PH0PR12MB5481D8FD1CC10D99E6102DACDCF82@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR18MB4477:EE_|LV8PR18MB5939:EE_
x-ms-office365-filtering-correlation-id: aa14673d-4ffc-4875-064c-08dc8454299a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|366007|376005|1800799015|7416005|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?jEFxCjxlnXAmBY4NEAnravPHnklgYLYiBL3PC7xkq3vb/EIgF574bY/tlhmz?=
 =?us-ascii?Q?ssMIn9WzJtBWe/Wgu7jI3yrMV7HckEzS3AQWZnR9ybv/4RKjF0dys1gwiApq?=
 =?us-ascii?Q?W9MxhEb5yhP9ngxQc3ptBAvpKerpKmzphNB+ndBw1rJIMkf7cA9rpZqot/nX?=
 =?us-ascii?Q?w/jqFSHbbNpmajl3xy09Z+pOR0b+b312RjVoHPSQJ8QYeIGAWWUgdswDrG3V?=
 =?us-ascii?Q?iIK/QDngW2RgmypmJv4BJ6DNdf7W6vFr1d0fL7QehfoaKTvvTRDjDzm59HHU?=
 =?us-ascii?Q?eQ7yubmZcqn9tsWaSuRyu6bJf2GONvS2X6VfgWe6Z4/f0tB9r/CHe/SogGUs?=
 =?us-ascii?Q?ocdmhUyLIoUAcIVK78qNyktUhavsluFSSQQyyLcOJ2MHcYorCGoWCTv9q8pt?=
 =?us-ascii?Q?vIFLozWzSbXQJMfdk1yDD/d/rDXA8gG6oeUQKsUwulzq6v9d0kAf6O2XGsYE?=
 =?us-ascii?Q?EVPH9a9hVYEXqsC78Vl84kjcOKxzmyBsWzYGctl2bBQBcqo+/66s3y9UtOBf?=
 =?us-ascii?Q?sTCbPGciX+qRfSiWrc91qv8+HqKk3yav2ApPkfmDlwhovtIerDMY+8sp+mwO?=
 =?us-ascii?Q?R0wmor13r20T1NiHGRpH2i2AB58IN9qwjYBknTsTnMGgCYSW8jUQKRxcl6q8?=
 =?us-ascii?Q?dH4OF47kNk2uiYUv4A2PX2MEgaaerqxWAPlhRMXeAmGEPG8EGgyRoJwq7x3m?=
 =?us-ascii?Q?l8OGGLwI4NwhW8iHy6aBX5NqK4uscP4kKfBRX5uFxSuQDnkoDbTW6g/S9Nsy?=
 =?us-ascii?Q?HpqBoUHUY/lVmsH5OY/5bC96XQbxLHWrmZGepRtHOCrdNSB1qjDm8RqgExSx?=
 =?us-ascii?Q?OQZOlaF4n84ysaN/7y+odSoOC3+jd6FVcub4SxeFTnr081VQVyqlCriB12bB?=
 =?us-ascii?Q?+2HcN2Xshx1nYueotRYjJ90+6AW/0Xk0H4/Hs/UGL9A2Id9TiFU6LTU+EWPO?=
 =?us-ascii?Q?b4Tv99mlrf3YtUHJQg8dDtiFzNqsVDqw1xVbiEYu9ZKpeGOfp3bWcQSYxNcd?=
 =?us-ascii?Q?WOuZEmPeilSvvZ+oAHbO3x0bjxQlSG7qxDDM5lccOqtyr/WIuIA+w2VWJEwG?=
 =?us-ascii?Q?JeS8oSA9xcTaz5KrnfsQH5sEXanKKgkRrl2SvFUgVqpOwry3uhALv6BNnV6u?=
 =?us-ascii?Q?rGojQ9lOOc7tCJGlJfh+xRiJ9Yjzauedv1n3JRTxWMP/Lw3LVrfb34o+n9+I?=
 =?us-ascii?Q?o54C21/94Y7qi5s4gV3tYZdpWVz/4xlZKY4aaD/Rq7EZp6Kt3A84ysSEQFRf?=
 =?us-ascii?Q?LxIqrvUR7W75Bhm3et8lZ+1fn5ora29E9jIbmF3VnqdbZY+DuK+V8ejr46VV?=
 =?us-ascii?Q?R8mmVUU7IMdtOg4SyG+w2VrP32ua85Y9K3+Xc2AGxtn7Dg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB4477.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(7416005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?uE1PdZNa+SOy1AtuPojiTbETixkhTyHac4it1lvw/Ly3zDQriqOSasEPqWfY?=
 =?us-ascii?Q?CqEW8H1BV8gnWwgqsAyWZcH9Om70izPDh0h1xtSAv5iTA2QHH0yq+M74AcqI?=
 =?us-ascii?Q?FwDg7bXS/UAZFOOfP8Axt/Y3Th+e09fJnTRlnDB0CuXg4dknh4ktyife0Oy0?=
 =?us-ascii?Q?wxUqGP7AdJvmcT6l8G8XnCu+rl8k63zvct0+lMz4LBkHVlsz4HmDeBGcDn96?=
 =?us-ascii?Q?2AEXufbyrw2k1boPslJEN8A8jPmdOvUsMLnZNVoLZ1CXVKDG24VkBR/++Z+j?=
 =?us-ascii?Q?zfRfY+UV6wP0MDOcEJhCYdSj4lOW6vvX9GK+vclVNYpdEHwBE4gtrtmKAlSA?=
 =?us-ascii?Q?j262yrD2kFeqcfWobGU3C25QrvNfcKNF2oFH50y7G+UM0e36KTSSt0QGIiMZ?=
 =?us-ascii?Q?bM/hBnw2BPfG8Yo8Z3PRdVoYDigI/TltWuDy+IgIpsf+YfRNH7DhFGBQ1D/W?=
 =?us-ascii?Q?l/PWOaa5K8zP6i7/8PYZIk7I0aovOmPAzW/ilAu6FwnRzcY5G6FmctaMNsay?=
 =?us-ascii?Q?xapUJPAvSX055d5XE/UKqL+5PJUsvD5JtGArasw5KSjOMWa3uptNMzPcQXxc?=
 =?us-ascii?Q?9MorRdjFFPT+W3oXasgTp6OAxDruQHEh295Fxf0x5ZJ++6W376PWffHtiK7T?=
 =?us-ascii?Q?iNziUodjsIlCQ7DAVdpV7qa3FoYD6hMfd2g1SJPWypUGeE9WMBNG9aijdOK+?=
 =?us-ascii?Q?+9zdwS3xEAD5+3rfgsm5bDFKecS3m5cKoqgeUy0qdIKIK5hGDtLzT7Xz0EXt?=
 =?us-ascii?Q?K/0hhWjYyWNKEukfPQeZ5dlLOul89dHdJL/sZU91XY1p6TFO5WBKPPeji/mW?=
 =?us-ascii?Q?VbNC++6nrFP7P3sd0l2PUGV/R6gGSOQMw6qN4CQtX6GaVLQxjwyDzRkD0XAd?=
 =?us-ascii?Q?T1Zrwqzm51D7L58o5djV2UYha1ouWdXPyC9C8ovqenc/s+7CoUeqPYx8ajan?=
 =?us-ascii?Q?HkDC5MZOzfplpBZX6/r5SB0XVNMn3hwelwF/Ow/MAcdLxsy0nIh8ifDcvXG0?=
 =?us-ascii?Q?O4zjYzV3+3Bni14GTD38HQlfBiUsqgCWWraJ9mJsG9lZRKsID5pBOnOhMQEO?=
 =?us-ascii?Q?rp0sj7Uqv16QGsHy/QRoR2oLzvDbk1QiRl52wOENDFGrDgCGW14K2pqjooWo?=
 =?us-ascii?Q?2m5vBrYHVyCsgGcwx20cgq4gcPiIrRqBArHKRmRd76W8RSDGikFsr/mpUcZV?=
 =?us-ascii?Q?xIgVp4mFwe9X5ducpJ4PbF7h3NrZ5G+XzBEDkztk32TGOCbrS9U6Eynjc4Ex?=
 =?us-ascii?Q?6WNGVwnEuQsSr8zSnVautt61072hPl75hDhyMasLZRB9gU9tS6mnXxyjvSxm?=
 =?us-ascii?Q?asjQrlrA+E9Ugq8eIp1AWDoWH9AjjzXtsF93eJ1Mxa6z904twdAObJmV/VEK?=
 =?us-ascii?Q?LBWc+jWSdmzlcOuHXQfL2SV6zxtr1owh9bKi74qJBK773M3ihUgHyPaRSCS4?=
 =?us-ascii?Q?AIaxsAup5MKGOA4zyjyiT2gggiAaJD0dc5fUJJTaGEXeq7FnBAGw4USnmZwt?=
 =?us-ascii?Q?df3y//jliBJ2zrcEpIBCHLGPa35g3P9/fxkfhR/ITA2kgs3rviZj/Sj0Ld04?=
 =?us-ascii?Q?BEEV7BANJZePGbKSvzmdfAs1/B8kOL1ST30qKuDw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR18MB4477.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa14673d-4ffc-4875-064c-08dc8454299a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 05:06:58.9754
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YW6BoCQfV/FzLQuF1Std+xItI2OQGsz/XYNCNti45c0yc9jFWMPfLGbDVXM24j/oicS8QKYNN22VZtuDqwdSXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR18MB5939
X-Proofpoint-GUID: mJxwxUt1L7G6AetpjIHQIB-bfrkhuDlZ
X-Proofpoint-ORIG-GUID: kMj2yAWrGTrjaVs1P6g30FE2MSqBDz_N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-04_02,2024-05-30_01,2024-05-17_01

> -----Original Message-----
> From: Parav Pandit <parav@nvidia.com>
> Sent: Monday, June 3, 2024 9:50 PM
> To: Satananda Burla <sburla@marvell.com>; virtio-
> comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com
> Cc: hengqi@linux.alibaba.com; Shahaf Shuler <shahafs@nvidia.com>; si-
> wei.liu@oracle.com; peter.hilber@opensynergy.com; jasowang@redhat.com;
> xuanzhuo@linux.alibaba.com
> Subject: RE: [EXTERNAL] [PATCH v10 11/13] virtio-net: Add flow filter
> device and driver requirements
>=20
>=20
> > From: Satananda Burla <sburla@marvell.com>
> > Sent: Tuesday, June 4, 2024 5:42 AM
> >
> > Hi Parav
> > > -----Original Message-----
> > > From: Parav Pandit <parav@nvidia.com>
> > > Sent: Tuesday, May 21, 2024 5:30 AM
> > > To: virtio-comment@lists.linux.dev; mst@redhat.com;
> > cohuck@redhat.com
> > > Cc: hengqi@linux.alibaba.com; Satananda Burla <sburla@marvell.com>;
> > > shahafs@nvidia.com; si-wei.liu@oracle.com;
> > > peter.hilber@opensynergy.com; jasowang@redhat.com;
> > > xuanzhuo@linux.alibaba.com; Parav Pandit <parav@nvidia.com>
> > > Subject: [EXTERNAL] [PATCH v10 11/13] virtio-net: Add flow filter
> > > device and driver requirements
> > >
> > .
> > .
> > .
> > > +The driver MUST enable VIRTIO_NET_FF_RESOURCE_CAP,
> > > VIRTIO_NET_FF_SELECTOR_CAP,
> > > +and VIRTIO_NET_FF_ACTION_CAP capabilities to use flow filter.
> > Does enabling here mean  reading device capabilities and setting
> driver
> > capabilities ? Or is there something else to be done ?
How about this ?
> > > +
> > > +The driver SHOULD NOT remove a flow filter group using the command
> > > +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY when one or more flow
> > filter
> > > rules
> > > +depend on that group. The driver SHOULD only destroy the group
> after
> > > +all the associated rules have been destroyed.
> > > +
> > > +The driver SHOULD NOT remove a flow filter classifier using the
> > > +command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY when one or
> > more flow
> > > +filter
> > > rules
> > > +depend on the classifier. The driver SHOULD only destroy the
> > > +classifier after all the associated rules have been destroyed.
> > > +
> > > +The driver SHOULD NOT add multiple flow filter rules with the same
> > > +\field{rule_priority} within a flow filter group, as these rules
> MAY
> > > match
> > > +the same packet. The driver SHOULD assign different
> > > \field{rule_priority}
> > > +values to different flow filter rules if multiple rules may match a
> > > single
> > > +packet.
> > Is the following needed ?
> > The driver SHOULD NOT add a flow filter rule whose action refers to
> non-
> > existent receive queue or a receive queue in reset.
> > Similarly should driver delete all the flow filter rules whose action
> refers to a
> > given receive queue before resetting the queue ?
> >
> We have the device normative as below.
> " When the flow filter directs a packet to the virtqueue identified by
> vq_index and if the receive virtqueue is
> reset, the device MUST drop such packets."
>=20
> In other words, the driver may have rules directed to the VQ that is
> undergoing reset, and packets may drop.
> This avoids any cross synchronization in driver between queue management
> and flow steering subsystems.
> For example, for Linux, queue management open/close channels occur under
> rtnl lock while, flow arfs rules handled in a non blocking bottom-half
> context.
Ok. Thanks.

