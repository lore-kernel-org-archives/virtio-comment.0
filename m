Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C1419A288
	for <virtio-comment@lists.linux.dev>; Thu,  5 Sep 2024 12:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.148.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725538630; cv=fail; b=Xd2SfkGW5j4vasjNbMNbI0t3DOcOhZcXAkz+jRuaOysURo2e6827O/qCTxISOF0DcJhP8Ls2umFJcwPtXfdtOs8cX7Qzh5LneAej+upRo+8NalYhqMgyBwCNj5+2amK9pX+3jLBl4Qfc4CA9qlSb/lCpCYX5EENFD6bmAM+MMPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725538630; c=relaxed/simple;
	bh=wuN7HjOTIxMPf6DZysZy3C9BOY/fpZPC7/oh1mqNJlQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=vEzaRMo4wT4tDJEiqNCpRHheAOzACfIvHDTh1cm/sbFbVJ0CFMBuiNnuHn0bgv0d2+TLO21dxuDx9gYgNdo82iyiYF3DG6G9Cjw5e0KzpVg9SvhXzjEIOmXLv1oQo1aKe97pBpZ30iT+k+iQfLXvAhHJpFU6XlVaz6tnN3aUupM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=XcnocsRW; arc=fail smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="XcnocsRW"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485AWPex018438;
	Thu, 5 Sep 2024 05:16:51 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 41faywgapt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 05:16:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zPtJ815eDy6hoB0kPezW9X+OcxwWgQSiJIQFA7efi+QMBDihuF9p6BLbsvrj/HebwNi9Svwh8RWcKRU7e/HOivsktLXGi2XlP03obFT6z5x1ZYFtWb+Iyj49CJZ6o5DwpLByYZZHpzGz1OYcwz+nKtF9Fg0IlhWlMmUAqmpVtheAsaPh3MJtNMuNLHNbhYSMCGoeK+aWlnI+9hA6fNceseJdLVhmEZsdm6GWyqmSIk6N5cuWPIVLFhQeKrIP3BL9YSY0XBip0FerhfVUko8UDLlWQXFhHJABrJ48pUsdvMBKSyd+XiV7A0Xgm0rZz5OJh5pq4jMPPqfohbhZkoeoxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wuN7HjOTIxMPf6DZysZy3C9BOY/fpZPC7/oh1mqNJlQ=;
 b=bsTG+titkSl52e+Fxosd389SVgL8EywLFkCl73Ixc5+PTMMuJIWsAXXegA3cSDfIByGGyOTxi7AkFj4X3Uf5TCmFX3B6s/ihRnsteU81gDvbkzZwYWhsECxt+orO1PROq/8vkcWEPeA5A1kQ1EXx7jEHmeVbuLZw57DirEZoEtbUysADO5DOOaASPx4/bpS3Om4DW2ppexQbfSMxhAN4m0wP+GIfuxhc51ItqQA+Rbmaajq1uGpjFLm/GzJaVzzwErOEHcksiMYc/E2fkD828im5Xu5HA/mIgTMNdd19kucaCkEhy9IasRwB7Q2jo3Us3aCM0eBo+/uccObyGsLX+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wuN7HjOTIxMPf6DZysZy3C9BOY/fpZPC7/oh1mqNJlQ=;
 b=XcnocsRWmgM0Zov7pX5xO3SQpu8KqHmoo4Hhilw+CVYRxh+oVYJ7QNgPsP8ZQpBC0lQpLR6Mdq+mrRJUAGXp739ZtosbD1yhEVMcvDHGMDKN+6zlGGMIvumlOzsST9MMn97gPYJ8qV8bymetHHLm+IresxRA8WUzJZvgIGhFc+E=
