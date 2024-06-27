Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3BBDDA0
	for <virtio-comment@lists.linux.dev>; Thu, 27 Jun 2024 04:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.148.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719462482; cv=fail; b=MglO3AlankCjVdgqisKrB7+w5x4OWuQ8pGTKmOAIFTnVDHuOuku8pJR5oYwnMfRtb6m0VQIMkspQRmxxXSeUlUK9ViwpXPobEoqji4djKZPj8ZVtWR293EU75M0slb68yWRu6JUp5RyzUu55oZm/i45Rd4OPaeI1cGF6SgBcRk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719462482; c=relaxed/simple;
	bh=XMcYhsCAbNfV3D835URQm6OrQz8ZeOIGECRqGNmGRuY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=Wi+qaZWyrsXY72Zb/Ab6OxUbHnSQ6IZxh7sBT8wYtj2NJfGxXuvuweXznvi32USyPzQ8myRQT2htOE9RFBrof7KdU3WwKlHcZAucUez4iQH2SEW8M2yNHGzap7Ldtk6XgJ4qRdKBq0FWAzb5rT3acIQtAnidwxLVufp6lIXrR20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=fail (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=tiHrtGbV reason="signature verification failed"; arc=fail smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="tiHrtGbV"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45R2voXx001308;
	Wed, 26 Jun 2024 21:27:54 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2173.outbound.protection.outlook.com [104.47.73.173])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 400yrt07r6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 21:27:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=moQ/ZnUc9BcFLWKUUnrWcz6/0l+7pFpZ/ye8bnSgAFyN6/Z+3+mnrIFNMCyQYJYftv8vaFukNeBrfoXuhaz59OJGyCSjk/PmBLjGyzc/QbnXh/bhHxqbuZLg7g79dz0RKrR3DSBf85IflTvowb9kiZsriX1yx9hRTyAKb1M9egGdwgErmv11hWYScANbiPIhOGv9FoZLnPxs/upqYupaPxck9iFCqHBK1KHxK7eyhovO9pK6pTsXt4NM9cugqMukYIDhyVttzyz5Y5QDLJD6R2IW0DqWa7cE4qv8LqFaVJt/EmggHCGYrxLyRUavGZJfhKIui5SIheX6yk8rbgLNRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rp9FLg/yJpOMdP0AGoFUlZJyrhy95XN8w11MJQbvtVk=;
 b=eYypEzLXDzOnwThyl2eu7bJ2tPXlXw0HozlAqGH4WbBveSWdQr5iiRAOf7L6M/9ol5C2C3fWbBEVshqwbagRUaxVdfZJKDa4SDu8kWq/edBLFRNGBlb5+RSXElTZFME2eISBpDHexdtCUTFNn6jrPvUX8MwKpLfQ+h4T4c5+hTJJrjAXfRqEFeYeJEOjjcYIqHR3amBfSfvnejKTlAhSgsjVn+WD0+SElvGmu8UVJuKgTWGuPVT6lxkS0t/gFHZ3A9ysMF3zSc7d1EF8F0j5WHvRP7myh3D6257w7pL0sDrxkRSZp6W4b2WAoEzpRrii7u8c1KUZLoTTrP+ws7BOTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rp9FLg/yJpOMdP0AGoFUlZJyrhy95XN8w11MJQbvtVk=;
 b=tiHrtGbVsRIuxI9FY/H52KWZOPF6iGbF/CArCtZe/DMa/vnn6MDJoIRwTXM8OwKLviXCP16J2/oFhiktR+6Ey30CaAb/I0489KGaHw51q8LctSRvCfCbYyZ/0AxjvTrtELEwrV2YmOybt8mQnzhiGgMocPF8Us9bRKrWHNlzEQU=
