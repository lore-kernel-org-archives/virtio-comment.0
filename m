Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB98742AAA
	for <virtio-comment@lists.linux.dev>; Mon, 26 Aug 2024 12:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.148.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724675035; cv=fail; b=N8uQCgOmV4Mc+BVpaWPWZ2PWvsS2uf/eNmL7hBOPjS2yK57Hk5XGXDYgnYNhBawAh25KtjPcT96Ujv0B+0t6w5cDgFVsgBhAKqhfgJBisWTFg/A7NKrcV4422iFKBluEQYLy/UCnFyfeYdpCGswB9kuXHRLWnLcRX/mDfKPTMNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724675035; c=relaxed/simple;
	bh=vNqNnv/FmT3GXtMuGywR8nuGxhzAvQkt1FruetgihDw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=HZc45iGRssxxeU/WcZGmDIK3YZ7J/P0WKplEVoPc69VDW3Gu8kAI/mAx8SyHPk0JA0OGmao1n1fMKBIJHNgQX6MMRwPtyUG1qBEYUrDyUEUmFO5Ouq+815mTHNRdud1oqLGcS4p7VUVhqpuV93YcuXqlOCSNkMFUOJeF4RPunGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=fail (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=Y16psP+X reason="signature verification failed"; arc=fail smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="Y16psP+X"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47Q9uEQZ006184;
	Mon, 26 Aug 2024 05:23:50 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 418qgw8e6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 05:23:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CnhlQEvzk8GLEZKnc5p5COlsdvLt2clxM2U8WleJ6MYCszGc7ia2QI++WgdK02/QodCA6xSBgYNNAvjVOi0+BDIViV6cM4jddJ6O4V3whSS5k2Gc0DsNIAputvBMaL4yfLdur1/lte55Yu216dB4MezWPVcCk5Y5t3dXTzA3pA0cPDWuDkYSUdnithcSf8H6S596g+ftdxBJxzgw0iek2ks47U1KAFfKadGaVyYthuayDHiMzMcIss6becdV3iMQot4xeBKyxiCvA4zc6nTLQ0e4GjJLAswfH1s8jSC+4RcOGCKtXGs+cqUb45bINn58laBX/wtk13HDpeX1EZCTQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVtoZiEg1rak6XPXj/Xgg6HtTgz0fKm4dBT+XGYAR5g=;
 b=h5LUC7d1dYugZuQ9hylWBZ9sZOBtvOyagaZbGYV7tBD0W9y0m4Z0kVQbLgiyVskkGnZFtqDK/gWRgBdl860qUoAM5D8akFW95XS+mQc6p04SRY7e5ruQ7mYO3VYFwJeUbxmY4ZUuyBDBwrxuRe6afDM7RH58AAds00u243e70nB+xTskde5p4BNFXxsUD4IutkuE/YNdX8+nFh1sesNt3oisS3hBYyTWFZ56e1wL8shYyZ7NdCoV+x6tUMVpT5t9P0DPDj8FKMKmscYrL5tltfoTO1Pgwd79ZAJp1IR/LgIQhhzM1ShamjSRSOtxvDlvEgYoA8Q0E7IIuAinoIfo9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVtoZiEg1rak6XPXj/Xgg6HtTgz0fKm4dBT+XGYAR5g=;
 b=Y16psP+XlWB5Yh24zR8VSfdbn/WlEdy+dCsu99DodgQ19keEeoAtxrbENU67bnEE45/qU7/Of1KPLY7U6sQocht6qJ/JL3StP3FsUS6vgOmKwvMVGiOYBhBwlI6Tb7RO2+Cpy/ImggNaV/QDqqHgoh3M5xX5WME3DRyfgtHC6h8=
Received: from DM4PR18MB4269.namprd18.prod.outlook.com (2603:10b6:5:394::18)
 by CO6PR18MB4467.namprd18.prod.outlook.com (2603:10b6:5:355::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Mon, 26 Aug
 2024 12:23:46 +0000
Received: from DM4PR18MB4269.namprd18.prod.outlook.com
 ([fe80::9796:166:30d:454a]) by DM4PR18MB4269.namprd18.prod.outlook.com
 ([fe80::9796:166:30d:454a%7]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 12:23:46 +0000
From: Shiva Shankar Kommula <kshankar@marvell.com>
To: Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
        "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
        Eelco Chaudron
	<echaudro@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Stefano Garzarella
	<sgarzare@redhat.com>,
        Nithin Kumar Dabilpuram <ndabilpuram@marvell.com>
Subject: RE: [EXTERNAL] Re: [PATCH v7 1/2] virtio-net: define UDP tunnel
 segmentation offload feature
Thread-Topic: [EXTERNAL] Re: [PATCH v7 1/2] virtio-net: define UDP tunnel
 segmentation offload feature
Thread-Index: AQHa9ABgCEM9JfxrOEqgBI1WHDoU+bIzUlgAgAYl1DA=
Date: Mon, 26 Aug 2024 12:23:46 +0000
Message-ID:
 <DM4PR18MB4269FAAC3CFC7E57E25DFBD2DF8B2@DM4PR18MB4269.namprd18.prod.outlook.com>
References: <cover.1724234131.git.pabeni@redhat.com>
 <04089a87ff34aa518345ba5b50aecf737fb03f40.1724234131.git.pabeni@redhat.com>
 <CA+FuTScjheR1htWujZ5=adBRB3+_z5KrCyHKoRGVapGq-MGtJQ@mail.gmail.com>
 <70256c1c-f5dd-4ccd-a414-434bb56612fd@redhat.com>
In-Reply-To: <70256c1c-f5dd-4ccd-a414-434bb56612fd@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR18MB4269:EE_|CO6PR18MB4467:EE_
x-ms-office365-filtering-correlation-id: 72ca5569-5e36-43d0-a9ed-08dcc5c9ee9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z1lYTHZsSzQwSUJmaUlmOFE2MWZzeXBwaUZBUW1KMHFUajlvL1lVY2NJcXBI?=
 =?utf-8?B?Sm13cFRWN0d3dHZidGZVRkg5VlpzSU9INmpNV0ZUU3ZnN00yaTZmMGIzeGNS?=
 =?utf-8?B?OU5rdVNTVjQ5R05xYkFTVEtzcnlvYlV6TGpMWSt6ZksrYTZBVWl4QWZYWS9N?=
 =?utf-8?B?WjMrZDc0Qk42NHAvVVcwUlp3OXpLMVZmT1hjczlzbm9Xd0V2NEhITlRWVWd3?=
 =?utf-8?B?WGFVeEFMZDdzUDZYbzVvVW1keWpiZmR3Yll1ajg1K0E3dXZpRVQ2V2QveEJJ?=
 =?utf-8?B?d1IzdjQ0T202YnMxamlOdkFKUyszVjZONnhWaHBkMnU0T0RjL3d3ZFRIUDZ1?=
 =?utf-8?B?RWM2dE1ER3dHVjQ0ZzhlemRmWUhwMzdSRkpxb1RpNSsvZG14ODBlSzlvRjE4?=
 =?utf-8?B?OXcyY0dMNmlxV3J3N1Q2UFI4TUZQSkFyUUZ4N3NJa2lqVEd0aDZjK3JIalFn?=
 =?utf-8?B?cmhwd2dKS0VKZno4Njd5TlNTQk9NWlF0VlBPb240bGJtZ0R1YS9KOUpRYU9i?=
 =?utf-8?B?WE5mL0w0WFh2NkExeFF0MjR6QktzakhJY2pVbG1MWWJtVzZ0aUNpSFBzeTBG?=
 =?utf-8?B?NWgrLzlzUUl5L3BiTGpPaGlBbUtKYVV6T0NGSExiVXdCeFBReGFzRFo2L1d1?=
 =?utf-8?B?S0pJRDhiQS9oRW1wVC9GV2pOVHg4QXRKMXRJZUFWc1F6em1lRWEyQnI4eWJJ?=
 =?utf-8?B?N0RhbFpMMENzcUxDaW9pbGMyRGExb2R0K21kL3ViRW5IUGdJNVNQak9tcXMr?=
 =?utf-8?B?MTRjamh4UnNLcWhueWViVEd1djMvcVdKaE5YbFJiT1hXa1pPdzdpZHdnd3I1?=
 =?utf-8?B?K2ZBNURmWGZrd1kwQnluMXJ6T1pXQjRZS0lPMStHRzFBOUxzL1JESDFHY2hD?=
 =?utf-8?B?bGdXZ200alJwU3ZpNjdjZUZPQlovWCszd0RNNm95cXJkRFkvcmN6WFpKZFda?=
 =?utf-8?B?YkRFMkRZVWY2Q09RdmlPUDU5cFdBVkNlQlRPMUw5YThDc003T1dMWGoyR0Fr?=
 =?utf-8?B?Z05seS96V21BTnY4T0VJcE5obkFIeFNMVklqTXNPN0p0QjY5bGdGb3lWajJG?=
 =?utf-8?B?Nk85Z3FITGlZeGMxb25lZ096UDE0VlQ3SHBENXBtck9yZWtCaUNPOExHWHlL?=
 =?utf-8?B?Qk1yV0pxZnJmZmR0UEI4V1AvdjZ3aDdjWncrKzdCOUkyY1ZRdGpoTDhHN2Ra?=
 =?utf-8?B?UkMwdVdIRXBzRE9qaXBrdzBlN05JU3ArT1ppSVd4YUI2VkM1b2hBTXNEOFVN?=
 =?utf-8?B?RFNDZ3VRTS9nRDQzazJBMkY2bmM2VmVrZEFVUEFjVFhIMHFWQWJRdm9zL2lJ?=
 =?utf-8?B?SThrVkNvb1ZvcXM5bmJzNzRXeStKMmNIRUdYcDBhYkZkSC9wS1I1SjFxY2ZK?=
 =?utf-8?B?M0V4d3pOODFhTFgzNm9FSHVlZFpPNC94Y1VIbTVaQXRuR01Id0c2NEEyVEhI?=
 =?utf-8?B?N3RYMEtRcHNqL3JYUEhYejJWZnQ2NXhyejJHY2lGMDBRNVZkb0FVQTJoSjYx?=
 =?utf-8?B?WG9GY09KSkp6Wm5vd3RocExBU055N3FXMFRCZGlEdmdHOUdZZWVqUVhHZzlG?=
 =?utf-8?B?Vmlyc1FaU3AyZCswKyt5RHh5anZYN0pRMUxrdklQdXZvWVVucm8rRVJCTVR4?=
 =?utf-8?B?SnpYRTF6dEdYdWJ6NmM0TkhWYUxIMjRFVVJrWkdBdkRWczhjYVZBeWpXSks4?=
 =?utf-8?B?cVBLd1NhUVNwVmlWUmJrNUJEN2kvY1pHaDVyaUUrekNSbDhhMFZYekZYSlVq?=
 =?utf-8?B?QkEzaS9YMlRhMTdJWE9TTWZGY09xMmRmRjVNNi9ITFVqd3BjRGVBZzYyR3BK?=
 =?utf-8?B?YVJJbDFCM3k3MFJ5RzIvTS9ZakhaMWpsU3NacFcva3RUUmZvbXZXRFF2alg0?=
 =?utf-8?B?QXV0TzE1MnE2VDhJZ2dMVGlJVHBLWis2VkY3djE2ejVMWXc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR18MB4269.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?THVYY0EyL2QyVmU0Um94M0ZVTWprYktCVEM3Uk16SnNwSnY3WWhZVlEzdVhF?=
 =?utf-8?B?WlZPUWxCQ1pIN2UydE1ZM2h1S0g3ckhTRWw1b2ZpS1FPakdTMUxrNUt3ajRy?=
 =?utf-8?B?TXRjbDY5S21mSm5vaE45Z3FyVGIyQXhISkh0a2tHaTRkZDBuS0xDS2ovRlc5?=
 =?utf-8?B?UXFxcnl4QUd3NUMwRzBsaHorUS9pYStkWGN3b2VMOVJQZ01yTHhqS0lVbVl3?=
 =?utf-8?B?d2UrSFh4ekpaRTcrV2VWcWRxVnZGamJWVzBocVB2ZkY3NnJpZjR1NTN2UGxi?=
 =?utf-8?B?TnA3QWRoczhBWDhJWWtHdGVFUG5aSjIwRXpySG9pcUdmZ3dvM0lUaXVmK3NJ?=
 =?utf-8?B?c0RtY2ZoaFdML1RibDIrSHFJMWlHWCtCWEZzRkJJSTBUQ3kvS2k3TklDb0FZ?=
 =?utf-8?B?UFlBTFJQb1lYWWZTcjkydW9Yb09CYkR5WnZmTmhhaTE5NVpPM09YYllMVm5S?=
 =?utf-8?B?OWRFcHBPamQxck1wOXRFbzJVZnR5c1J1bUErREx3TkVvWW1mS1Z2UTk0MDV5?=
 =?utf-8?B?d0tLTlhxYXFPTkwxWHdZak9FWC9pdWRqZE01N2xRamZ2am54U2NsQ0UvZTR3?=
 =?utf-8?B?b1dlOHRLUVl1QU5WNHU3MG5RVEN5U1NoN3pPRU50WEQ0SzV4a0pUMjdNVDQz?=
 =?utf-8?B?ZGo2eEkzM1VKOG1Wb1VBTDVEUmpJN1V5TlY3V09FR0pHcWZKSk5pTDhNY1NC?=
 =?utf-8?B?L2xONTJXMjRJM3RpZlpCODdGc2dLekJvTkx1eWVNYmIySTlHMVdHRVovVm90?=
 =?utf-8?B?NVVxenV6aDVqUU1ySmtDVFRJOWF0d3lUc0RIdVFadlVOb1lwb3g3cEtpd2xK?=
 =?utf-8?B?V2xyOHFMUHltbkF3WnQweDlIZjhCbTA3K3A2dUl3NkpIN0R2N24yclRqT2dD?=
 =?utf-8?B?VXVwTGVRdWM3MTZFQ1VHSUc4MWtQN0ZyY1V0NEp6U0d3Q0R6OEM5b3FkNVY1?=
 =?utf-8?B?YU1HWHBtbkpmQ1I4VGRMNlFXWXJqNG9MNTdMcGh5bklaZVU3bUVSeVNtRUJK?=
 =?utf-8?B?S0tKTTBENmM0S1B1SE9hZ0xpMHNRczRoTGU4ZXlNeFVRczVCODhzdG9jbUM0?=
 =?utf-8?B?TG5GS0VNTWZnRlArUmc2ZHAwR0hmS0s3dUhoTUQ0MFRCZXBmcWxHd1lhbDN3?=
 =?utf-8?B?WVd1UDFKSEtIaHZtMmtobUhkOG1uTzhmZ2p6ZzFoSENuaGUycXJGaHprVU9u?=
 =?utf-8?B?UDd4Q2p3b1BhOGtmRXRRTjh5RExQdWY1QkFRcUJWUE83aXJpN3E3eUZiekgy?=
 =?utf-8?B?eC95OFZOSDBEVEMxU2U3QTNocDlnb0tsbnZDV05EbnY1V0RGc2I1Q2tyaDJJ?=
 =?utf-8?B?K0MyQmNRVFJCcDhaeG4wTmZxeWxlU1A1MFQ3b1hDRndDTXN0K1JwTE1OZjli?=
 =?utf-8?B?QjRoWVJCRUhlSkRSNXlQb2tQb3IxblpvVnZNdGM1ODhjQzRTcjVlRDRJK3Uy?=
 =?utf-8?B?dlB3L3NnaGd2K2t3dnF4Z0VEcVRkMTFEaHg5WUp1TVY1eUxHVk80ZG9oUzNo?=
 =?utf-8?B?NmttUVcyV0l6aUxYUWFOUlFmbk5qazFCUjNtTTVFNm85R3FEeTI1QmFHY0NZ?=
 =?utf-8?B?UW9McHV1RFRFN0JOV3U5VVl3a1I2UmtWZFcxTWNJK29uaEhCREtncnlRSzZU?=
 =?utf-8?B?RWZIQzVZL2lLbzRNQjFIdTZodk1UaXovRkFEckxYaEkvVjVVWXZEcThBUjlU?=
 =?utf-8?B?Yk5GNmpxL3dOQjFsb3BzUERaK3ZrSVFzVkFNYXZOQ0VkU3U5M0w4eXZHRUNP?=
 =?utf-8?B?QXBtZHduNlNtUXRldGtPZjNzUnRWVXRsZGszd1JCM1liWDdMQlprVnBzdVc5?=
 =?utf-8?B?QS9iMnk3bVJub0ZjWGZnKzFJcERoYkQvUXlmRWJ3UHpabEwxTWJvZ3RsN0RF?=
 =?utf-8?B?ditSSkNkWlFFUmhHcEFhTTF6ZUJmVFhpc1N1cm4zUU9GcGlJZVFGOWRXdGFk?=
 =?utf-8?B?OGhDR2svNjdDTEhGRzQvZEcvR2IxeTZrM2lrU0FaVHlMVWtHeGI3Z2Q2NGhp?=
 =?utf-8?B?dWZWRktMRlVNMmRDa2RLOWp6NklzSU1pNlJvb3FSWjcyNFR6RVA0d3diYi9X?=
 =?utf-8?B?b00rbXFVQklNVGRWWTR1eFZ5aDd2L00vMFJYaWVBallOZUdaWHVOT211Q20w?=
 =?utf-8?Q?Yme1al4yNmAnVNyEp/L78tfJB?=
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR18MB4269.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ca5569-5e36-43d0-a9ed-08dcc5c9ee9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2024 12:23:46.2055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 19QBuOo7TBM2Kts1vCqzUutMRKcORLSAdBpioSHxCW/kPnlI8/e6GWGfXhCPVTXkjMNUPiojSKzQ7Qg7elp5Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR18MB4467
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 7k0AWuY_RSPir9fTwWJd20Z_iXHAgv2X
X-Proofpoint-ORIG-GUID: 7k0AWuY_RSPir9fTwWJd20Z_iXHAgv2X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_08,2024-08-26_01,2024-05-17_01

> -----Original Message-----
> From: Paolo Abeni <pabeni@redhat.com>
> Sent: Thursday, August 22, 2024 7:41 PM
> To: Willem de Bruijn <willemb@google.com>
> Cc: virtio-comment@lists.linux.dev; maxime.coquelin@redhat.com; Eelco
> Chaudron <echaudro@redhat.com>; Jason Wang <jasowang@redhat.com>;
> Stefano Garzarella <sgarzare@redhat.com>
> Subject: [EXTERNAL] Re: [PATCH v7 1/2] virtio-net: define UDP tunnel
> segmentation offload feature
>=20
> On 8/21/24 21:=E2=80=8A28, Willem de Bruijn wrote: > On Wed, Aug 21, 2024=
 at 6:=E2=80=8A03
> AM Paolo Abeni <pabeni@=E2=80=8Aredhat.=E2=80=8Acom> wrote: >> >> The
> VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV{4,6} are two gso_type flags >>
> allowing respectively GSO=20
> On 8/21/24 21:28, Willem de Bruijn wrote:
> > On Wed, Aug 21, 2024 at 6:03=E2=80=AFAM Paolo Abeni <pabeni@redhat.com>
> wrote:
> >>
> >> The VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV{4,6} are two gso_type flags
> >> allowing respectively GSO over UDPv4 tunnel and GSO over UDPv6 tunnel.
> >> They can be negotiated on both the host and guest sides.
> >>
> >> One constraint addressed here is that the virtio side (either device
> >> or
> >> driver) receiving a UDP tunneled GSO packet must be able to
> >> reconstruct completely the inner and outer headers offset - to allow f=
or
> later GSO.
> >>
> >> To accommodate such need, new fields are introduced in the virtio_net
> >> header: outer_th_offset and inner_nh_offset.
> >> They map directly to the corresponding header information. The inner
> >> transport header is implied by the (inner) checksum offload.
> >>
> >> Those fields are required because a virtio device H/W implementation
> >> performing segmentation for UDP tunneled packet will need to touch
> >> the outer transport protocol (for the UDP length filed), the inner
> >> network protocol (for the total length field, in the IPv4 case).
> >>
> >> Note that segmentation will additionally need to touch the outer
> >> network protocol and the inner transport protocol. The first is
> >> implied/easily found with trivial parsing, the latter is identified
> >
> > Trivial because Ethernet header followed by IPv4 or IPv6 header is
> > assumed? I.e., no level 2.5 headers like vlan or mpls to complicate
> > matters.
>=20
> Yes ;)
Hi Paolo Abeni,=20
Apologies for joining the conversion bit late.=20

We are using VDPA-based device along with DPDK in our environment=20
and have noticed a significant performance drop (~8-10%) when =20
reading packet data to determine the [outer]network header type
in segment offloading cases as segmentation offload needs to=20
know the start of network header.=20

We considered submitting an RFC for the addition of [outer]network=20
header start field in virtio_net_hdr_t. However, since this patch
series is already proposing changes for tunnel related offload
features,  it may be beneficial to include this proposal as well

This perf drop issue will become more noticeable when the=20
inline IPSec feature (Marvell is planning to propose draft RFC)
is added to the virtio specification

I would appreciate your thoughts on this

Thanks=20
Shiva=20
>=20
> >> @@ -516,6 +542,39 @@ \subsubsection{Packet
> Transmission}\label{sec:Device Types / Network Device / De
> >>   specifically in the protocol.}.
> >>      \end{itemize}
> >>
> >> +\item If the driver negotiated the
> VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO
> >> +feature and the
> >> +  \field{gso_type} has the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit
> or
> >> +  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit set, the GSO protocol is
> >> +encapsulated
> >> +  in a UDP tunnel.
> >> +  The outer UDP header must not require checksum validation, i.e.
> >> +the outer UDP
> >> +  checksum must be a positive zero (0x0) as defined in UDP RFC 768.
> >> +  The other tunnel-related fields indicate how to replicate the
> >> +packet
> >> +  headers to cut it into smaller packets:
> >> +
> >> +  \begin{itemize}
> >> +  \item \field{outer_th_offset} field indicates the outer transport h=
eader
> within
> >> +      the packet. Note that such field differs from \field{csum_start=
} as the
> latter
> >> +      points to the inner transport header within the packet.
> >> +
> >> +  \item \field{inner_nh_offset} field indicates the inner network hea=
der
> within
> >> +      the packet.
> >> +  \end{itemize}
> >> +
> >> +\begin{note}
> >> +For example, consider a partially checksummed TCP (IPv4) packet
> >> +carried over a
> >
> > partially checksummed here means CHECKSUM_PARTIAL?
> >
> > The term makes sense within Linux, but intuitively partially
> > checksummed could be interpreted to mean something like UDPLite: a
> > checksum over part of the packet.
> >
> > Perhaps checksum offloaded instead?
>=20
> I used the same wording of the similar note describing plain TCP GSO pack=
et a
> few lines above, for cargo cul...  consistency.
>=20
> So just a small consistency-related resistence here.
>=20
> > And since I'm bikeshedding: "Note that" is a phrase that can almost
> > always be dropped entirely.
>=20
> Will drop in the next revision.
>=20
> >> @@ -557,6 +616,29 @@ \subsubsection{Packet
> Transmission}\label{sec:Device Types / Network Device / De
> >>   driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
> >>   \field{gso_type}.
> >>
> >> +If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY
> >> +set
> >> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
> >> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type}
> according
> >> +to the inner network header protocol type to request TCP or UDP GSO
> >> +packets over UDPv4 or UDPv6 tunnel segmentation, otherwise the
> >> +driver MUST NOT set neither the
> >
> > not neither is a double negative. Neither already means not either, so
> > this because not not either.
>=20
> The intended meaning is a single negative (not set). I'll replace neither=
 with
> either in the next revision.
>=20
> >> @@ -598,6 +680,36 @@ \subsubsection{Packet
> Transmission}\label{sec:Device Types / Network Device / De
> >>          header.
> >>   \end{itemize}
> >>
> >> +If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO option has been
> negotiated,
> >> +the driver MAY set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or
> the
> >> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type}, if so:
> >> +\begin{itemize}
> >> +\item the driver MUST set \field{outer_th_offset} to the outer UDP
> >> +header
> >> +  offset and \field{inner_nh_offset} to the inner network header offs=
et.
> >> +  The \field{csum_start} and \field{csum_offset} fields point
> >> +respectively
> >> +  to the inner transport header and inner transport checksum field.
> >> +\end{itemize}
> >> +
> >> +If the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
> >> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set,
> >> +the outer UDP header MUST NOT require checksum validation. That is,
> >> +the outer UDP checksum value MUST be 0 or the validated complete
> >> +checksum for such header.
> >> +
> >> +\begin{note}
> >> +The valid complete checksum of the outer UDP header of individual
> >> +segments can be computed by the driver prior to segmentation only if
> >> +the GSO packet size is a multiple of \field{gso_size}, because then
> >> +all segments have the same size and thus all data included in the
> >> +outer UDP checksum is the same for every segment. These pre-computed
> >> +segment length and checksum fields are different from those of the
> >> +GSO packet.
> >> +\end{note}
> >
> > The second variant, gso_partial, also implies that the outer header
> > already has udph->length set to the segment length.
> >
> > While the first variant does not. Right?
> >
> > Probably worth clarifying.
>=20
> I will do in the next revision.
>=20
> Thanks,
>=20
> Paolo
>=20