Received: from CO1PR18MB4714.namprd18.prod.outlook.com (2603:10b6:303:e9::18)
 by SJ0PR18MB3914.namprd18.prod.outlook.com (2603:10b6:a03:2eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Thu, 5 Sep
 2024 12:16:46 +0000
Received: from CO1PR18MB4714.namprd18.prod.outlook.com
 ([fe80::26fb:729e:a947:3e06]) by CO1PR18MB4714.namprd18.prod.outlook.com
 ([fe80::26fb:729e:a947:3e06%6]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 12:16:44 +0000
From: Gowrishankar Muthukrishnan <gmuthukrishn@marvell.com>
To: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
        Cornelia Huck <cohuck@redhat.com>, "mst@redhat.com" <mst@redhat.com>
CC: Anoob Joseph <anoobj@marvell.com>, Satananda Burla <sburla@marvell.com>,
        Jerin Jacob <jerinj@marvell.com>, "lhestz@163.com" <lhestz@163.com>,
        "pizhenwei@bytedance.com" <pizhenwei@bytedance.com>,
        "helei.sig11@bytedance.com" <helei.sig11@bytedance.com>
Subject: RE: [PATCH v1] virtio-crypto: add ECDSA op parameters
Thread-Topic: [PATCH v1] virtio-crypto: add ECDSA op parameters
Thread-Index: AQHazJKjJCn0Hb3A2kixH98LwsKrJrIN2AkAgDul3ZA=
Date: Thu, 5 Sep 2024 12:16:44 +0000
Message-ID:
 <CO1PR18MB471439B64145B57CCBE99493CB9D2@CO1PR18MB4714.namprd18.prod.outlook.com>
References: <20240702151500.2280738-1-gmuthukrishn@marvell.com>
 <CO1PR18MB4714E39350107952D4AF1F4ECBB72@CO1PR18MB4714.namprd18.prod.outlook.com>
In-Reply-To:
 <CO1PR18MB4714E39350107952D4AF1F4ECBB72@CO1PR18MB4714.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR18MB4714:EE_|SJ0PR18MB3914:EE_
x-ms-office365-filtering-correlation-id: f2d4e51c-8dce-403a-003d-08dccda49ba1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Um2XZXIVoj6y7FeRjoBuQ9wQlWLrDm6RbpQziT0G6SiIrVDb/VkNhcRvHDtN?=
 =?us-ascii?Q?OqjPknVTne8RTWkvlUeTfQYz7FpIvwrcQ48sOWtm351k40Twzv4Jc7Wa1lP0?=
 =?us-ascii?Q?sWj7O+bY93ygmf4Ikz/MH2srlZAd+jLyRGyT9/H+GCA9yIP2jPmwsmTM6bZ5?=
 =?us-ascii?Q?Mqqi/3nuDOowBL6aGa20/OusJqogY/YeCaGJzBLLihSfkPEqKaX+a+bFBPhO?=
 =?us-ascii?Q?l4avY5oMSJXH7EeVKbEdnmAZ13XOZsCeyrwWoSkTSxK/vdwQCERtrsb5JmbK?=
 =?us-ascii?Q?wSKa1J5xGwPJrw6BNXJQIeDzYxYmUoH29SyXGm5CLWlLyOj6NrVXUZ6T1lbJ?=
 =?us-ascii?Q?iL035b2svJvV5xY6lJ5LA75UwfPx+CR+TJmpgaNzi7nmzuyh3G0PcT4f5i3j?=
 =?us-ascii?Q?MJttVrCF+e5B/QQEUTDXU79Tvwjqn/Z4/a6FVwMObmxt4vY5Ph/gT2miCzZU?=
 =?us-ascii?Q?7Wg+DUyUoAoNerYbzi38oO+B0rdK2K3ljbouwlVfSzVO19P7yv7pSEUQHqKz?=
 =?us-ascii?Q?xmbIFbk7aPsqXnzyNriAFp57jaFsz6JHdOo1nvv7gi/KdaKKpM5ACOOhpp9f?=
 =?us-ascii?Q?65qi+lqRwawUO7rQN+m5AKIQgVBjLfL1QNTlMreP0f5SzhlU1ez3CXNJFBli?=
 =?us-ascii?Q?wIG0KFge5MSyodO9vAogFnlQ50yQpoWi0kM0t8FwocGjG/N2HnRVp98OPBWU?=
 =?us-ascii?Q?2f3LqjpDtjyUZrAs8lniSWX+CPe57mNf92ev2uf7pBp/BGJ+okrrrbXFOztm?=
 =?us-ascii?Q?A85ColEVNZ3euAs+53wiGXYhusuPYU4iJnT2K+kwjyAEBiMi+fxJKK9v5LqF?=
 =?us-ascii?Q?DH1AbTOKzW7SXm8EnDJc3YLvX+BfwXU/w+ZomlNOapy01jxJEysWqdKN1hEW?=
 =?us-ascii?Q?m3i/O9yUeJ2gr6LnSyFDrueCv3JPTvEhc49BFpMkQGIUNBJ1fxsINxsxf5Y+?=
 =?us-ascii?Q?b1t80DbOXuaf9jtifYF8yN++TItWXKmLxLtBGIZrRnbecAtifhbnjfIzEQUW?=
 =?us-ascii?Q?TiQY0SDnE5LbQ8oFsJUrqdm4OGIVVEdIw7hmEx57rqVycdNvTmGDDvPnFXHI?=
 =?us-ascii?Q?dRsamn52UPT8V8I1W+ij/8mI01lmQS3xMpb0njatH93oMs2k6mTWVfJQW6z6?=
 =?us-ascii?Q?V+u7YMIO64EOkRc+y5sTtKxnXiPKsU2u5MC3qAUM+SgqL/U2ZEK1wjUo1bWn?=
 =?us-ascii?Q?GP/pCvCP2CShLe2OLZlpyTcnzzRH3WPq5zNXA5nHchIq2f3uP7IG1c3UyzKD?=
 =?us-ascii?Q?4JhlJpFhLj66kPFalyE+lU9udIam2svkcAr3dVhTqcPO6Q6Y0gZsPntoq6g5?=
 =?us-ascii?Q?rXuTYwhpIv4CBQ4NyfCcOrJadRbeyhxRNfsJ+ooJVSDXorrJWEayxXiItIdf?=
 =?us-ascii?Q?ldPafNB19PmAD/q2IJ8hqYsaYHMWXl8QmhyrSBhVI7rG0TID5w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR18MB4714.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BtAzQMKkBIkqgp5Tx+U3G57ye8iHhgN2DdElMLqBHSUYYeTpoxdMNuBVwuEi?=
 =?us-ascii?Q?1RqkmaKDXUsuyRoBKpJ2wriMZujs+0wpEP5RdJzxfabIqpa2YPxeBtQ4Cvq7?=
 =?us-ascii?Q?sWxfHWRwceTOnEw+rWYJU3w7sIeG6zVeoeQMOawqiMrAYTaKgOPtN8O0RaTv?=
 =?us-ascii?Q?EhMSeLAB+s50dbujHHFzBu2cgcQT7PHFDGQoMo3gyARKvmMULhmZX/w9a2by?=
 =?us-ascii?Q?Jf1gjDsyQUnOvI9UmYuZG4fk9/6LauKxRL+vte0ATKEk1dME4z5/N2y7te/o?=
 =?us-ascii?Q?QTCII+9pWxXB3Ot7/NhaaOCUtmeZwYh1TsMcdyoKcpJ3BU6O32Egl2woV6o/?=
 =?us-ascii?Q?E6LrYBT386OFAMtGyWFzzzLwCdA2RPmt/rCF3OQVgu61bs1YZ8NIxir9YFjj?=
 =?us-ascii?Q?N/ZB+y71SnVLecTUx1XPED3kZIZ16QOTeDWjB94k7rJR50XFmtG7gZmgqCBw?=
 =?us-ascii?Q?Bev1FT67cGnBBlkGQKLYomTY4sqcflA3z2rykLzK+3X+65CHQ+Zyf8p4aelH?=
 =?us-ascii?Q?WgSweuRafsVA1e7oRmCENz1SU2pWK9qtzW/U80yfnGrMpMmtZV26K6GEm37w?=
 =?us-ascii?Q?LbRdvN1GxjX6XoXinZQTFg70EDEWhOpY7eZzVLP6WpvQqdWxzIJf2GB10m1T?=
 =?us-ascii?Q?/LoP/sgQuCQG2GRE6qQPzjXWwF7m4H+LHfl/UylX80X4q3cCc3BZcSPdFMnJ?=
 =?us-ascii?Q?52CARnuhFn30cz/xDSfxQP4X9ZpKTwVFBFexbH+bGwHEBa4xny5Ds/sUNgbu?=
 =?us-ascii?Q?IV7p3cRbhs0DC8ctMCTtaCeGqY2yfICwKaTCTw3yBPeet08AUNeGdZ/+FV0A?=
 =?us-ascii?Q?iLpV0Dvm7/F38Ilh2PCFsp5/0JzrfpnEoeqt+L9yuakGezZW11RLGePqEiGg?=
 =?us-ascii?Q?+nFrWVst44q54O3c94TmzkI5pBJ1iZW5U5CweO8pOLKVXhlGG7jJPWQtk73F?=
 =?us-ascii?Q?H2rVIWQ6yi/uVQYzxrQ3XGVW+j6iXfvOCq63/R9jWbt30DMdo68EQH6xXdgS?=
 =?us-ascii?Q?+mNRwngVCRBz939m4xXxjmn3YW1kSOfh+juYBsj0LHw8ftqCgY6UgdJLGKUf?=
 =?us-ascii?Q?cao0acGpEnt5++ZKE8H76U6Oiod0uTH1ZjH0ulo1Ue8j6G9TL/tG4nLRFVYv?=
 =?us-ascii?Q?QejEheznDPkh28MuIt8WhFR8qSZV6Jc4W+K4MRIkn52ipVIogCjinxzHzu3X?=
 =?us-ascii?Q?rIBJdWK5fHX45ncdbVzfi6x8b5QmTdj7HgNSahMlllVuMvS8e+JgCebbsvNj?=
 =?us-ascii?Q?SmpJPHTushQynIFA+XL5nG38uEuAx383QIxELQlw54n0NDHgtlYn1RcKInol?=
 =?us-ascii?Q?iK0tMK4ibDcMeUZNMPV1rQh/xlzClcJc0VJmguDCmlj5uTnfmNgZK8d+PQ0r?=
 =?us-ascii?Q?NBIyXsfkypen93E5SI27iyKltJJsicxvKZpP+bz4fAa7EHZT01AjXPmg1Mmr?=
 =?us-ascii?Q?Hfhs82KgptwtCcL96K8vWd6xlVxBtU1byB2e8yKA+MMmT0d4Uhv/4xlqyKFa?=
 =?us-ascii?Q?vZ4mbu1vunceR3crV70scO1KzN8prp0O5NdvuibYHmul7GeqZa7uuHzXsj41?=
 =?us-ascii?Q?xYLj7aANVMALxpDYaRBjEUfR2wjP9IdJnzCgApo3?=
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
X-MS-Exchange-CrossTenant-AuthSource: CO1PR18MB4714.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d4e51c-8dce-403a-003d-08dccda49ba1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2024 12:16:44.8673
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2SVC66h7xUwYK1euWojhyZ6ZbN4ft9dprfEXGtXpnwEIJxDGuDEzmiGyhxLMNlXblS+NhyKLWG6hAN0WcIiiSBu+eD4fMB2j6zIN08rtyZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR18MB3914
X-Proofpoint-ORIG-GUID: t2G4U1KTRvOAf8cHuuXL_5q8VDtBvD-r
X-Proofpoint-GUID: t2G4U1KTRvOAf8cHuuXL_5q8VDtBvD-r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_07,2024-09-04_01,2024-09-02_01

Hi,
Since it has been more than a month without a review, I would like to check=
 if there is any information missing or any comments needed. Please help. A=
dditionally, we need to capture this feature in the specifications to suppo=
rt SM2 and EDDSA in a similar way.

Also opened new ticket https://github.com/oasis-tcs/virtio-spec/issues/203 =
if it can help us.

Thanks,
Gowrishankar

>=20
> >
> > In ECDSA SIGN operation, a random scalar 'k' is used to generate one
> > part of signature. As this value SHOULD be randomly secure, the
> > application might supply it through secure RNG rather than relying on S=
IGN
> implementation.
> >
> > Another parameter is prehash algorithm to hash source data before SIGN
> > operation on it.
> >
> > Current data queue struct for AKCIPHER do not hold any option to input
> > algorithm specific parameter. Hence, in this patch new fields are
> > introduced in data queue struct for AKCIPHER to support additional
> parameters.
> >
> > Signed-off-by: Gowrishankar Muthukrishnan <gmuthukrishn@marvell.com>
>=20
> Ping ?.
>=20
> Regards,
> Gowrishankar
