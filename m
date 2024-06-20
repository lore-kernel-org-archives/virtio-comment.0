Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC341ACE83
	for <virtio-comment@lists.linux.dev>; Thu, 20 Jun 2024 14:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.156.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718892505; cv=fail; b=hmpvAHgIjfVmDRV+rClrVqIUxPr2H8vgWZeK4GX6SsEyU36SP8l+xW5WZfXmBZkDsNOqbK2xjAssP7k/4e0lXCnFIMN14ko0W1Moi1PiRlCfax2JOVajrGkY9DWY1I756a5OAQyiNk7IadrL7W+Q9NJIdgJ+rlR249oXl2Pd6A8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718892505; c=relaxed/simple;
	bh=K3mXBVXxs/BpcUrM1/MaqfKEeRbBUSOV04JF5bC1St0=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=WbMJQaZNDfbht7XC7RWR2v2sS+TuWrQp3LPAO+uxZ5VcPOiDliryyELXnlm9Z4zPD23ZZPHEGI0pOp9YZNZBhGX3rHn68a8gjw0emYZ6ErlG6yxAuMtTTgqEaJCGDPNouO1e+orKeUBd4yATJhg3OGWiipKltZCfpZ+pLg2ymZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=R1Ejh60I; arc=fail smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="R1Ejh60I"
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45KASZN5027040;
	Thu, 20 Jun 2024 07:08:14 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3yvjq0guvv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 07:08:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5zg95Ck7u9L6ext1RAiSrPHB3FBUM1nPtwgBeSqbl+E5IXhqUIwqJywRVoBiKYJJhTv/CaPKjxXqExJCZeXbJQqGcN9Nx6zUolrJfizGp8SeCADOJRjwP4YI4kqVxi/Kk8IHuuEW2AZNOxrXIiYa+weQvdRsMaiVDm1zlOvTEdjtpFCc27XeIHvYgMP8rvew6s/huALym+sumq/Z8zKngbFK4ZiMCiabU7e3RCJCO4zQFE4e7BOu5OcgDdu2Z5BKS6Wx5Tv1+ztHo9CM3F6XbIPZYkJwwyDh25oapN4KVzTHEc3hklfwSVrjVbdU0YjORfUVdJDiWqXWXyuRQ8l3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3mXBVXxs/BpcUrM1/MaqfKEeRbBUSOV04JF5bC1St0=;
 b=X/y9awW+uPW4674s+l2MGecOzU8QqHj8j2dUu0e8Xpb5Nz/DXq/SV0etLU/KqGI4EqYzoVZjj+OmP+i3Q+Uqv7VkhJHICUSQ16eqDlH4Vxf4L405Wgr+ZE8lxlqMsVE5/Lo4pqjUCpHjvYXkgzRwtW96zQS8Uxywyr+A96jRVZseQUKMy3mWIgVVp3lipDQBXxT6XzDdDWKsIVBOoaVzpkqn2T837TRklasjBJgj43i1D8ts4b903txdK2Jy8q1CdwpinQC8kNhSZr6mVqVgfYoh0+4VT9LWD7ScQjBs892ncKGSE/NOuUPm+uKhRRDJ/DL9IXqNAInVe3SrRT5Lxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3mXBVXxs/BpcUrM1/MaqfKEeRbBUSOV04JF5bC1St0=;
 b=R1Ejh60IeYoHn6nxyxESw41voEVOmoqmPiuiJJG9q4BaBNDKvV3KJQiUSbkPR2V8uD4PvrrQHjLKRMck3rKR1IBynLopEFOesZPrFZeXZeQehZ4uUqPj19R0dfOTVHIKRQWz2uEp28MTe7jC+UHJrebYCvWZb+WQs4z9wtqbpdM=
