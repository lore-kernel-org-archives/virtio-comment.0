Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269F5ECC
	for <virtio-comment@lists.linux.dev>; Tue,  4 Jun 2024 05:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.148.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717477333; cv=fail; b=iwe3QilEh8chS74VARTgje6r2+M6D/WK1JwZOcp+C3BgHw3rN1QLKPT1i5WsGAb5dovEiCdttjtJRIWS1jen8Ab7Tp4tQqQHsrCDTdUXsnF19eJ4P35T8DoMCnx79sDi8WfbmCH8IuPOYZkLIXUJbaKNuXCbnvK+gJylyFVAiOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717477333; c=relaxed/simple;
	bh=fP2AlRdQsZt7hQCHSREFzjijTDL0H4tndKd8jQ1CbXM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qTCxq2gsJMTU0BEnHU2WHfxlrlF7T38j0co2LWqDR8yrqHTbSY6/eXGZgu71SRGrbRYTgJ/uK013o70vG64XeGdDddkXOOysT8ssOqO/tx3pl05C7PsfUGc9ErgY91Yfz9LrE7EvwIad70w2jyrl9zWfozQyc2bPSddAWzGNB/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=g+nuwwx5; arc=fail smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="g+nuwwx5"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4541i7B8003832;
	Mon, 3 Jun 2024 22:02:06 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3yhsh5rgeq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 22:02:05 -0700 (PDT)
