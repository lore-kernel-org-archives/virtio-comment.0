Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794725777;
	b=KyQiPOEi71uy+OM/Fy61cQ4KlAGM1uU9rQi4R9QfL8IOe0aW4Y/izELRzXQaJmXsKmpO
	 oxtKO59XC/ul7qIrfVtKOCWlIfeDOVeEkIceSYzmP85uEhbVgmOzhDJ+EpuH4GSDTAe3q
	 v0OYhsHn5ANmjuaH8RISG3vSkSXsxwkEkSYqw3NTX3JwgZ/K4e2M5izKpK9u9zly0TDvA
	 KWx+9i09snRz0Ot4wcl6ze3u4IgHQ/BGGPVfrWY57J1M64BR9BZam/3akYEj39MZHd62t
	 MHbVj57ljCKr3KX6IQPHox1Gn8WCRHL/ATpluRnYIs/l08M9HnCOTnkSPi3EARyu0lg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794725777;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=6ag4uvlTTQhY9+IrmDLbjKiSS1Y8O7KMhO3eDVJJl64=;
	b=khT2bZcXHSzglv7VRgG3aaLK+gqiuBy1PxV6MSmJ3TegpN3fJjjOmUj0+pqrPT4yYf0Z
	 KWoQ4gi/r73HASp+UTuevj4ojbzBNqMGwaD9JS26fowA6rt+CvcRn4uSGgxyI2M/m5aKL
	 kfgMpJXdz5PoMZpxAkeyGlk//4pCyZMD0JI4Sio8vC2nbSVYdvxqrL9pkg1xYeXJegzgC
	 EkvMLJEjJmNnfCZGcz3lG8udIaS6DlO2WJuwDaJzBOlYGmmnnII9rV+KSP+ZuroEN31ME
	 LWtZA+i3y4/tpeKC1eoLW5oj6/y26Jb2PN9WPxxBxtoZlQin8IErLHbjdrpCC6Aemrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=reUDgHGG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.41
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012041.outbound.protection.outlook.com [40.107.209.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E97606A323;
	Sun, 15 Nov 2026 06:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11E97606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=reUDgHGG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+ekXViEbnGuZyfl7JfvhX8Fi+fZ0zLXovNqffl5fnCDUEV9rR0xislfm6sgzQYjZA8EMuCVOqGiNcnMxs8XLyXodJqW0WRosDjROsqdnwZPJSMSdYlsBW0p0i6XC8PLdjJMzx71B8jYEOyzZZ9Mcgo9oqHu+tJb3s0OlZvkP3C7YA+moZLo2roRZsfpyEFTPAlEZqYMitlTVn+uzz42KOd55FCBHq7FB5qx0oZYO3b4nr2A/SQExOoosGVPflSrczz3tNpfm1eO2jFUj42KOvuDIppJvtHXkkFrP7Rp36+Dm1AgzVhVkvYOZ1lEr1ONV6/9UA5RRleWzmGCRxW1DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ag4uvlTTQhY9+IrmDLbjKiSS1Y8O7KMhO3eDVJJl64=;
 b=E1UYch+Eyatp+pMaRnT+S0l6dGeOYwo96QVjO66LOrycAFeKuxOkUENIfpOPROcV9aG6eBHcN0gXtJwmQY44eTRyey0gtt+CRH0zHT3NI7J+P8sPDLMjII+33XeJa2UQKLENaOp4f11f496C654it8N785LO8OHqpCRR9DytnmHcq4L98gJCRpqpMOTMktj36kz/OtApZ3hCJFc8/6seoCiMbFLrKYjyEYpcSOqse2XSY4V0q4VCdd+LDTHYWQHgIZFR85lDEhdCP0U47/pqI91rJW6l40Bp2gGlHsFjsRWZ/UCmtSnqvc3qbB0ys9V9zs7KrAtYD0dx+IYNF84+yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ag4uvlTTQhY9+IrmDLbjKiSS1Y8O7KMhO3eDVJJl64=;
 b=reUDgHGG/8eShO0ocIrUakJMU3sh1xgc1wbTMMGC87LhFD81ZcK0zVqPocwd0piDiYsWoy5bHmcPUN3HWAnKLSmKl+Fe9HxxLOZSiC9o1xcojHaGM5+tm2naWZ0BVcyVv4deucnD9yPETm5zsnCI5WiSUHlYp896feD2OFzr2+wlB1GsEOBok/qNwFYeeYBbZSmYy4B7G4s4GU55qJPSjG2HCTXCfLqZBvwWi4P4XL6vmNoBHyEmo3anHqH2AwM52dsPcg/6kszUnGhiuyU17/4ICkIPIvrUnRoB1jtPHfmIhMJMobCglC/jrJvIlBkuSABBftv5s2LkBqScLxzeOg==
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 by PH5PR12MB953872.namprd12.prod.outlook.com (2603:10b6:510:501::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Sun, 15 Nov
 2026 06:55:14 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6]) by SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6%3]) with mapi id 15.21.0615.009; Sun, 15 Nov 2026
 06:55:14 +0000