Received: from MW4PR18MB5244.namprd18.prod.outlook.com (2603:10b6:303:1e0::16)
 by IA3PR18MB6164.namprd18.prod.outlook.com (2603:10b6:208:521::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Thu, 20 Jun
 2024 14:08:11 +0000
Received: from MW4PR18MB5244.namprd18.prod.outlook.com
 ([fe80::52f3:9792:ee42:90b]) by MW4PR18MB5244.namprd18.prod.outlook.com
 ([fe80::52f3:9792:ee42:90b%7]) with mapi id 15.20.7677.030; Thu, 20 Jun 2024
 14:08:11 +0000
From: Vamsi Krishna Attunuru <vattunuru@marvell.com>
To: "lege.wang@jaguarmicro.com" <lege.wang@jaguarmicro.com>
CC: Nithin Kumar Dabilpuram <ndabilpuram@marvell.com>,
        "parav@nvidia.com"
	<parav@nvidia.com>,
        "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>,
        "mst@redhat.com" <mst@redhat.com>
Subject: Re: [virtio-comment] [RFC PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE:
 add new used buffer notification suppression mechanism
Thread-Topic: Re: [virtio-comment] [RFC PATCH]
 VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer notification
 suppression mechanism
Thread-Index: AdrDGlFA4ED16PM1QIafLBmsVGVmzQ==
Date: Thu, 20 Jun 2024 14:08:11 +0000
Message-ID: 
 <MW4PR18MB52444DD0504F7110D4A580ECA6C82@MW4PR18MB5244.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR18MB5244:EE_|IA3PR18MB6164:EE_
x-ms-office365-filtering-correlation-id: 3df84d33-ef23-40ac-9f80-08dc91326b49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|1800799021|366013|376011|38070700015;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?vRo0stNOaaD95hYmswllQ340fKl2BHblbI5CI13a7tq6qEo+HxWXZDwS6Ank?=
 =?us-ascii?Q?2XXD87SaTWt/xBM8SMtbGEL36sPXo1v8nK5WY7+mlv8tVlR5cwMGfZnwhqKl?=
 =?us-ascii?Q?dysnuIkbbVo+wh+Ylq6iYKngtk1R//2PDx5v028oq+IhQwwRqiM+i9Mll5kE?=
 =?us-ascii?Q?deZrEVqwnKwVssFaR6+iEGwU7G3BmDXCSwySwUsXmsCX24ac97DlAyLCeOgs?=
 =?us-ascii?Q?/tNQNVNwSH4YVu91L9ZnMTv8voSW5qnjgvTAr1gi4TD+bYCzutjVntNXmxK7?=
 =?us-ascii?Q?IAmQo1WlRYvb3rUa1MjcPuRIx/qzjBcpI9ukB4S2AvAFnZk6wFWclC3VFiDK?=
 =?us-ascii?Q?MDTYyaT78rcpCCEh0c7B+XHPDtd0q+BcCDH5Ky+vJsgw+/J4q+0G3v3lTaZe?=
 =?us-ascii?Q?n6Ek4A+BqBm1lIKygQllObAeu9/tnuy+3Mk4tVrzQyc/5SEA8TEKfTtlbiJ2?=
 =?us-ascii?Q?lPWipRfjIv+apcPktQxv2kSXNaMUTKHa3gAz2RncQjmh8ug+6PR1FbgBEAwC?=
 =?us-ascii?Q?j6ywzhMykxzWCaT/+TGHBCyoQzs2/czcmOronkDB2QGPf18ekh2Kh7pDy9Pw?=
 =?us-ascii?Q?LdesJHIbBkXpZh65g4sHoDQboXKqjlVobo8NlEbYj5R9boftjivP1PubZvyX?=
 =?us-ascii?Q?jJwZE+TqgHSNTVp1+7mI7gH+CXkPHiffOVA7Uuf9+lBr4q2VWyABSi4B4CAa?=
 =?us-ascii?Q?YOozOPVCuyaRKXGEbK8MRbKXJ6nu849KxWFX0cCTQD/8QLb4C9E9OH2Kxz8c?=
 =?us-ascii?Q?8vQEDiCZyzl1RoX4dawDr58Lm2MkWxIuMbnmLBdRRCTm6WBjTQWVctQBC/bG?=
 =?us-ascii?Q?cllPysijEBjEYzex3Dt8BvkonUDQ/VWIK/wZN2Fz720MUBV+NI/sq+5QHDJE?=
 =?us-ascii?Q?e5nZRyPT8CTtIO6SRaI/ACO4IUb7+U3xeNIIhriDKs2P8o8zAzD3CVZPvHn5?=
 =?us-ascii?Q?FpZ0beX5xDnN4X/dY0JFNbvcKVTAKV/zW1GXhaF4x2W0piS0e0RnjH96YeLP?=
 =?us-ascii?Q?0UKey9AzYkMwBEnGIDeh+AyodOAKOspHDMragB+bv9tXMla2jdyjfSNudUqg?=
 =?us-ascii?Q?3N9ciStpzHB279OiQi0FV+4yRrQpnbD4Ek1Y96V0LshWI1D4IBEDEzLdaAX5?=
 =?us-ascii?Q?9KqBsoEeOJEdlX/mEr8rlWWYJ6Bpfl3g60DUuBVkF/zwHmUPF8zCFPI0rOso?=
 =?us-ascii?Q?affnR1en6aEDMMjq6+13KI1fIE1Gk+CwOZGcFWWScvtrhdoqM6mAblQ+OCzM?=
 =?us-ascii?Q?n2me/LvPmxMSrPeisVPSvhI2pq+aj0JYaCI9lf5LmfyUK15fqvVJliA/KDr7?=
 =?us-ascii?Q?v89I5xDJb+Nf/JZSFEFhXAUs/0ucxuK83P2jQwbBHXIimTDgYHWlQcv5PpdB?=
 =?us-ascii?Q?UsHPFF4=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR18MB5244.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(376011)(38070700015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?8cLgTMW+juK6g8GG1vPo5zVzFJwwNpZpeUPK63Y0xEagBt1GohGb9SdejLmF?=
 =?us-ascii?Q?j5NI42Xdl35aDtcqBImAd9FPYMeRlgFuKPkGqy0SU+s9tL9S4DirSoONh0ji?=
 =?us-ascii?Q?qH159eHws9Kv0GWQicChaRzD8Wjs8MJEXTLlQojzTT7MLAoqK5tgtjDRMVFp?=
 =?us-ascii?Q?TCeDZa2XYeF3rLF60fl3irS1m+V8Fg2T35y02odxnaDL3Z3E0RtqX/w2MBVw?=
 =?us-ascii?Q?gUMD+zSWry/5ZzZn677Dqdubekj+kRYG2rnogxfmuo5fMLRel/0/RGOGG31n?=
 =?us-ascii?Q?S3NTvPVfTlwfmCafVtTCQWePFk0M4Ot4VPK/MFQwE2Dhfmd/UXIw99Pqe9kn?=
 =?us-ascii?Q?BQPve4wdUmbtqMWIPM4+TBx6QNrGY0qQeevtr19ybLjIbnYeKkKeIPdgWgZP?=
 =?us-ascii?Q?2y1hLLgmhwwNVInxIL8xCrNQImtYBQhAOuTeNXdfqJLL6RjJhzE8ohOVtneQ?=
 =?us-ascii?Q?fZkg+dl9qMJKCDzla1dGI/qh/JOFEFFjoPWKbbR32M6VEZeJzE6MLEUmElqk?=
 =?us-ascii?Q?kXiXYQ691pbij05Bgpamxy0Qn4YfzfwiD/+BLZlQZC1m9bONSamEE+fH4LQO?=
 =?us-ascii?Q?Jh8K1Jmgo16gOnsEWN+3PnFNHYe8WjKs8Bt9oUtRjytVaswVUV0Ydd0OHJ5J?=
 =?us-ascii?Q?ZkxV8l8yO9+DF5K/UA3bHr86iGIwxCwYA9MxWYdHDT+YAG6hV4825uVuPtUI?=
 =?us-ascii?Q?ImaACANAzz7+H8Nhz/Mf5LarjXLV/bPlYFQRmUc95XKHRFFwd2q1Zfkpxs1F?=
 =?us-ascii?Q?sOJVfV613xGfC6jsKbax0Rgy6p/pk+IHFc8fWMAyQgnDX15ykJ+TadiqxMsz?=
 =?us-ascii?Q?0eWKup9UXRz8cN2xTkZWh3sZSY4VNtC38Q1fweekCajQyuKToFcUzusQsdXS?=
 =?us-ascii?Q?Zw4dI/x9qFFzZM2Ghn1RTXGa6tKSX6MPym0OdoZHudiHSiy3GIOBvX5jovyO?=
 =?us-ascii?Q?zErLMaEMidKMREHdreIiNmsbWu/eJLnHs+u+6o/p1F4CG/on7BoM8lLSApbv?=
 =?us-ascii?Q?vw53DG5iWTVcJkkKaUnn4gVxMhEGl6d34BDKFP5khAE6y0+s2uUfO8vooWco?=
 =?us-ascii?Q?Q47KSiJxBxt1sMzTFKfiNmONsW/kwrpNTva4/C1S4z/lEWGUMeyYAqhMFUhA?=
 =?us-ascii?Q?DvjTTEr/f3rdtoygkTUJHlephYJo6MRq1SaN0EAHUM0RWFxEfw/8+bImh/9G?=
 =?us-ascii?Q?1JzyOsoF5RXxNHZDOUBDWi+80jHbuQYNBjVW9YslK8yqDim4MD/9nJIhDm0m?=
 =?us-ascii?Q?LfvC5jyaHJ0iF2rkhAE6C/k53IRKWOQWuySJinN6x2dUFRgrMuedRkVqZZEr?=
 =?us-ascii?Q?v9c3AovXXdiimWZ26OczqPTzq/+ga65FewGaney2FHnKGT2KmviCyvb7eN/P?=
 =?us-ascii?Q?he/LANFjL9f7flqfeFEi+hltSacWNmzLX6GaK80NHoP9YD0BXsFMqR7lCna0?=
 =?us-ascii?Q?Ic6LHgjDIxu4nm9cbhDyDx5gDNi3t0jx4sU/nFy5sKJgifRSElQc2aHOnzNp?=
 =?us-ascii?Q?K1EH2LIZPWn29zmaxhSiH6UeLy7U92BG65JunLZkWVsuQls3DOUIbQOWWDie?=
 =?us-ascii?Q?oCpCjHpsBES+IxGLainpv/yyFjorxMRmQu/+ByBY?=
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
X-MS-Exchange-CrossTenant-AuthSource: MW4PR18MB5244.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3df84d33-ef23-40ac-9f80-08dc91326b49
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2024 14:08:11.3841
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H4/HWpnOzIq4ffKmTJqBvxd5vpXr/N/rvoHA2ZMt7XJ5kHvZpzPH3gXe30jP8H/m/cro6+t2I7Puh9aesaaLsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR18MB6164
X-Proofpoint-ORIG-GUID: 5mK0nRsEKfkgQ_B8h8Zpaceln84sCNn1
X-Proofpoint-GUID: 5mK0nRsEKfkgQ_B8h8Zpaceln84sCNn1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_07,2024-06-20_04,2024-05-17_01

Reposting to the new mailing list

Hi Lege.wang,

Thank you for proposing this new feature. This capability is very much usef=
ul with PCI transport on newer hardware.

May I know the current status of this proposal, is V1 already planned and p=
repared for the review.?, I would like to collaborate on refining the propo=
sal and the required changes in the spec.

Regards
Vamsi