Received: from m0045849.ppops.net (m0045849.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4544q8GK016851;
	Mon, 3 Jun 2024 22:02:05 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3yhsh5rgem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 22:02:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OaHt3U36B7Ai7wJUlWK5BIneYK/s8imkg6+TTIPs4zYxwcCQ5TaVPEGcDJP1hq1Jul5O+VG6zw3XIsYOKyovySp7C/zOak8T+9FJhkqeMpQYG4DHDllSDg7rQH/N0VOsHFDkA6PScwszSd1t4ufL/8rY4bII36f6R3rLI7m1XUCMdPCjmm3Ziwa4Lt3Ev/OUvlboDTh7RmnL1BV+d3XOT+Wi0gKePeXCei7YO8221BO+plu4k8CZahsEIMEdX2Y5i4fwdr8/PsDi4xPZEbw7kYnY8oS7fkRNRLWS5fqNy8EwI4Oix546I4diKhnB9bG/OsaHP3MEEAT/J9qBOhLuqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1WEomnczaBkB4LB0HFJelgtG3LQKtG2N8MUBxfvKL4=;
 b=Y26ameeMpShtGE0USQ+aUEV10JOPJYrGOFhAiwPthcodYjHMFhp+L0NYuedEJWfZk++xzgWFEeTbt/oeZ/9aOBA2iPz7tKDO4ZcHl4NGjOA877Z4+5iwmSj+fOiayoOazRrkoQDXli0UZkf9Y4E2dZyUlOEi49Q9c4aE70+s4rM1vkLArSKZgvlbAn95fI0YgavgcEc7+ahD6m9uiVK2B+U9AFK1rI3qJytMi6jLa0QC0s1HgFG1QRpCBRs+LQqM1octBhWQk7VtLCfCbf8v8+js1H/HwTBKhjPeRcKWeJWfHaOVBaiRpG6pCiarpL4R+Yie0dm4rH/qE+VJjmF+Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y1WEomnczaBkB4LB0HFJelgtG3LQKtG2N8MUBxfvKL4=;
 b=g+nuwwx5bRB6i6RVGgNl1gvWHwbKGyNyHlXo4Ibx6jw+Wqz9ar8040cQZWPvXIOukxspWUBdUkzdYR+DJIshpQ3uprT4eDxajtRSFZBkrpcaMLEgaxzW6uZJz9Bnurj0TT1G1Y8j0IFcOGfYGdYr5pE4khcOXRBcOXvM9OXRz+k=
Received: from SJ0PR18MB4477.namprd18.prod.outlook.com (2603:10b6:a03:304::23)
 by CO6PR18MB3826.namprd18.prod.outlook.com (2603:10b6:5:347::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30; Tue, 4 Jun
 2024 05:02:01 +0000
Received: from SJ0PR18MB4477.namprd18.prod.outlook.com
 ([fe80::7c90:e416:9ec6:583b]) by SJ0PR18MB4477.namprd18.prod.outlook.com
 ([fe80::7c90:e416:9ec6:583b%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 05:02:00 +0000
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
Subject: RE: [EXTERNAL] [PATCH v10 09/13] virtio-net: Add flow filter
 capability
Thread-Topic: [EXTERNAL] [PATCH v10 09/13] virtio-net: Add flow filter
 capability
Thread-Index: AQHaq3q/O78988ibHUewVO9eFj4oWbG2x0BAgABUuICAAASmMA==
Date: Tue, 4 Jun 2024 05:02:00 +0000
Message-ID: 
 <SJ0PR18MB4477708B03C97BDF837EA1A0C3F82@SJ0PR18MB4477.namprd18.prod.outlook.com>
References: <20240521122937.2004180-1-parav@nvidia.com>
 <20240521122937.2004180-10-parav@nvidia.com>
 <SJ0PR18MB44775B0E116795E382A074F8C3F82@SJ0PR18MB4477.namprd18.prod.outlook.com>
 <PH0PR12MB54816EE8711155C8082AD268DCF82@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: 
 <PH0PR12MB54816EE8711155C8082AD268DCF82@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR18MB4477:EE_|CO6PR18MB3826:EE_
x-ms-office365-filtering-correlation-id: c22b874c-7d86-46f9-bedc-08dc845377df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|7416005|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?4/CGkydhAMu4lQFFJBBa8QKdheFZMqTFd/jve/8INeygNSKgINEi3o66ol3R?=
 =?us-ascii?Q?DVSXHf+RoTR4+0LvGhV9C15mTJVTeoWH1jJFnGYrO4JTcrLbNw6T//aSjFG8?=
 =?us-ascii?Q?L3p+v3qKZAFJMVYZFu0zcMqpBf5QeGaveW6fw19tTHUY+yAdRP3hZMLvekDE?=
 =?us-ascii?Q?G3aDPRvKlSiGgb0QYN1QX8Im3JGvxJJx6rHOCW+HyhQsRKsuKcS2zGQ3gAL+?=
 =?us-ascii?Q?iwXSOpelCUdnmE+LqukpQH7Gb6rJHv7FG8C8lBPE1vSzrDyzYuyP4odYtyRU?=
 =?us-ascii?Q?xJGxCz3avv2rbE3RXWJhl+ZtomxApoLsQx3kZsY90iOFz8Jn3Vj1VWQJ0kpg?=
 =?us-ascii?Q?8e77LGBdoEWqbiBDTsbzBYdEFwD1auyyWzRVEIW26GDLiPJqPUMoVYhbmuEz?=
 =?us-ascii?Q?40fYkvb3Cz7JCzP1JSGdO2gLnTL6rxr9+h1w7IMor5FsSwU5/K7kUEMziLAU?=
 =?us-ascii?Q?y6biNAKeqZMbYwZv9BR3TOW3M+9pD1fcv32khkdbWZiii6izziabKOhJBLRN?=
 =?us-ascii?Q?uHGPj8w4kTZea7CMKB6xSBb91ABSQ5lvpKQOFwDRGDYVyOaRI1GerUFpmhLm?=
 =?us-ascii?Q?+6PuoMigvDP68K3h/gdtCl82JTc3zx+n0M9GEuffnxYa03MhZcZUMHqEknpq?=
 =?us-ascii?Q?WtLI8houiamZCcwYLEPXMD+yeP9Uf9zFeWAruRqJyhJFw3z30hRnPQx6r8WH?=
 =?us-ascii?Q?CWMcDvYa7yeiPvsFqMkCqKNB0ATiF4bO0ou8zxI/BJDrFXgksyqWe7oAJfi2?=
 =?us-ascii?Q?rt9bSE1uw3Or3382bw11Uy0aZh89E1ktd/1fe/kDzGFilzQBu2E4tAwgzr3D?=
 =?us-ascii?Q?QDu4WLC4+aZiIKu2YLastGbbuooiTGBftMvrJZi9Nc+suBM136TbxmtZQnPX?=
 =?us-ascii?Q?99hdXk/UqONyGkv+9v/Q8V+UczOBdPLDOSfJDfLo6wiB0XbQGjDvF3d0JUut?=
 =?us-ascii?Q?dqS5Gme2DHlriTaJ9Zh3QwTHipkeH4Lemt5vxW0UHBADXtPDj4QwqwkJeqQi?=
 =?us-ascii?Q?RwGqGwGnTc0Vd6C0ibSddGdjlf4Pr93fV5V5p1d6zpyQfrXJdMyWGbu0Y1IJ?=
 =?us-ascii?Q?WAWheo76Nt164/EEJyGaabLB3Q9J+sXqRiWCE9Aj9HP0VWUisLH7z9x+mM+6?=
 =?us-ascii?Q?7PMh7u8kjDaDEVMI7EuS38f1trWmtojpBJRGTKn6LMgE63BFjVdFWIs137tK?=
 =?us-ascii?Q?JQv3N7Dc2gShQZmB0Z6aq0HvjThxu1y7f8mvEqfeAoeGvO31T77BWrFGpPbX?=
 =?us-ascii?Q?81wqdUhpCnkFy6oFd5nyK2rwZc18X/CcphyQXChyRZWBtgQnYQQxreA7Fgsb?=
 =?us-ascii?Q?U7S5bejGjiRVIDT33KCopi44LmtFZg/uUT3xyw57MZ4ahw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB4477.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?4N0aAskotXYpaoPMLQhnv2xUtr6cLR0P0HXv05WdAgtIVwzSbFYXKsRgRbZ4?=
 =?us-ascii?Q?ysB+5uZNc5Vjof9ZUoGljSxcpHXtqKNcyXVf18NEuFOXgpa9VwRicjtoE7lJ?=
 =?us-ascii?Q?U6hTHBe17LF+6HpbgruV3GZBIO4sDLbIeoDOz/5806TxJynhLldb7ULBE4zG?=
 =?us-ascii?Q?Sb5aU3ls6A+QaLaSVzzQWB4F4bAFCx/2qbm6wWyaHTkSr2u/bL2PFCnP57nA?=
 =?us-ascii?Q?vr2TCqbfBExSUeHc453Fs3hmZ2QmEWGihH49BtmRLwV7QeCtdi8iRzo2T9Wb?=
 =?us-ascii?Q?OMC2RTEBR4FWSU+488IJlddG/JQOiOqNG0PyZKYeYEaRiZPY4hwc7204IAA/?=
 =?us-ascii?Q?oDXRFMzXMVTTsyrt8Wepl0mmZXrJc1CsQMSazUcBD4LqTymdLtMGmQb8waep?=
 =?us-ascii?Q?fAAJKkLaVW7W4oo8ULn699B7ixD4KXjpV48vb1gbns8kHnr5Lpry6ZJTko+e?=
 =?us-ascii?Q?l9NmZzLgxML8zSTfrcv7QsQDQ5VjudkMmuKfn8L35wVsx3P3NiRhrB2t5ckO?=
 =?us-ascii?Q?YBAUZ16TsNd2nOe2Ngx+S2wjaNHqVmm0rRU57+mL+mqMw7bT5XvWGemsWQcw?=
 =?us-ascii?Q?N8fX6ienNVxim36OZL2NwTsTAVj9th3gmko5Eo8IYpzZ0TS9FT0aVgo/VzVy?=
 =?us-ascii?Q?zuae4Z3KHw595dqTZCKYM78ZdOmCRHZR9GqyCCcDfND1qaNEk5poxX7OORCB?=
 =?us-ascii?Q?oZA1hg+tZMOETYsrvt9c4wAwviMhviiY8Q+IAvze+1RNyMl2FV8MOQICpbMB?=
 =?us-ascii?Q?6FG3T6Fa40KBBNqtlm5/1AMNtE4uDD0jlYOZwHzI/jH/eSR0dpNZAsVVSfuN?=
 =?us-ascii?Q?dJjg+90orNbigWwtxJs4br+eLoXvLMXgJcbaEhKiVCRIUq7ZshZHSSxDFV6p?=
 =?us-ascii?Q?Jd0ZepsBwsoK6nhkNiJFTvIkyG6ewC1dm/IAkStvErx6Iw1l/qLHIhUxyhvx?=
 =?us-ascii?Q?g4rfhIlEq+kIGTtquKmUz85+fvmg6zOJuDoSOOs5BZqLG1Q1MydRYXTciQZF?=
 =?us-ascii?Q?1kMfA41RcNgUAddeWPlcwqcq08UDbufu7PCkh0VAr5l32/ysuZa6qq58IKU5?=
 =?us-ascii?Q?F5HenyfzAXk7+L/KcuCRYyDiW1Y6e+l0hZ0GB8iwzGWLIX2OPFNjihRVI+SF?=
 =?us-ascii?Q?EVM0x+43qGay9f2xjX9DmzxjOIwFB+3FQMYX3CFeEkUFVL+N1UoeysmZT8d5?=
 =?us-ascii?Q?jZgsBkSzWC1QOkCu1TCysT2vJRNNVyAHRkEUSkCoCQzIst9BxBBwY7AHmydO?=
 =?us-ascii?Q?VSa2NMrkg6K2H+1r9z6eSSG9w1TMlZaBsfxQbOKRoMSCDJIqQ8eKQic9k6HC?=
 =?us-ascii?Q?sEFXh+fnncswyvYUrtzpPWckQp+1HJIbpqSJjFrGndZz+eIK0BKx3fFTRsrd?=
 =?us-ascii?Q?PcGEe2nHK0tYdQMb6Ajp0gMvhtds8a84Md4AeBc2H+oRM2okj1xhcNOhvi4S?=
 =?us-ascii?Q?hxBwOFsws9FmnaoeyHG/aEa2rH04Aml5Yv9AAiLhBlEVNZFpkCdZ2TcoSsJt?=
 =?us-ascii?Q?xyC/Xh+0MRTOdVqeHAwhGqLhqqDSEhd8CxDx6iE7Ek9JP6FehRvS5tUlzZYH?=
 =?us-ascii?Q?HPlIuYfB8ti3KBtfpGH6KelrEw3lNqLX6xnGXr0d?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c22b874c-7d86-46f9-bedc-08dc845377df
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 05:02:00.7455
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pcpRJmwEO0iT5YVoaGplp1msG3esHtgTbKE2AXqzKaBXte1T+RuwTP1F0/9zHoIyIkYWqHKnwN2oQVau4X9bpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR18MB3826
X-Proofpoint-ORIG-GUID: g-Pm0CXfgP7H0PHaD9IMLZjpT3tF0eEo
X-Proofpoint-GUID: jajwB6FGZrryyPe4e1IR191AOfcjEOc8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_17,2024-05-30_01,2024-05-17_01

> -----Original Message-----
> From: Parav Pandit <parav@nvidia.com>
> Sent: Monday, June 3, 2024 9:41 PM
> To: Satananda Burla <sburla@marvell.com>; virtio-
> comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com
> Cc: hengqi@linux.alibaba.com; Shahaf Shuler <shahafs@nvidia.com>; si-
> wei.liu@oracle.com; peter.hilber@opensynergy.com; jasowang@redhat.com;
> xuanzhuo@linux.alibaba.com
> Subject: RE: [EXTERNAL] [PATCH v10 09/13] virtio-net: Add flow filter
> capability
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
> > > Subject: [EXTERNAL] [PATCH v10 09/13] virtio-net: Add flow filter
> > > capability
> > >
> > .
> > .
> > > +\subparagraph{VIRTIO_NET_FF_RESOURCE_CAP}
> > > +\label{par:Device Types / Network Device / Device Operation / Flow
> > > filter / Device and driver capabilities /
> VIRTIO_NET_FF_RESOURCE_CAP}
> > > +
> > > +The capability VIRTIO_NET_FF_RESOURCE_CAP indicates the flow filter
> > > resource limits.
> > > +\field{cap_specific_data} is in the format \field{struct
> > > +virtio_net_ff_cap_data}.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_net_ff_cap_data {
> > > +        le32 groups_limit;
> > > +        le32 selectors_limit;
> > > +        le32 rules_limit;
> > > +        le32 rules_per_group_limit;
> > > +        u8 last_rule_priority_per_group;
> > > +        u8 selectors_per_classifier_limit; }; \end{lstlisting}
> > > +
> > > +\field{groups_limit}, and \field{selectors_limit} represent the
> > > +maximum number of flow filter groups and selectors, respectively,
> > > +that the
> > > driver can create.
> > > + \field{rules_limit} is the maximum number of flow fiilter rules
> that
> > > +the driver can create across all the groups.
> > > +\field{rules_per_group_limit} is the maximum number of flow filter
> > > rules that the driver
> > > +can create for each flow filter group.
> > > +
> > > +\field{last_rule_priority_per_group} is the highest priority that
> can
> > > +be assigned to a flow filter rule.
> > Why is this called last_rule_priority_per_group if this applies across
> all
> > groups?
> > Or why not just call it last/highest_rule_priority?
>=20
> Right. I will fix this.
>=20
> > > +
> > > +\field{selectors_per_classifier_limit} is the maximum number of
> > > selectors
> > > +that a classifier can have.
> > > +
> > > +\subparagraph{VIRTIO_NET_FF_SELECTOR_CAP}
> > > +\label{par:Device Types / Network Device / Device Operation / Flow
> > > filter / Device and driver capabilities /
> VIRTIO_NET_FF_SELECTOR_CAP}
> > > +
> > > +The capability VIRTIO_NET_FF_SELECTOR_CAP lists the supported
> > > +selectors
> > > and the
> > > +supported packet header fields for each selector.
> > > +\field{cap_specific_data} is in the format \field{struct
> > > virtio_net_ff_cap_mask_data}.
> > > +
> > > +\begin{lstlisting}[label=3D{lst:Device Types / Network Device /
> Device
> > > Operation / Flow filter / Device and driver capabilities /
> > > VIRTIO_NET_FF_SELECTOR_CAP / virtio_net_ff_selector}]
> > > +struct virtio_net_ff_selector {
> > > +        u8 type;
> > > +        u8 flags;
> > > +        u8 reserved[2];
> > > +        u8 length;
> > > +        u8 reserved1[3];
> > > +        u8 mask[];
> > > +};
> > > +
> > > +struct virtio_net_ff_cap_mask_data {
> > > +        u8 count;
> > > +        u8 reserved[7];
> > > +        struct virtio_net_ff_selector selectors[]; };
> > > +
> > > +#define VIRTIO_NET_FF_MASK_F_PARTIAL_MASK (1 << 0) \end{lstlisting}
> > > +
> > > +\field{count} indicates number of valid entries in the
> > > \field{selectors} array.
> > > +\field{selectors[]} is an array of supported selectors. Within each
> > > array entry:
> > > +\field{type} specifies the type of the packet header, as defined in
> > > table
> > > +\ref{table:Device Types / Network Device / Device Operation / Flow
> > > filter / Device and driver capabilities / VIRTIO_NET_FF_SELECTOR_CAP
> /
> > > flow filter selector types}. \field{mask} specifies which fields of
> > > the
> > > +packet header can be matched in a flow filter rule.
> > > +
> > > +Each \field{type} is also listed in table \ref{table:Device Types /
> > > +Network Device / Device Operation / Flow
> > > filter / Device and driver capabilities / VIRTIO_NET_FF_SELECTOR_CAP
> /
> > > flow filter selector types}. \field{mask} is a byte array
> > > +in network byte order. For example, when \field{type} is
> > > VIRTIO_NET_FF_MASK_TYPE_IPV6,
> > > +the \field{mask} is in the format \hyperref[intro:IPv6-Header-
> > > Format]{IPv6 Header Format}.
> > > +
> > > +If partial masking is not set, then all bits in each field have to
> be
> > > either all 0s
> > > +to ignore this field or all 1s to match on this field. If partial
> > > masking is set,
> > > +then any combination of bits can bit set to match on these bits.
> > > +For example, when a selector \field{type} is
> > > VIRTIO_NET_FF_MASK_TYPE_ETH, if
> > > +\field{mask[0-12]} are zero and \field{mask[13-14]} are 0xff (all
> > > +1s),
> > > it
> > > +indicates that matching is only supported for \field{EtherType} of
> > > +\field{Ethernet MAC frame}, matching is not supported for
> > > +\field{Destination Address} and \field{Source Address}.
> > > +
> > > +The entries in the array \field{selectors} are ordered by
> > > +\field{type}, with each \field{type} value only appearing once.
> > > +
> > > +\field{length} is the length of a dynamic array \field{mask} in
> bytes.
> > > +\field{reserved} and \field{reserved1} are reserved and set to
> zero.
> > > +
> > > +\begin{table}[H]
> > > +\caption{Flow filter selector types}
> > > +\label{table:Device Types / Network Device / Device Operation /
> Flow
> > > filter / Device and driver capabilities / VIRTIO_NET_FF_SELECTOR_CAP
> /
> > > flow filter selector types}
> > > +\begin{tabularx}{\textwidth}{ |l|X|X| } \hline Type & Name &
> > > +Description \\ \hline \hline
> > > +0x0 & - & Reserved \\
> > > +\hline
> > > +0x1 & VIRTIO_NET_FF_MASK_TYPE_ETH & 14 bytes of frame header
> > starting
> > > from destination address described in \hyperref[intro:IEEE 802.3-
> > > 2022]{IEEE 802.3-2022} \\
> > > +\hline
> > > +0x2 & VIRTIO_NET_FF_MASK_TYPE_IPV4 & 20 bytes of
> > > \hyperref[intro:Internet-Header-Format]{IPv4: Internet Header
> Format}
> > > \\
> > > +\hline
> > > +0x3 & VIRTIO_NET_FF_MASK_TYPE_IPV6 & 40 bytes of
> > > +\hyperref[intro:IPv6-
> > > Header-Format]{IPv6 Header Format} \\
> > > +\hline
> > > +0x4 & VIRTIO_NET_FF_MASK_TYPE_TCP & 20 bytes of
> > \hyperref[intro:TCP-
> > > Header-Format]{TCP Header Format} \\
> > > +\hline
> > > +0x5 & VIRTIO_NET_FF_MASK_TYPE_UDP & 8 bytes of UDP header
> > described
> > > +in
> > > \hyperref[intro:UDP]{UDP} \\
> > > +\hline
> > > +0x6 - 0xFF & & Reserved for future \\ \hline \end{tabularx}
> > > +\end{table}
> > > +
> > > +When VIRTIO_NET_FF_MASK_F_PARTIAL_MASK (bit 0) is set, it indicates
> > > that
> > > +partial masking is supported for all the fields of the selector
> > > identified by \field{type}.
> > > +
> > > +For the selector \field{type} VIRTIO_NET_FF_MASK_TYPE_IPV4, if a
> > > partial mask is unsupported,
> > > +then matching on an individual bit of \field{Flags} in the
> > > +\field{IPv4: Internet Header Format} is unsupported. \field{Flags}
> > > +has
> > > to match as a whole
> > > +if it is supported.
> > Does this mean partial matching on other fields like source/dest ip
> > (something like 0xFF000000) is supported for IPV4 even if partial mask
> is not
> > set ?
> No. partial mask is only supported only,
>=20
> " When VIRTIO_NET_FF_MASK_F_PARTIAL_MASK (bit 0) is set, it indicates
> that partial masking is supported
> for all the fields of the selector identified by type."
>=20
> (above snippet from the patch).
>=20
> > In other words, why is flags field of IPV4 header special ? Does it
> not
> > apply to all fields ? (i.e. the entire field has to be all 0's or all
> 1s if partial mask
> > is not set)
> >
> No. the flags is special because flag is a bit field. So, to avoid any
> ambiguity, should each bit be treated as individual field, or should it
> be treated as one "3-bits" field?
> To align the original RFC 791, which defines the Flags as 3-bit fields,
> The text here is clarify that "flags" is one field and not individual
> bits.
> Hence, when partial masking is unsupported, one cannot slice this field
> into individual bits.
>=20
> As opposed to that, in an alternative approach,
> if one defines all the 3 bits as 3 different fields, than even without
> partial mask support, one may be able to match on those.
>=20
> The alternative approach is not taken to adhere to the RFC 791.
Ok. Got it. I assumed flags is a single field. DF and MF are never set
together anyway.
>=20
> > Regards
> > Satananda
