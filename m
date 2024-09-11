Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB4C2D7B8
	for <virtio-comment@lists.linux.dev>; Wed, 11 Sep 2024 03:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726024790; cv=fail; b=SgSIurb77dtGaERwVfjiAdaGH/JJcl0msgYCF33vvwPSEx8Co6oRMioJTcQS940bqLOARrWEaZr7ewY8cdxce0PNKrgGy7Uwo1nfIenNwo11Sn0AzgKrWwDwbjm4fZQ30DyVVhsV5bCddLj5ef5aixjaU53TmIA9YC/qf/bun3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726024790; c=relaxed/simple;
	bh=fw1Y9gzkArSpEqyKBitJVJk4ZCHYYqrUhoRxbi1lGFQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gK21ckVqQnzlf9yP5b4DLLPCzTtG4bv9YTu4tl9iAsrJXlGEVazG89RV4AnY1jqhUM8BYt4fk5rqNmxXcnc0NlxZQHWJueYedN3KHBAEVBR4jVpBcGQhoDrPUex5uXfNar9JR1btCDRzLyu3i/QP5P2pN79pKewcHFBdQaSYhyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mTP8deXu; arc=fail smtp.client-ip=40.107.237.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mTP8deXu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QXWm+JjGslBlUwMywzNJ4LHXSyt+rSE1xI6zfh8VQ+jIWWb3cJVYXYr5FV//IdZKfEev1h+3EK/zepeRYjVJq3gQgr5yTi+l4sQIch54s15HgOPVRuH4QEuNU8vs8IGWu8kwqOmgahtXoRCKIVuisBtmZvGdVVxPJO7VrxkXJ46zScWLB0yWUqgsYgZ3rM3/0AxLnVHn2L18WQhf3cvRY013R/kjs+0yt8Tq7NVmBo+ykd3GLFOIXitWhajg3xN3JR3tEnyCc+Xiu+ZANpdx1EXrzEIb7fVGNzZRPiKm/S6efU1OCVC2lsC2QLEOb7BUPZsKnnjVESEfP0cnHIoe+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fw1Y9gzkArSpEqyKBitJVJk4ZCHYYqrUhoRxbi1lGFQ=;
 b=s84yzEKa7KBLMpj9fzCK1f9wEkYEd9HPD8i8/6zhoW9kyxWKCxl5eqVsvhNR3t1UWe1LxB+xT0fMMnRSoUiiDz3yvM4io+nyj6oON0cVlaw9/t+yxLd75xqJL9bKKbqINy5t4U9//yZVHxS7O8t2Se3x06FH2De1lcHPc3U6YaLiV7+4YNEmhonQKz2qQ39d3440d1zaOTJJ7mHlVqd5i/I/iu6lJ09IpWaEycjup3Yu2U4tk8vbogFuZDgBfOwwFmjbMbDhvTfCbDcpC9aFheE9cDElpp1gehP4PdZKRiEMj2BLwbR2I0dOzRAU0FNRGwRhViEyrp2XS6anq1DrsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fw1Y9gzkArSpEqyKBitJVJk4ZCHYYqrUhoRxbi1lGFQ=;
 b=mTP8deXugGSbddtA4uZndFZnkDCOLNW3P3O6RKXOSyRqLgU/QHUYJAPyD5rg0U1RMOxNkfDy7BkSOR2S54cvVJV+T5rfvOsPv2/U+AahsRDNEYu93yh0PHGV3kc07bSdct21GALk5crHuDp/8woPLE1W358XcpVrTq9K1b82V7CIwTM3OwKLkN2b3vH7xhGDKXpwQSV/fq7hPsUNk6iE4DE6qas93yzAXtYhy6VXk1KEtcS5k9tdmbKWToNSbcUwfo73321DhxPYspHa2fsIn6Sxb3no7ligW7AifjSSNKs/O7Ef9Kc77UmgLbH0DdK/9jq7Ngllg01zh9xzkXq7Dg==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by CH3PR12MB9077.namprd12.prod.outlook.com (2603:10b6:610:1a2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 03:19:45 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 03:19:45 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>, Shahaf Shuler <shahafs@nvidia.com>
Subject: RE: [PATCH] device-parts: editorial: Fix metadata type name
Thread-Topic: [PATCH] device-parts: editorial: Fix metadata type name
Thread-Index:
 AQHbAUZgAYwZkGlesUGMqNdfn3V7bLJPg64AgAG7gNCAAAC2gIAAAFzQgAAde4CAAATm8IAAGL0AgAB0e9A=
Date: Wed, 11 Sep 2024 03:19:45 +0000
Message-ID:
 <IA0PR12MB8713E6440868B97D63A52396DC9B2@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <20240907165218.778501-1-parav@nvidia.com>
 <Zt8DqrYIXGMM399j@fedora>
 <IA0PR12MB8713207F29554B2FB2219AAFDC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240910124712-mutt-send-email-mst@kernel.org>
 <IA0PR12MB8713C76D953BE65BE6842ACADC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240910143400-mutt-send-email-mst@kernel.org>
 <IA0PR12MB8713D2C68564AB88E9D159B8DC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240910161943-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240910161943-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|CH3PR12MB9077:EE_
x-ms-office365-filtering-correlation-id: b7faf194-b324-473c-37a9-08dcd21095da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ZwMBVW0cXkxtshdjVSSP2BcQ3d1KQe3JpKV6LMPj0mI46f0rEW4Js8QGDAPw?=
 =?us-ascii?Q?qb6Mhydz3KdigOfAUZHMIpQYPMCETVBwGntrPBLhIUI3fjswqfF1rbpKNjx9?=
 =?us-ascii?Q?wnnBweOJ6eeJQ8nfX12xqSdsLGOoynuAzjKtOqAULdwVROYVi7jbiZWyleaC?=
 =?us-ascii?Q?4+GsV0S3BAaTGbOQHRaWzQtVi/1YlW2jLSj0m1K6Jh6LkCDUix4FBlVr5KZo?=
 =?us-ascii?Q?bbk8EMeFPK0sH90zIB+19nzrU5OSxKMkL3ys9S6f0pHPH7MQb65n5yU7pooN?=
 =?us-ascii?Q?61QX1hKaPtzp4BvJC7AkcUsfi9jbuFAEhbpmKOgnUC4b8k4RkR9ljrupGWLk?=
 =?us-ascii?Q?9CyOSDfk2fVNDSGHsa+ZEU0+ZBan20p3MvpoAr52zMBzFv+F5ScemD4U+eyc?=
 =?us-ascii?Q?dVNE/ACWKwvCHfWtlw6Owx9mNDykxlczj7hYH8zu7YdQB5D7XYIb/Ahra2vY?=
 =?us-ascii?Q?vFGUNYeHhKZxqka4ZTEfl7TgGHCsnVTKSwXg8FDIeNSfyxZvlSeic3MxFZpG?=
 =?us-ascii?Q?QWi2CYro91fH94htJ1f2TS8eqkVxBmCpm7Hre5vCe0LXV0h3gHuACFOBgT0G?=
 =?us-ascii?Q?QrvfpW3Z3N39HgJ8uGyZefJ540MU2ItRReplPSWambwQR2Svs4pXtE8AWh1S?=
 =?us-ascii?Q?2jQPDuSEC+UQMXv8d8/NBjNjyfBrzY9ktu70oEyylR8fZzkCPq+eVxRaoImH?=
 =?us-ascii?Q?PCFGdArSt6pIhpZKx797w7rpPGlOJ8dpK4UXyDvWAfoSvIjZX3Ip1OQB4InA?=
 =?us-ascii?Q?ikTD/NF2doiS/ybeoUD9MGq2n2hN7y6rzSx8TsNI3CJ3QD8SAipN+ZHvWM14?=
 =?us-ascii?Q?1q2k0bmlh7SzJ2iibTFAhx+RHeWxq5UKJXddCEgyoIOyvDQwbEphbaTwiEpg?=
 =?us-ascii?Q?UExmwJnx7GhEaElEhWjyOPREs8LbDTCCQ+MY4k4SZtVdRn7M4wJF6JTfA3yK?=
 =?us-ascii?Q?8f3TrTY+64F/Y9twOEc0Jq37wcHQNNO2PKW/wMMNApcDVsyMENVKOOSrdMi3?=
 =?us-ascii?Q?nmKPPJ9jUP6lpUdYbwK20F2LOup1WoMIfr4AP7xtu8DxYXvfKQsF0D7VfvZt?=
 =?us-ascii?Q?gJzoPpfecJ5mfPl0R4tfScObwheFBnDTtHkNNdqLMOzJ6w08sqfvuiXZv6Y/?=
 =?us-ascii?Q?4avZlGOH/qTpHa8ijGg3sR962lBVjtf3JWUmQ4I2R6JVW8IZSubagDseqjPj?=
 =?us-ascii?Q?kiR/rioTfH6M2nYHzvMxaEHE1p5uR4x8LYcqnYbbeF4GWTKgOk7RBJPjVCmY?=
 =?us-ascii?Q?YE48NOTKmt/A1Izn3fvlPo6jZ++7beHjkguj5cmvnlAbW6jmFxaU6+6soPZo?=
 =?us-ascii?Q?e4WRilBwEBeCMe+tg3CZXRzAf7gRA9pqgBKT5WQhAIt4WgnKoEQRslgMlJDq?=
 =?us-ascii?Q?UDEqOTuMxdV6xB+HEhW4xsTYccU91U++c2YKlPhVJ+r8DxRjOw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?NvvQVukkNjnmk7UCrmg6Res2OCgm8TcSOFzf4zwCVts3HWAQMB3UELF6kGAW?=
 =?us-ascii?Q?u0vOtTfIdxSkx5WtC+SUK9tMALqslmra5C3qf+aqDFryLhSAwD++1LPhU3CV?=
 =?us-ascii?Q?FAh9i/gpH8TkztvWpJecxcFv+BuB76QPMYWTxqoTs/UFBKShrI+xX8Mvfbut?=
 =?us-ascii?Q?OgBn4chRWWx5r9nCE3EVgQvqQSnhFIWBPu3hlyBNUf41AiHERTIAesjkHgSv?=
 =?us-ascii?Q?6jKUFYjToDMVvIZrxzoAw9Aa0rTVi7IzKXFTeDGbBo3Hd9AV95zimrZgtSTE?=
 =?us-ascii?Q?Nh5FfvRlyda6xPp8ylbtc5rmCPOS9qef0kDTU/yQPA/Lf/DIpcnCzLcKwQXM?=
 =?us-ascii?Q?9dycyefgJU3vYFj2p+ZMRXcY+kWB7F7BzKuA3h8isAZyPoKXBf3mRalGUgkg?=
 =?us-ascii?Q?w1OvJTCWVamuEYPiKjb1V/VkD2L+1KcE7mL0A0sJad6hs0hX2qPleB6v3O9G?=
 =?us-ascii?Q?KMuvNoqUxYktSrqc1keMIzkw5gEm83UJ50bD18woBW1yPfQU0wwmitDNil1c?=
 =?us-ascii?Q?dMt2w/ZgqroBKH69bUFVshzXGZq6DVYbYHWsh8Nwh+9vcXTlw1n4fo/meEUt?=
 =?us-ascii?Q?cqB7HbFLqmfLDltZh9+/DzLCqR+HXRkql2ja/O9VedVQXrYzofyJ1WVQpky/?=
 =?us-ascii?Q?N0v/Myak/hWwyaNpgfscTdrRt5owfeq3fRnUTofUpyH0JTUI0hm2MUa89JJB?=
 =?us-ascii?Q?CGrvr+rVDRCacJxnlMGym0EiENmwW1aUEHcA3N/GA18d0ZWiCHhA0DOUKKH2?=
 =?us-ascii?Q?oRCfofAIHuSBBzdAhJELQUwl/msc5Mww6Jn3Ov8Dz+FjEVlwRO1eNCEEzxRe?=
 =?us-ascii?Q?wUWoxzj3kS4b5Trmdz8P9zHx3UHX5yNdpYAY6r9uq++x7dWEGcCxb9+OtRXF?=
 =?us-ascii?Q?3eAWNoxul7jxD3PrEwIzaCF8yC7zlvmjQ8cbjZ1tWf/YOfGiWZMuv4YJ4rUv?=
 =?us-ascii?Q?kJpTpxbQMGQYOvTyD1/Jm3CEpIoUCdYQ+uc8cYvRaE4rXgploIemJqwYx5wi?=
 =?us-ascii?Q?3Ft1HQqRGVN7s8k5tGp3DUFc7UaBFrCTFEyx/oDoby5QijwGd1VYsJHc6ubi?=
 =?us-ascii?Q?hcBL38ymlD6WEn0LQYJeR6ovoOgBEnlPsbnZtLsp6VYT7spYXxinVLYmqd8W?=
 =?us-ascii?Q?kZ6qZDbSAKItKgEjpLt8trhLlF2UipMebUbQaUWNCLXDBO2DUpOW/j4SAhp3?=
 =?us-ascii?Q?oKmtOfI7BGPuRb261oA4q4Xt0I8+B7ywgDATsK0CLt2+yH9tUor/fvdXdo8q?=
 =?us-ascii?Q?0lF9uJH2CcIKqAcr/9FXulTaioahWKJLOuk4581YGeOeCWUOws3bWcrfz/o6?=
 =?us-ascii?Q?lEw7miZbsuc93nK1Wz987OxpPrr+nbeex6FLvZNhoUoOPCSpnBjY6sru5QIE?=
 =?us-ascii?Q?YAjX4mKYZlS37o0cL5RTwgXt7fhqdhfajXw5REV1apaPL4l2nOzOXxA54uNE?=
 =?us-ascii?Q?zLLkYRYBep6m8OOVCOTNAbH70XC7oAzaz39is/bdKHU18lWktTlXw1ov395l?=
 =?us-ascii?Q?Yv/vkf2q775jf++q2zvcsmxqibLUbmuohHJwQYxM2xKDbpZEv8XEsHwi2gsj?=
 =?us-ascii?Q?wIWLmEPN6RR1YqxLDLpnpb2O6Zo803MnwXW8pA/gLj4GlCltgkEgJA76Dibe?=
 =?us-ascii?Q?WNmzOumKdpdIrCFmroQz+tV10pceP2ajolSmEvFrK19/?=
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
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8713.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7faf194-b324-473c-37a9-08dcd21095da
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 03:19:45.4788
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ++XTqLZiCEdfrbE5BSThtLIR+X/NltbA0724gv5HwTwmnalAanNH36eawqtcExQhlKXaT1hxzplN8OCg3/30CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9077



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, September 11, 2024 1:51 AM

[..]
> > It is already in italics.
> >
> > The question was : should be written as,
> >
> > Option_A: \field{type} field indicates so-n-so...
> > or
> > Option_B: \field{type} indicates so-n-soo..
>=20
> Ah.
>=20
> I don't really feel adding "field" adds much, because of italics and beca=
use
> one can see it's a field from the name.
> So, brevity wins.

Ok. Got it.
The current patch is discussion does not have word 'field'.
So current patch is good as-is.
Thanks.