Received: from MW4PR18MB5244.namprd18.prod.outlook.com (2603:10b6:303:1e0::16)
 by DS1PR18MB6171.namprd18.prod.outlook.com (2603:10b6:8:1de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 04:27:52 +0000
Received: from MW4PR18MB5244.namprd18.prod.outlook.com
 ([fe80::52f3:9792:ee42:90b]) by MW4PR18MB5244.namprd18.prod.outlook.com
 ([fe80::52f3:9792:ee42:90b%7]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 04:27:52 +0000
From: Vamsi Krishna Attunuru <vattunuru@marvell.com>
To: Lege Wang <lege.wang@jaguarmicro.com>
CC: Nithin Kumar Dabilpuram <ndabilpuram@marvell.com>,
        "parav@nvidia.com"
	<parav@nvidia.com>,
        "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>,
        "mst@redhat.com" <mst@redhat.com>
Subject: RE: [virtio-comment] [RFC PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE:
 add new used buffer notification suppression mechanism
Thread-Topic: [virtio-comment] [RFC PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE:
 add new used buffer notification suppression mechanism
Thread-Index: AQHaxdgktlk0oWLtQUuFLA9WWblwr7HbBmVQ
Date: Thu, 27 Jun 2024 04:27:52 +0000
Message-ID: 
 <MW4PR18MB5244E1E159FE2B4251499EFAA6D72@MW4PR18MB5244.namprd18.prod.outlook.com>
References: 
 <MW4PR18MB52444DD0504F7110D4A580ECA6C82@MW4PR18MB5244.namprd18.prod.outlook.com>
 <SI2PR06MB5385B62E9EB693F64A3FB613FFD42@SI2PR06MB5385.apcprd06.prod.outlook.com>
In-Reply-To: 
 <SI2PR06MB5385B62E9EB693F64A3FB613FFD42@SI2PR06MB5385.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR18MB5244:EE_|DS1PR18MB6171:EE_
x-ms-office365-filtering-correlation-id: cf5d4ec6-29db-4412-6363-08dc9661825f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?dTFUWnFNTUNxazdiZXRreU9uZkp0NURGN1BML3doRVc5Kzg0MmRTMUhRbm5n?=
 =?utf-8?B?bGtkVElIb2VrTzFwbm9EQnpRZ3hYeVRUaG1uZ29XTlNZOENxUnFlL3F6MUl2?=
 =?utf-8?B?akN6aVVOU0JEblRKYkRzaGRDNnB2TjhTS1hmcFlZcjM1Sk9mSVBHVllqOFNV?=
 =?utf-8?B?andWOTNWUFBwKzZzSnZNYnk5UGxkL0Y0VDRZN2lMTmt2OHBhdnZkc3l4Zy9y?=
 =?utf-8?B?TEdUTjRmU1ZITmhoNkhOa3Q2RFZTeFQ4V2pmOVZmbTloRzhZWExxYWJVSE50?=
 =?utf-8?B?YmIzM0grT2dEMlhKeFlhMFFvRGFDM29RSVJtVnpTdjJ0YXJROU0rT2ZOTHp1?=
 =?utf-8?B?Yk96TkoyNmlsdkdPUXhUalRqU3pYd3FVaXQwQ1ZML016ZDBLdndla2lmbUgz?=
 =?utf-8?B?cnM0Q29OaGt4VDhoYlNXWStCZ3MzRmtUaW5YSmhQUW9QYWgwd3NSa2ZYdFUr?=
 =?utf-8?B?VXYrcitSQ1NVQklrNVY4b0VvdksyOVNiaktnNmdnbjF6aTdzRmozUUp0OG45?=
 =?utf-8?B?U2l2UUk3MXM0OXRmSEFibDltVjlCMzFmaDhOdTliTlhtMTVzR0hyZlkrdW84?=
 =?utf-8?B?QldzZlF0cHBUaHpBN3J6TURhZHF2TEFzS3pJVThKOXlUT3JOUVZEZm1DRkNv?=
 =?utf-8?B?QXdOVUhXMlJQdnZhTkVUby9KNy91TE1obVQwM3hoSTF0UzJ6UjAzRTJGZ2xu?=
 =?utf-8?B?RUwyQkxDbFhpbDZyU0MrR2g3TSsxeGo2VGIveC8yNkpyODlOMEoyTXBmSW1z?=
 =?utf-8?B?WGpPdzUrNW9FcHhuZmRtR3RGR2sralNQb0FRa3FCdCt6ZkZWQ2FXU28rNmd6?=
 =?utf-8?B?UnJvaE9Ydkt6eUd0ay9kNk52NHdhdjN5cHRiY05LUUZWanJxY00rRmtsSlBk?=
 =?utf-8?B?QXcvOGl6b25WUHVsa0pYNytiOGRsQVpmYWw0N0xGVkxmWWNBTmw2ay8zNXAx?=
 =?utf-8?B?dkNjVi9LYVpNY0dhdnZEYTNMSkEzdXhUYzd5ZWtXT2pQaFRMTWxyZi9ialZW?=
 =?utf-8?B?S3IxSzJSeFpiWHVPN2hmeHNRNXZxRktxdVoyMC84OGhXVGxLRXRqN0g4OTdD?=
 =?utf-8?B?NnJ4T2pnQTlLdFJHNlYvc0EzVDVhVHZ1TytwNy93cytEMnhEMm5aVno1a0kz?=
 =?utf-8?B?dzhBT3RtTEZkTnEyZndqY2JINFdCR29md2c2UEkvdVQ3VHdiL3JMTG1waWIv?=
 =?utf-8?B?eGhYOHZqTEVNcjdXc2hOZ0J3M3hoQ3pvd3hwdWthc3N2RENpU3Z3S1JrZFlG?=
 =?utf-8?B?ZGc0UUpNNTBQOVlEOTJuYWhLczZMOFZ3UDFjZGxwUkkva2hXZEpKQ09mNmJo?=
 =?utf-8?B?YXV5bnJVekVTaFhEU3N6VnZPZEZoMFBTRTUraDJMRk5HQ2thS3ZlNTBJVVJ3?=
 =?utf-8?B?ZnFGREwzbno2bGh6OXB0QXExZWJlVVBRbWxTbTkvQTJJUUk5T1k3SzZ2bVF1?=
 =?utf-8?B?dFhiWlJoaTkxektSeG9jQitNbFU3ZU5OcEZaQ0Q1eVZhQzJWb1NSNUNxMFFj?=
 =?utf-8?B?SU1qNjRFNHd4TWJiNW9IYUUyVTJHVkJCaUlzK2xsQkZ0Tk5ucmVjMVBEcXlz?=
 =?utf-8?B?OHFxUFlQRVJhNGJvaDc2dFA3UlJIREtGRmFtRStLSnR6dEdTZjZHTnlTMzZo?=
 =?utf-8?B?ZHpMTWVaZk1lelJ5NDNDaUx2WHpPbzZxVUhPYzVIaERwbTNrUEQzKy9JRHpn?=
 =?utf-8?B?K0FlWElqZ0pFZjRKcDI0aTFNVmFFMFJoUDVJT0NOaGw2T0U4WjRwQnhFbVl3?=
 =?utf-8?B?RGZBTU1kYkpiT3BnNk9hWHRJbm84bFJKZFlSYkM4NGN6M1hNbWhaWm5kYzZy?=
 =?utf-8?B?S0xIRnNrQU1LVGZ4RUtDaDdSQ3NoVVJ6eUhOWGNHM0NGdzRyME50YzJwRVJC?=
 =?utf-8?B?ZUJpYVlvcFZZQTJUZVRGbytJSHdGTFluRmkvajl3bS9nZFE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR18MB5244.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bU1IUndGcjc4YWlPN1RzR0Fpemx5elNyTWpEVURvZDI3TzcwYTAvRXJwVVFS?=
 =?utf-8?B?NlNKaFdqdCtaMHNBRkpTcU9CeXl5cUduYnB5RG5xUDlHWnVDYWdzMUJHNVNU?=
 =?utf-8?B?ZUlxQzBPa0tNMlZqRU8yVW5QcW1HZXB6M3RuM1pESHdnNHNkUFMvTG41VHRH?=
 =?utf-8?B?UTZ6NmdkRlRLVkRoWWN2ZTZ3cXRSandQQkp5bGc2aGE2MllTUzJ2ZkNtcGRT?=
 =?utf-8?B?amgvdUNRcVVqeXRjQ0NTbURLYzZLRzJUVWlKcDNGUkt6MzhrRWhKQVcvQjZK?=
 =?utf-8?B?MFRha1Fmc2o4d3F1ZXB6c3NPQmpCb0twZkYyUXh6T3BtellHM2VGMDBoZlVt?=
 =?utf-8?B?NlZGUkd5NllTVmNtVitYQ01CZDFmdy9sVmdJWFBiWHJUQ3AydU5PMmxKSUsv?=
 =?utf-8?B?TkN0Y2pUYTFDSlZEUXBXU1BUMXd4WmdZRzhTZTdMVi9zOGI4ekY2ZEFHUmV4?=
 =?utf-8?B?YUpOb0ZTajQ2MnNTaWliNC9MYXVZZFBGNXBJZEMvTnlyL2FnVU9ZNTc3VEFv?=
 =?utf-8?B?eDVnL3VyRWtHaFl5Mnd6eDA2dXczelpiSHUxcFdpNzgwSHZWWm8vemViQ3lV?=
 =?utf-8?B?elNZYk5FYTg1VXBMTFdDekZLZGk5UWpxQy9KSXp5N2FuWHJrMkl6RW5pRDd1?=
 =?utf-8?B?NXRmNDdsZHE3Zzc1cE1xZDRIS0NDZlVCaGZVQUhwa0FXMUNjN1pPRFJQYVNW?=
 =?utf-8?B?SnVvQ0xPa2ViNHhUaEo5R3BNc0IxSVBVN3FwTzZyUDlCcjlTYno0SWN2OWx1?=
 =?utf-8?B?RDZiZmg4VTI2YVd1cDZHRzVBQkFKMkxtcjhSY09rTHRIemZrVjVsem1YMWhO?=
 =?utf-8?B?QVhxTDQ0Y1V4b0xGVmhYeTdDU3k5dEhadFc1QUtCMERzVGlETjRnMG1JQ2VG?=
 =?utf-8?B?VSsvaDE0eWZyQ3M1aGkzUlZJeVE4NkhiUFZVOW8rNElpN3lHeGwzWGlYU3J5?=
 =?utf-8?B?TnhrY3hWS29iS1JVYjlwN3hjbkwrbmhTZ2U3ZHNVUFp4NTZpaW5tZVdBcm41?=
 =?utf-8?B?aFQ5WnJJekRxSUJWeHVrL0dkZ01wVkJzMnpxQU5RNDY5aGV4RVJlYnJ3Wk1V?=
 =?utf-8?B?bCttRENDNWxvTGp1S0JORGZodTZ4Mzd4VGNnVDhaRC9LZ0ozamtQQzZPQU1o?=
 =?utf-8?B?Q0J3Zkw3c2kxWnJtZ0Z1N3FoUnlWTVpFL0krMEJYM2sxbjVkdXNMWFA1OG1x?=
 =?utf-8?B?TjNWVE4vckdOQ1MrM1JESTM5MUlQTWJvNlQwaUtVQjl3emJveVVqSFdqTjFl?=
 =?utf-8?B?cFdyTzlGNEVySERra0VFTEd1S2VZM0ZvWFVyWVhnOGZsVXRnZVVqNmhmMk9N?=
 =?utf-8?B?OTMxbGNSZVdxaHZSOVcxV0RpQzRnWEc0eWs4Q2ZtSG8zVGZ0T0IrQktkbkll?=
 =?utf-8?B?eWx4aVQrRlVFZDZkTTVwN09RcWNDMm9iMHd3Q1Z5dVlMMXVMVHoxc0U5WFVr?=
 =?utf-8?B?TGJmRmY0aU93OHg1SnJhMVdPL05WZkZMK0JpSU1iU3RMYXVjZVFZTm5zcm5l?=
 =?utf-8?B?SytlMmNRZzliZXN1S3gzM1RzYlFHY1Y5RWN3WmhYSmlnZUlyRzFYZ0FCalpI?=
 =?utf-8?B?bGp4ejBzaWJuS1FOdURhTEhZRnQ0UlphTHhzbVVpNjF4a2crWXBBVnNNV3ND?=
 =?utf-8?B?RmZ5U3ZjVXdTbmI1VWQ4YU9WalI2aVlBeXpRc1hmNW5YSDhBYkxSZ1UvdDlP?=
 =?utf-8?B?aWphVzBIdzBiK21DSE1lU2h5allhL0dMR0pIbm8xaGJIc3NFZHl1WHAyaFpT?=
 =?utf-8?B?bGFwL0MrUkliamRJYzMrUWVBQksrTmxpSmtrZG1XM1YvY3BqTkZ1VXZvUmNk?=
 =?utf-8?B?SndpT3B0dUNac1ltcVo5Y1ZDOE5EU1h2RmNVaDBpMkRUZjBsSGl2SnN4ZldI?=
 =?utf-8?B?QkxUWCtQWkFSOTNuTk1xMm0yQ0lqR3dzWWl1WnMzR2NWMXpJZ0tJTjI1bU41?=
 =?utf-8?B?S3poYW8zdmtGdzkyOGFyRnNmTGU2UnFoaUNuMGdFV3dqbkk3QnZ2d2JyT05K?=
 =?utf-8?B?WGhVSlZiWXNuMUJkSktZNS9DVndzL2lRRzFINEQ1VUNVeS9WMm5BNm1TMysx?=
 =?utf-8?B?WGVNRjdHcHlsRHhTbUlCTXpBNkZjaXE1cHhkMUp6U0x6Y3lHUFJFQmhkdWdi?=
 =?utf-8?Q?z2RZQTA7bqNKLhUV8dXGnBBIq?=
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR18MB5244.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf5d4ec6-29db-4412-6363-08dc9661825f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2024 04:27:52.2780
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YxjMg9JJahThW13dunMnMpFAzya76Ak9u6oAR6lJx+UJSZWevue6nUAMFgfq6+kjfFEOQqn0kJ5TpXqD2FgELw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR18MB6171
X-Proofpoint-GUID: AlbZOHOhHKSHl_5ATtEsYii5F4y_KHf0
X-Proofpoint-ORIG-GUID: AlbZOHOhHKSHl_5ATtEsYii5F4y_KHf0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_17,2024-06-25_01,2024-05-17_01



>-----Original Message-----
>From: Lege Wang <lege.wang@jaguarmicro.com>
>Sent: Monday, June 24, 2024 7:15 AM
>To: Vamsi Krishna Attunuru <vattunuru@marvell.com>
>Cc: Nithin Kumar Dabilpuram <ndabilpuram@marvell.com>;
>parav@nvidia.com; virtio-comment@lists.linux.dev; mst@redhat.com
>Subject: [EXTERNAL] RE: [virtio-comment] [RFC PATCH]
>VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer notification
>suppression mechanism
>
>Hi, > > > > Reposting to the new mailing list > > Hi Lege.=E2=80=8Awang, >=
 > Thank you
>for proposing this new feature. This capability is very much useful > with=
 PCI
>transport on newer hardware. > > May I know the current
>
>Hi,
>
>>
>>
>>
>> Reposting to the new mailing list
>>
>> Hi Lege.wang,
>>
>> Thank you for proposing this new feature. This capability is very much
>> useful with PCI transport on newer hardware.
>>
>> May I know the current status of this proposal, is V1 already planned
>> and prepared for the review.?, I would like to collaborate on refining
>> the proposal and the required changes in the spec.
>Indeed I prepared a V1 patch at the beginning of 2024/3, but the virtio-
>comment mail list seems broken since then, I could not get the right mail =
list
>and was busy with other work later.
>Thanks for your interests, I'll rebase a V1 patch today and send for your
>review.

Thanks Wang, I am hoping that you are preparing V1 for review.

Regards
Vamsi

>
>Regards,
>Xiaoguang Wang
>
>
>>
>> Regards
>> Vamsi
