Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DBC54670
	for <virtio-comment@lists.linux.dev>; Wed, 25 Dec 2024 06:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735108127; cv=fail; b=aW8yXWaD9ZxxsRKwJZio6ItkfqCOQ3XbfIzgnZm85Ay/2weMHhW+4BrMUXme9CkgL2D9Rwpgd5tRkANzUKXuVe6sXyO3F1iyKezaKZsXeFzECH3x/YfZpdj+JZ0QXEHN+GQTP2dEpPyNF2LaAswFLR3eTOLlF1/x8anhVabe+DA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735108127; c=relaxed/simple;
	bh=VXjOVbnzW5bha4oXfHRN7gvmsGOxhGV9qpF8+KCKHLQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RN+8g83rFQyHPydTaUuEQoI/nvjhfVq+0BE2/tYQxrEjufeG693cRMZz9nHG1QhkZ0H15Do3rxXbYkHGZSZJuwUtpKQdZlRmz8h3GTvsidPmHfXpBBx+XmHZQBeOPkOyMgxUZzx6MymwcSyMP3UG8CIOTlF9Hub9lew6JHPn8/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WNgLb4IB; arc=fail smtp.client-ip=40.107.93.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WNgLb4IB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dqp+DpNAm7awh7jF14sMSKUlBI4YLncRokpPVLQ8jt9gPGHdMfpx85+vpysKfjoF+VYruPnVgm7XvFHabfHVw/OLja8ehmqSJpGgXPuInrdRvcVrNh5keIqx2bGfUOrBy6eVOdb0BIjrujb2KX/Uhg5F9ew70dqcnBj2SoJtTz6ZCc3wbhdBD5t4wpn/tHKwt2zlw4Nm4d5AGi3Zt2R1OMHt36W5APjFIx3MBovi2TvfaZPbBKXYw01/ui0kCFCYg+PWVBycIQNgoBLL4dVN+6wdgjuw7a3PW9xaaVukB19MVRWUc0Dhjt6VXK2i8h6oCoHKPqTM5dMm+qrguH22hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXjOVbnzW5bha4oXfHRN7gvmsGOxhGV9qpF8+KCKHLQ=;
 b=d/P8wlMt6zjsiPkgfv2CnKk3CkH0Mf8XqII89fT3g2AYLTTLTgtINm3PjnXQwiM1pohJzHlFIYTJwmAeSauAhCS3kCdMYcGwB5Uo2VVQDOxoq4TmpirqtLlbO4HyRN03Z/byJTM9eS0LlFqTekNvkzHrTVc+961wB9eYvJbVu6f962SQkI5QBwWJ/5f5+rplsOHm8bIZWWlnGHfVUGa08Zmqon7jajrE8QV/E0y4GVaDhG8d4G/Lr+7c4SyyYcYMzBBB3H5HYi/Cil3xovMBdqTCMLrBYU+/5tkZVmMuCbD97OxAX3GyZ3u3O9o0uL3FAbR3yTG9yPHSgjAXguvMjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXjOVbnzW5bha4oXfHRN7gvmsGOxhGV9qpF8+KCKHLQ=;
 b=WNgLb4IBzPlMCmPBmyGp3tH0uIBGXO58Y5eypTMWqtI6tKZgrMwP3znibot1WT0mqD7Rn4fYOCVuVhqmlQpFNXSYppH7EAc3Mf1FK+5HdgUJBg2G0XV9JG4nqm2tJOwW/Rih+mYWyVwkdTdLq8caCDO6vG2EEEttM+DmzCpPDaMJbSack723iZ03OGCvvdU+frKlc8dH4NGcYykp8GVeJh37f1RvBYMNYH2knpHxOr7YPZ2swy5a3khyi34V0N2ynVl1qnu43kCa/AUZBSHjZdGIJOsP7KxrUN9EzYxLglj1/E0YqHJZEfjQWydRB+lt3VoNIPNC5lQEN6/c6VwTiw==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by SJ2PR12MB7894.namprd12.prod.outlook.com (2603:10b6:a03:4c6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Wed, 25 Dec
 2024 06:28:37 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%7]) with mapi id 15.20.8272.013; Wed, 25 Dec 2024
 06:28:37 +0000
From: Parav Pandit <parav@nvidia.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	"devel@daynix.com" <devel@daynix.com>
Subject: RE: [PATCH] virtio-net: Change num_buffers value
Thread-Topic: [PATCH] virtio-net: Change num_buffers value
Thread-Index: AQHbVpVXJB3eBmv4ZEexViKG9GakbbL2frMA
Date: Wed, 25 Dec 2024 06:28:37 +0000
Message-ID:
 <CY8PR12MB7195705CAFA8759355685905DC0C2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20241225-buffers-v1-1-712e839e8ad1@daynix.com>