From: Parav Pandit <parav@nvidia.com>
To: Linlin Zhang <linlin.zhang@oss.qualcomm.com>, "virtio-dev@lists.linux.dev"
	<virtio-dev@lists.linux.dev>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "stefanha@redhat.com"
	<stefanha@redhat.com>, "mst@redhat.com" <mst@redhat.com>, Max Gurtovoy
	<mgurtovoy@nvidia.com>, "ebiggers@kernel.org" <ebiggers@kernel.org>
CC: "neeraj.soni@oss.qualcomm.com" <neeraj.soni@oss.qualcomm.com>
Subject: RE: [PATCH v6 2/4] virtio-blk: Add inline encryption administration
 commands
Thread-Topic: [PATCH v6 2/4] virtio-blk: Add inline encryption administration
 commands
Thread-Index: AQHdZfL745/Qup9gvkmzanKBYdA65rcuyjQw
Date: Sun, 15 Nov 2026 06:55:14 +0000
Message-ID:
 <SJ0PR12MB680625D5D2556A03E5B9B201DC7D2@SJ0PR12MB6806.namprd12.prod.outlook.com>
References: <20261027090945.185178-1-linlin.zhang@oss.qualcomm.com>
 <20261027090945.185178-3-linlin.zhang@oss.qualcomm.com>