In-Reply-To: <20241225-buffers-v1-1-712e839e8ad1@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|SJ2PR12MB7894:EE_
x-ms-office365-filtering-correlation-id: 9d85669d-319f-4812-8863-08dd24ad5d90
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YjQwUVVTOFc1L29haHl2VkNFRitZSWk1TU1HK051RTFTYlZoV0pyc09EVDQx?=
 =?utf-8?B?clRTYXBRNVFLNE9KNnphbGR6WUE3R0ZPTEpIWFFRWHdvRCs0VWlUekFrK00w?=
 =?utf-8?B?dUF3REFUVDBiZ3g4dFB6djdNVDVwTFovNlVuUTMwRGZpVkpyc3A1UGFMNDk1?=
 =?utf-8?B?NG9TdHdEWGJnWjgzcjhNY3k1Z282TUNwRlBYSkFSbmJxUGc3dWhQcElYNkd2?=
 =?utf-8?B?UzZNaHNua2l3N0lsb3F1YXpuV3dSNmdCT0l5bVorckFXenM0NVBsdTFnMlVu?=
 =?utf-8?B?ZWFGbGRFWGdVUlpmY1phdXVRR1d1YjVpN0N1eXBUb2VxZVRPOEw5UzF2WVZP?=
 =?utf-8?B?eWI4NlM4dGd2dW5Gb3Z6eU92NUJRNG5VMWJjWm5MUnNCTmhpMExiUnpKZm1l?=
 =?utf-8?B?RjZxT3VpUnFIWkNYYXJLMzRxY3NDTlZCU2JvOXJ2bWpKUWVabVgrTTBxKzRy?=
 =?utf-8?B?OWhFVWZkY2Q1Q2srVEtuMERlOWRNblorM3BtVUZDUGQ1QWlxTmMzQzZHZmRE?=
 =?utf-8?B?WHBaaHZ1bGMybjB4Mm1PV0I4SklOR0hVbTNGWUlYMjRwcDBRelFteVVrWkY1?=
 =?utf-8?B?VXRJY1RqMXYrMXV0SEgzZnM5Nk51eWlQaVJCcmNaZHdYQmd3cEZ1QVVYdXdX?=
 =?utf-8?B?RFYzcGpacVpWam8zL0lhZDhWS2R3ZVQ0Q0xhVFFTc012ajNLTHVMSVVKS0pT?=
 =?utf-8?B?VWcvSHliUURZUFFpdENiTGZqZHpkRllhbG1OUXNMMmx5ZkUweE1KZnAvdUE4?=
 =?utf-8?B?Nlo0b2pxbVVYMDJjbTZPdUFabCs3U2NURjc2SjhtaDk2ZUVjanh6WkhoYUxr?=
 =?utf-8?B?VGVKVHdmSmpDejlOalgyc3pDUkYxQXg0OVpxSmJ5WXBrWlpMdEcrT0tJeC9x?=
 =?utf-8?B?bmV6blVQZ0NDU1BPcGxTSUhlcmFhUHFZMXBWYzMyVkFxd1dsSnFpZzBQTjMy?=
 =?utf-8?B?dCszejVYVzFnWUxhREIrUWgyZWh3S0FCYUJYSFVrd3RzZnIvdldPUHhPa0Vt?=
 =?utf-8?B?OHoyek5xZHVxenNYK0hoUEhVVnZKdWZtQTAxaTFPQVRuQlZRR2Vad1pwZVpY?=
 =?utf-8?B?aEZhK0ZqZlZFVURCU2tvSVdtV0JFK1hibjVsWm93ZVBrdWFFRSs5Y01iTWFm?=
 =?utf-8?B?K2J5cXFYK2t5b2NYOXlPR1NBbVArTWlkK3NOdHFXaW5TazJsd1RyOWhhOHZP?=
 =?utf-8?B?cE5SaHZkQThTZ252Vm8xdURGWHBUOHFvaG1CWUV5VGlEM0ErbWRwRWNzRnRr?=
 =?utf-8?B?bk5HTFlrQTQyb2pIWklobnZkaEZzZnpSRGFXNCt0M0JNeSt5emxZMlpaclFZ?=
 =?utf-8?B?Wm1rMzZtRXlUR2NyS0dGUklFN3ZjN2tpbkVYS1dSMWkzTlJEVzJEaEltYnVz?=
 =?utf-8?B?aWx2d3BEY0Z4V0g5RmMvKzliaGNqQ253VEIwR05ISG42Q3RMN1dWMVlhNWNP?=
 =?utf-8?B?b2htbjNXc1BURkFyZGpDZHhxZGxjWktxUjFPZEFwRzVRNGlleHJ0ZVVMMGFn?=
 =?utf-8?B?QStLNVJRcTI0ZU9yNTZLejhPckloUW95aE5UNUdBOXlHS0Y2cEtUa29FbWdN?=
 =?utf-8?B?YjdxcGJtSUZVWlo2TWpkWlc2OEROWlNoZGI1aXM0a3BCMW9GNFdjRGl4Wm9x?=
 =?utf-8?B?QWtwUTl1Q3NEbjFKZkJDclQzbEU5cGtuM01VZ2VBUGtEMW94TGkrTlIySW1k?=
 =?utf-8?B?OWRnaDV1QmJmM0wvOWdzSnR1b3ZEQnFSWlRIc1Z6TzlaMU9DTFF0N3hWd3N1?=
 =?utf-8?B?ejVDTkNKZXJzMitDa2x4dk5zMGFDZWNQSFZidzZHREJqRFlFR0M1Tk1ONCsr?=
 =?utf-8?B?VFYrdzlmaG1oZUd6TE5adWhjTXVNamprQzl0MFVMaUI1RTRDS2g2ZnloNVYz?=
 =?utf-8?B?YUVoTEJzZE1CUkZXNGRjdXNsalE1ekNjeW1vR244MXB4cE16c1g3ZC9GUEx1?=
 =?utf-8?Q?NwFHAOc9/vqWHD7CpdBrlcNS2a2Oym9C?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d3Rib0g1RlFNR0RXNVFnSy82cXBCc201ZmlQS1p4SEEyV3ZwNklpa25Ybkla?=
 =?utf-8?B?WnZjOXhVV1RBV1ZvTjIrMTh3dnFkY2xtZUZoaWJXTjF6NFlLK1Q5QXpNSVdt?=
 =?utf-8?B?ZmtlMVB2aWJQNndrZ1ZCbjFHVDBUSHBnNlNLcFFNdXYySXFXbnVwcmxPZlpr?=
 =?utf-8?B?VlFQRzdMaGZsbkU1cHdXZjRsQllpWVFKSVNDN2JTdWh0K2RuUHArdlBkQld1?=
 =?utf-8?B?MGN4enVHWWN0MmFuUnplbTVrTXdJUlVvaTQvWVdsaysxMDAreDhZSllFQnNk?=
 =?utf-8?B?YWViSkh5OUlJanhyeTFTRWFnREJQTHI0OWgwYml3eUtiZ29UVUVyelFhT1FW?=
 =?utf-8?B?NXVZOXhhTFMvaXRpdmRCWEJFdXlBQVNETDQwU3FsWUROUWhHUGZITDMxMlBy?=
 =?utf-8?B?cFJjK2JicktuRC91aDcydjZCSDdsYVU5aW9nbkZ1cFNxQVRBR2wwSXdsVVBh?=
 =?utf-8?B?NDhod0trRkgxNG4wemZtWTBBSWZNWmJLMmRZa2JiZTl6ZjM4SE9ROGpxa0VO?=
 =?utf-8?B?S1JUL2FYS1FQTjhIbElpMWtOREkzV2p0S3pabEV4VWRsL3pIZFdKZmdNUVlt?=
 =?utf-8?B?YlkrVm83dzhOSG1vOXU5NWxqTTZaSGw3dzVkeTBHL2YyYklOSDVwdzFKV3Zw?=
 =?utf-8?B?bmg0cEVwcnQwbjBTb0RWOFhvSEl6QWFJVFVhS0JFQ25lRXUzMVNWY3BMUERy?=
 =?utf-8?B?R0JoR1hUeDFsSTBPcG1TQkhXcHR1dTBJdWM0Sk9DWUxwNHBOeURoMEsxYjJG?=
 =?utf-8?B?UHNkVVhuaUcvOTZGaGc0V2V6UW1OL1ByWjU0alIxQ09QYVpDSzY0a0dBQ1Fq?=
 =?utf-8?B?bGF0ZGZUdnJ2R3pMY25IMHArTFdFVWlaMVYxT1FDdldjT3ZyRUNMbVN4L1dP?=
 =?utf-8?B?NEc3TG41ZUg1Um82WFdDNnFJR0lpdmg1TW9scmpkVUxsdCtnb2c5NklaUUNj?=
 =?utf-8?B?bjNBL0JKZlFJb2laQmx5UzRGVlFzSWdkeFVjWm5KZGFlYzJqWlY1c3phUmxv?=
 =?utf-8?B?Um9PU3FYV0hVYm93bVhjSC8rR3hTUG90VmpneEtwUTlwc3N1bmRORnZnaXM0?=
 =?utf-8?B?NFlCZWd2cGluQ29JRXNnQVA3T2F5U2liWDl2TU4yL1loUnpQa0Z6Zno3Ty9i?=
 =?utf-8?B?VEtITW5ZZUxDSFp0bUZrRUg3bW1aeWJhNUkvelpLRVh3WDlmVC82VisrMHFn?=
 =?utf-8?B?NmdQUUhQQzRqa041RlZjbzBTSVJhd2YwVkx5ZVlDek1ldGtYOTJWUm1vQW92?=
 =?utf-8?B?RGNTSjFRME5NZWdIb2tvdm5GQ3U5Y0x3d1k2aDZIaWl1N3BHNVNNZGVaMXBB?=
 =?utf-8?B?eFFVdzZQV1NCdkliaTUwK1RYK0VIYjYvQk5Yc045UXdPZFZUTWM5UDRUY2x0?=
 =?utf-8?B?c2FMZmNBSHhpeituZ0owalFXQSt0SWZFN2RrUmc2MW9UQVlWUUQ5TjJ3b0JE?=
 =?utf-8?B?QUlPakdkQ29MalBZdGZmaTd1T0YrcTRZSE1jNksrbGhNak5VQ3ZZTlB2c1FY?=
 =?utf-8?B?VzhvVWIvT2FtUDZEYTlONHdUV3dadUNmOVM1dEZRalBxSGtCcWhDajVtOWN0?=
 =?utf-8?B?NnczdmpYY0N6bDI2Sll4c01lTXA4SnBVL0R5dE1MOUdJcGs4M2c1MkNBZndI?=
 =?utf-8?B?S2hZVkQ5bzR1cXZtY0NPdUJyUkJsT3hCQVRHYVVzODYyM1ZySjlpN3BHcFBp?=
 =?utf-8?B?TE5SOUFlL2wvZXF2V3Zxa0xGZ2h4VlZhUUVsNzNDZTg4Kzl2SEdKUUltdWNL?=
 =?utf-8?B?dCtERUdla0pidmlGVmoraW1XTlQ4MlpTdUZLeElyOUtJbFZ3cE9kcGYzVUM2?=
 =?utf-8?B?Y1hRUGMvcE03SG83aHRTK0VsdjIvWklEZFZiOGFNc2lJRytOWEw3cWQyeE1V?=
 =?utf-8?B?NnZieXRRMEZQUTBHeDROZVB2OERmdTJYbG00RVFDZXZWWXgvekNFVHZyb1J4?=
 =?utf-8?B?WmhiNUlQKzdOUHlBN2V4TjEvUUtBb1FMcDh3alJmbzYxdmtJcFc3cWlqdlJZ?=
 =?utf-8?B?cnI3VUh4V2d5OXdOVXV1WmlkbWJEbVM0RnNDQUdTSVBGS2ZJbmlyVlhEdnhs?=
 =?utf-8?B?UWFIU080b0Jnb2thSG1HOEVTZGdrZnIvV3FOcGFXOG15SmxNSTdrRnhZbFMv?=
 =?utf-8?Q?QmKI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7195.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d85669d-319f-4812-8863-08dd24ad5d90
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2024 06:28:37.3783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mx3ALQNvz6YguB5/NAGEpoQVkWEDqguWgTm//oKiws+tPPFkxNOZ11aPIWIiiKY4KeGpUULJ2D5d7oWLHA3P9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7894