In-Reply-To: <20261027090945.185178-3-linlin.zhang@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB6806:EE_|PH5PR12MB953872:EE_
x-ms-office365-filtering-correlation-id: 2134bd55-7b40-4419-2c55-08df42e56654
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|38070700021|10067099003|11063799006|4143699003|56012099006|261021121427099003|261009223027099003|261102123227099003|261026140227099003|261022105027099003|261022075727099003|261026121527099003|261028144727099003|18002099003|22082099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 C6U5Js4OVLlKRvFJfGaRRL0XoQbE7ropPILyu064u9S3kbxWLqcgXup66ztMhWIV+HHZLYLU1wiv2rRdBfCyU3cI/eJ5ObKJn701mUpSS51oYQQmjO0dzlx2OJgSn2z1kW+YIGHnNjOjmgseBB3UzUcu1rHFnhnBdGaMraHx0fhd/hEhg7rJ9w1lGqeDzYRvhet9058mWc4hfyc+w2nR/uSafKg9Q6rho3RUBguwVqhKVwlTO1e9glH1qqPY8RfaJJW8GKwxTf1QROgxMc7GD5fWEF9hwWOCj66A7qLcC0coq7A9zUHjCA907I1xm113qGSDqtp1M/E6yVCLgwnEP4aPcytEp5Q48bPjWHDb1d3opqkHquOT9Dv20r1Mp+Gv/0T9sUeGhkkaE4VWmdXIeS976MmzW3vZnJlnEMwZEBv3ojG6Uy/C2gCRVKQMvAuy33o2nixM6I6sZ0t7iArH/XzZGb/QsoGy5QWLgO670TKdygwhCLeN0GzFQM0zhVHdvqitOcyE+Nb1YN2zRJD5dXt998ZSTyLrrrYCzzcafj/Wzf1+qgJfvt2m+lveeSeQnuTRtfZ18RRNNhNa8UpzdEvfoJwONh6S7vxkF+0g1SHngTIC0wu0EFQNXEs9HAqNNkrKszerU17fUU/Ka6hGMN2IRke4Yi+pfRjTKGyn7n7phuWf7cVuWnPLibD4RFlYl5s07GIsUx6ZIHLrYQ8pPZeaii3RlBb9PknFy2UZQ/U=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB6806.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(261021121427099003)(261009223027099003)(261102123227099003)(261026140227099003)(261022105027099003)(261022075727099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?2fo3Ny/VSEvx2XMwBRPL5kGJJE4Q9iONEig+EpsP2sO+YyznPeiE5ns1c7gu?=
 =?us-ascii?Q?B+kIKyypLHVwQ6F32GgbPL8LtMyko13gGVJ3WJg6PaaGCgW8acycnbwxF2gZ?=
 =?us-ascii?Q?W8XzWt8f144JaGfw0QOMlQzHqxItVqnUSXa/L/+7CB0+sPoiA4aOkzEQZ/2c?=
 =?us-ascii?Q?ScKnQyqe3eicjNOiAdLmdqRq7PWmAnhsLhiXLWvx1CZezaxe+09vJjMCw6cM?=
 =?us-ascii?Q?T8roELMouvgvYtR8LiT/wKHyg9TbevGF3C0iW2MlXBoCP5v1x4Jg824sAVwX?=
 =?us-ascii?Q?l/YV6UfmGH1g/Vxdob54naHxAJb3E8ZiCADB0aXdhpSGlJ17RE47T9gnlkqq?=
 =?us-ascii?Q?cEbJmhvYBirqopdntReih/bevg+rTg1vqIkXoKmwZA+rDLOjNwHuC7iP12wy?=
 =?us-ascii?Q?F5yVjMD32HmRsn3w0kAs/+T7vNGgruZS+Bf5U0GR1RTqy0gAt195utD3l1dj?=
 =?us-ascii?Q?YAnLCIvcbzCzCwdhvYx3zI7mRZ273b4rtUkomYQalCDaZsXKSZ5EsOxpI0qH?=
 =?us-ascii?Q?4oQJlgHA7IkRAhRxuX1AMaGIeSiJpnMC3c2yGFvbgdplqZkPgzYmgliI39wf?=
 =?us-ascii?Q?hz+wEbyb6xnTOYYc0Z62/9XnxiVby2sOZHEvhnj5Y57f6MFS4CzDyvZNM7hY?=
 =?us-ascii?Q?SQbJOrDmx2E+eMXAS15cROkYr6uauC1bN3aB/wJKUbUnS1df+rODfANyWg6W?=
 =?us-ascii?Q?kZYXQ4elBMvtrtkns3gCZzrJcxSzJgmzmBkuiaZ6KvYmpQVbsQnMNuCOqQwu?=
 =?us-ascii?Q?l2ApxNc1cXmz1efrLtm05kWGryllejknMAfvsZgD8tSZ4si8n3fgJPiSM0Ps?=
 =?us-ascii?Q?TKNzKkEHGuEU1l/SSvqoqCIreEb8OeYq85llg2PdOP6MWiKP5+eNdG35kKBg?=
 =?us-ascii?Q?WhIeqrT92krNC3Oxd3XUoBNE6SmHZXIZ6uKNWOaPpwAZ8kPA1QRFOdHnIEgd?=
 =?us-ascii?Q?PebFxAyOualtQd2T6iXlVya3/kGjmqqE2iK//yIXMScDQWUpdKVZvoiLsyMZ?=
 =?us-ascii?Q?DcOTU28djZDuI1zb0VDqcCkKB//TczNpojtZ9KuIbs6Q7XNWXLYb4BFTqi3F?=
 =?us-ascii?Q?Jv59Uy5+zvVZaV2f6wbnRXXejVGj7om1hTAD+AB6wPrPdQNxxBlXc3eGAI0T?=
 =?us-ascii?Q?Lng2+h4A0gMYaGtKoFd7ABuAq9bs7vdIzz3PeLwkbHjozI7uEbNXvO5scpHT?=
 =?us-ascii?Q?V28JCwOs8+FaxyIutqXK65vugs0sSL6sJA7KVE7KPBPRL2dAW4RFMNe0azeh?=
 =?us-ascii?Q?RfP5RJjWyDbhyJWK2iwtpAaaNRbDOjlSf3gBCcFIlGKUZKqTssOUyq0iRDub?=
 =?us-ascii?Q?/t4eiHcF0UCVmnfrHyACA1S9bRCCEqKtQSOYkpMvYiytlbUWdSvxAeYJ3D5b?=
 =?us-ascii?Q?an2RzDo2L/uYMHamIR/ntWY2CrDICHB2z+0lHTdxhmWbXXe9hJcjbNuJM4xl?=
 =?us-ascii?Q?OdfptgoxvfUCFnWWlPK9LXXM+9DzdMXnnGIn2jy34xLhzI0nBJCVTG2whnYc?=
 =?us-ascii?Q?/FIwihwsVYTj7zvY/i9na/Xf14rJoKlNlQo27fVNnaBBr9J7PcOFmRvu5cC1?=
 =?us-ascii?Q?Na29YChxth7GyTL3ItoiTC+yp+iMXkfXIDF0qSw3AB0nPFq7tqmgUkVDxc6P?=
 =?us-ascii?Q?vSqmC/FusHCJ1Rk0ZHQgL/xNIbM5orzfLhbSYnlU97kfD/tXW7LQINd+0YAb?=
 =?us-ascii?Q?Q7E3JfdrJN5XyGERAgtSofXwEZUGQWrau9nMO1YJYoOwxL2K?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6806.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2134bd55-7b40-4419-2c55-08df42e56654
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2026 06:55:14.1035
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mUrds+GF5tFFTRGRpMk/fvBq4YJJ9NllElNsc2cNEvNWJ8tjvZdYnRZWUb1mrfEKa39cpM0l5itBuMAplq9SeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR12MB953872



> From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
> Sent: 27 October 2026 02:39 PM
>=20
> With VIRTIO_BLK_F_INLINE_ENCRYPTION the driver can discover the inline
> encryption capabilities of the device, but it has no way yet to query
> the supported crypto modes or to manage the keys in the keyslots.
>=20
> Add group administration commands for this. They operate on the device
> itself, so they use the Self group type, and therefore work with any
> transport which provides an administration virtqueue:
>=20
> VIRTIO_BLK_ADMIN_CMD_GET_CRYPTO_MODES (0x0013): query the supported
> crypto modes and data unit sizes.
This should be done as generic device type specific capability.
Please refer to an example VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP.

> VIRTIO_BLK_ADMIN_CMD_CRYPTO_KEYSLOT_PROGRAM (0x0014): program a key
> into a keyslot.
> VIRTIO_BLK_ADMIN_CMD_CRYPTO_KEYSLOT_EVICT (0x0015): empty a keyslot.
> VIRTIO_BLK_ADMIN_CMD_CRYPTO_DERIVE_SW_SECRET (0x0016): derive the
> software secret of a hardware-wrapped key.
> VIRTIO_BLK_ADMIN_CMD_CRYPTO_GENERATE_KEY (0x0017): generate a new
> hardware-wrapped key.
> VIRTIO_BLK_ADMIN_CMD_CRYPTO_IMPORT_KEY (0x0018): import a raw key as a
> hardware-wrapped key.
> VIRTIO_BLK_ADMIN_CMD_CRYPTO_PREPARE_KEY (0x0019): convert a long-term
> wrapped key to its ephemerally-wrapped form.
>
I think you need a key as an device type block specific object.
and you can manage this object.
For example:
create a key object (input =3D type, plaintext/ciper content), output =3D k=
ey_id.
use this key during the blk requests time.
modify a key object
query a key object.
finally destroy a key object.

Please find similar examples of such flow filter objects in virtio-net and =
ipsec objects in crypto device.

I am skipping to review rest of this patch; and let you evaluate above appr=
oach for v7 to reuse this existing infra.