DQo+IEZyb206IEFraWhpa28gT2Rha2kgPGFraWhpa28ub2Rha2lAZGF5bml4LmNvbT4NCj4gU2Vu
dDogV2VkbmVzZGF5LCBEZWNlbWJlciAyNSwgMjAyNCAxMTo1MiBBTQ0KPiANCj4gTGludXgncyB2
aG9zdF9uZXQgYW5kIFFFTVUgc2V0cyBudW1fYnVmZmVycyB0byB6ZXJvIHdoZW4NCj4gVklSVElP
X05FVF9GX01SR19SWEJVRiBpcyBub3QgbmVnb3RpYXRlZC4gQ2hhbmdlIHRoZSBzcGVjaWZpY2F0
aW9uIHRvDQo+IHJlZmxlY3QgdGhpcyByZWFsaXR5Lg0KPg0KUGxlYXNlIGZpeCB0aGUgdmhvc3Rf
bmV0IGFuZCBRRU1VIHRvIHJlZmxlY3QgdGhlIHNwZWNpZmljYXRpb24gd2hpY2ggY2xlYXJseSB3
cml0ZXMgbnVtX2J1ZmZlcnMgbXVzdCBiZSBzZXQgdG8gMS4NCih0aGUgbGFzdCBodW5rIG9mIHRo
aXMgcGF0Y2gpLg0KT25lIGNhbm5vdCBzdWRkZW5seSBjaGFuZ2Ugd2hhdCB3YXMgd3JpdHRlbiBp
biB0aGUgZGV2aWNlIHNwZWMgYXMgJ211c3QnIHJlcXVpcmVtZW50Lg0KDQo=
