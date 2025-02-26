Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2084.outbound.protection.outlook.com [40.107.212.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D27C18BBAE
	for <virtio-comment@lists.linux.dev>; Wed, 26 Feb 2025 02:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740536797; cv=fail; b=CbJBFQJ2k1n5NWeZCGY2JqbfoPYtPsmMa/VPusJfn808+AkxpjUN4STJG2/4UPe2VutRWzcDItH5djRJpyw1P/b7pI/Pym/GaEQKpgLfr7FQBf501/k2Zr/P3RlMOv91zpTs4s3HR08SF3H2xHiz8t3yQZT+JvmR8PGvE5hLeDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740536797; c=relaxed/simple;
	bh=F9DOVniqtGLkMMAAGxBDLLP4TvOXQJfYhnGcoSuaHpY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qYA+t95KZq8+MVjJ5ZWBq50PTxtK5i6Gi+ZiHxutBEZ8hQv1OQEMXMaGkX5KP3oazJ8hadTZqlF3ulGnQgYxAthXp/QVg9t/Y5EH+1A8uZRvMntNVUXvW5xaUyt0+io0mLQxGgcEzgpGwcDMdsRuUG731HvvhIGJK430tXunFyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=B5HF/1xL; arc=fail smtp.client-ip=40.107.212.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="B5HF/1xL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TnB5Nk84xaurfjhJw4EonwG3y4sJSkSXy5aS+UQjwgqLj/Xc3iSvw6ilQ3x1GcvLrdGki5kAJPuIXJGMTH1skKLuoDfwbnW2rIEW/u6j5j6J8Qu3f2YPtkfCCZoA2YBXUgRw2n+AYs8sDsRr8bSOZTU+zbijj0IpW0Tern3QnkvlXbBa6+R+PkNBLKzHDdmXqzF5wFwA/zlyiwoirD13Os0w5ABJF+kUsHkhI9frdJI1kXtNVDgLpbRK/DWq/UnNUjxAFNZ0oS97WGQvU823QPbs3qPrCB6rdDKzCeZxVRRf8lETUkl9gFnOhorEgw12OkHgPhtXSheE63Owm21fXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9DOVniqtGLkMMAAGxBDLLP4TvOXQJfYhnGcoSuaHpY=;
 b=DzJN/IbvQIAflfuK54ztbmT7fC+WwddctmvObyc/A9kSIWz1NlQjkBeJZv74zZyhWgXcjq7lq99YWkQH6FyVF0LutQb82Mx65WrJb9Ch68KyyFpf9zeAsOdVpZet5EYv7Z3qjGMOM0MqXVAaz68tVhYIazKrGdvcH1qr8iWNc9ZmZVohvaqdohMnvmG9XjQ5maWAQRy6eKhXo6XcM8mTWAA1eF1uoqkZHJZ0J7yRpLGxmLz5mL652CH0+4rEX+/6uH3W2Ze3VeBr6YG2lewCjHMBGVzvZ/hul2yosJB+jaEDrOUd8AX1DtA0FVahb9GCHcCZ7mOcL8gcYhs5kHq+Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9DOVniqtGLkMMAAGxBDLLP4TvOXQJfYhnGcoSuaHpY=;
 b=B5HF/1xLAc9Web87sxpFiq4l2KfXADYdm6wNPsnCcF56ZK0PDhKTjPPUO7SFrRk6n6FBezwH5ekZ7V3JgY7yVeEugQCOnzYpqgH/0D5oHV7xpYqZcT+nruc7mLPpJVlVz69iXgBL05bMXMb0b9gOaTBcHHUE7ZNQ4szxgGSk7bA=
Received: from IA1PR12MB6532.namprd12.prod.outlook.com (2603:10b6:208:3a3::12)
 by SA1PR12MB7104.namprd12.prod.outlook.com (2603:10b6:806:29e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 02:26:32 +0000
Received: from IA1PR12MB6532.namprd12.prod.outlook.com
 ([fe80::dc05:a63a:39fa:ff0b]) by IA1PR12MB6532.namprd12.prod.outlook.com
 ([fe80::dc05:a63a:39fa:ff0b%7]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 02:26:32 +0000
From: "Zhang, Julia" <Julia.Zhang@amd.com>
To: "Michael S . Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>, "Zhu, Lingshan" <Lingshan.Zhu@amd.com>, Matias
 Ezequiel Vara Larsen <mvaralar@redhat.com>, "Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH] virtio-gpu: get p2pdma distance
Thread-Topic: [PATCH] virtio-gpu: get p2pdma distance
Thread-Index: AQHbZm3XXTToiiiJ+Uysz720Z0iEzbMhTNOAgDhW3gA=
Date: Wed, 26 Feb 2025 02:26:32 +0000
Message-ID:
 <IA1PR12MB6532FC13BDCAF1D2E0D336E0F2C22@IA1PR12MB6532.namprd12.prod.outlook.com>
References: <20250114101612.88304-1-julia.zhang@amd.com>
 <Z4+og7rL0h5JGYCd@fedora>
In-Reply-To: <Z4+og7rL0h5JGYCd@fedora>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: IA1PR12MB6532.namprd12.prod.outlook.com
 (15.20.8466.015)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB6532:EE_|SA1PR12MB7104:EE_
x-ms-office365-filtering-correlation-id: 4e041849-cac1-4506-a038-08dd560cfc27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eGJkei9pREorZHRKMWhXdVNkVkhkWGFmYzU4RG8vdnZlY3RhV3FBbmVTNGtI?=
 =?utf-8?B?U2VSLzl1aXdVNUsxRTFrWFZWMHJFZXkwSlQ0cmFRMk5CNlZUUWYwYTVPZkgy?=
 =?utf-8?B?Znl5djJxaE5YemdXMEVRbVFwUFZrd1JHbmVuTVAvTkN1bUZIalN5bWZOZEQ4?=
 =?utf-8?B?aDJDVldTT1luWDVnT0tFRHd4azJZekxVRFZlcy9nOUNTT2NneGtJek5yeUVK?=
 =?utf-8?B?eHZxY0ZIQng3Q0VpL1R0VC9yZ3AvSmFvQkhJSUZ6bTU4aE5LdDFxNjFmalpZ?=
 =?utf-8?B?cFFrUWd2ZElhbk5ab0toNGRGZEFnSnRyR1o2VGdDb05sUDdVN2FraUZVVzdB?=
 =?utf-8?B?ckY4bkV4Tk05YisvcmpZU0pLYnMwUmRQN3JBMFkxb2FYcnVLRkJESWpScjRR?=
 =?utf-8?B?NlBTaWtQYzA3SS8wQ3h3SkFVMXJFTTN6aHFvZkwvRzRRQ0xUUTRTZ0J2cVR6?=
 =?utf-8?B?TmNCUTVnQy9jK3VXblpKUzVOSDZUdjZuNFgyRVhQMDYxdVFQLzRFNXBQUTFm?=
 =?utf-8?B?Q1dSbzRDUVJSbHF4TTI1NFduNWhlL21FUkt4a1VvcDRXNjRLY2Y0ZjlJWWFu?=
 =?utf-8?B?VU03M0dpUmdFSU1tWWg3VS9MMGpVVy9rcDJ0OVQ1aTJSQW5MWHJDaDZXbGpJ?=
 =?utf-8?B?YnpyOEY3ODh4VkZPREFXNzNSVVJEVzFhMVRYTE1OZEVYREVkd1BkTDkrNVUw?=
 =?utf-8?B?dFBJdTZRcG03VFlpODlSdkdHMmVKZDNONHV3NktvMWh2Kyt1SWxSZ2xhaWNz?=
 =?utf-8?B?SlZ4UUVleU02WjJtMzBlZU5lOEtCbkFZU1FlZFdlbXg5QTdrNUo0bStsbUt3?=
 =?utf-8?B?c0lhMmFhVXk0WHZTb0hCajhmb3RtVWl3Y1loWW8vTWhHTFVEN1JSN3U1OUdI?=
 =?utf-8?B?c0Y1K2JjYVdrajFvQWgvZE1kbi9BMzJqMnh4TWRGbFVFYTFwUENxTmtkVnpD?=
 =?utf-8?B?UUVjdFhZZ2VrbGl3bkdmWjBuZEJSWVRYd08xL0FrQlJSQjh5R0lMdGJkSGhE?=
 =?utf-8?B?UHlzZDJLcFB5eVZzblh4ZEZBbVd5SC90b2lFb3FKMmFCL1ZWZUIvc2Y3NjZX?=
 =?utf-8?B?U0IyMVFSMU1xSG1OWlF2Q3BJSnUrSHJQQ2Q2cHBIU1JaRUtkY2tKZi81b0Rn?=
 =?utf-8?B?U1gxR1BzSG5NZnMxdUpuNFBnYzJXTHBObllkOXE3ZklxSGdwRmRQUnZIYTl0?=
 =?utf-8?B?K1VmS2VVeWc3ektQclRWdVJveDJSMmxXRUFVS0Qxc0xVZTZaVWhCcWszV1kv?=
 =?utf-8?B?OEd3eGJaQkN2bDl4cGRJVmF4dnFNMTdaUW91T245MTFxc3A3UTFXUndHWG9p?=
 =?utf-8?B?eFozNEtQcmd4ZmNvSE5KNTdOUjhDWGZEY3k5Ri9YS3BWcjJxMGMvR1ErTGN1?=
 =?utf-8?B?aUhPZm1tTVNZVVBGcmtUQUxBaWRWMGorMmpldHMzU1Nma09QbnZhWjZQOTlS?=
 =?utf-8?B?V3RUZjdSR1lhcGtCclhmbmpQR2owRHFxNDJQUzk2LzJvNEhCSVk0enF2cHdG?=
 =?utf-8?B?bFVHNU9ERUtSVk9mNVBIVFo1YTFsbXh3OEd2dkN3eXRsSkVJaVBqU3p5ZTRB?=
 =?utf-8?B?SFlld1Z2Ym5WbHkvc2U5TEI3V2EzNmQ1MkU0NmxGNldrdjY3a3dFYVpLNmtu?=
 =?utf-8?B?UkRmeFM2ZDBsVVptdWVQZ2NiZjFVS3pLaUlLa2wyTXVKUkNxN0NMdkI2cmZR?=
 =?utf-8?B?Z0pMc0FpK3dsb3FkUWlEVG9GSGVoZitrOXNVdzdNbXZNR2QyZDU3RDd6aW1j?=
 =?utf-8?B?VjJ3dXc5czlSa3hab2x6NlhoeGlVNHowaDFoaVFEcXJ5ZFZiaWtFc2VVUHow?=
 =?utf-8?B?bFFNeDcxLzFUUndITGhiZ0NVTFhNekE1NHZkYzN1VEdhWlJXd3FKWXVMd1hr?=
 =?utf-8?B?c3l3Wk9leHhBQ3hPNUkvdVd6SEh0Z0FobmJqdlNwSER2M3VSem1seVdLeUwz?=
 =?utf-8?Q?nyyBmQtHP0GBXT71xKI5nlHpZwxnWSzB?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6532.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cjNqeE5sSDJDWjVpTEIyVXl6T21BVTJxVUNPRlRVbm94U2wvK1BYRFFLU24x?=
 =?utf-8?B?RW5QL1F6YUN0OWlNcitYZUZHcmFxOTdiWTFvQi9YTTZCM3BHdmtrTlJLSytF?=
 =?utf-8?B?RnY4WVlpMFFoK21JZkVjck9KUTdJRjBsS2xWWUtkNERmaUI1VUNxWWN6cjh1?=
 =?utf-8?B?dzhBTm0xc1B3NCsxanN1RlpRVkZ5YnNETXcvVENueUp2dU1zQVFvNnk1Tm5D?=
 =?utf-8?B?QTdzRjJrSEQxYkRqc0U0ankrUXNWcUJlM0FJOWhreHZsREdhemRBK0o4dU56?=
 =?utf-8?B?cW16ZVhRWU5jMDhxc0NrT084UENENWpnSUs5aXBRZVo4ZTBvZWtqRDJvTWJi?=
 =?utf-8?B?anp3aityam4zcEI1WkkzK0xiNUM5aXFZUjlqL0ozeU80QWt6enJaRUZqcnZE?=
 =?utf-8?B?allaRjdkQTBPZU9pS0k1dUNNOUNVeEFRb3ArRmQ3aWwwWmZJbEhTcDBETDBo?=
 =?utf-8?B?TGgwb1NsMjdWdTdkbVNseHJUZnZzbGZiclBNSGFOZVRaZFEzcXVSN3ZCdEdP?=
 =?utf-8?B?VzJkQlA2cEI2UGVHUHg0K21qSE5JemprNG5lOFRaZHB6WVh2aEptQlRyNmV1?=
 =?utf-8?B?T1EyOG9nZ1hHNzZCK2xCZ1djMm5JQVg1OHJQMVprTVFsbzlndWp6b1J0eCt1?=
 =?utf-8?B?RnlZaG4xakQwQ2tQZ1VETm9LMFJBNm4vUGxxZlFkWlBRTVZ4bzlTdmI5bXVm?=
 =?utf-8?B?azRkMmFocFNISVgxK3pUdmZVMmdCSTN3YzNENkdheWEvZHA5b2swQmxjRzU4?=
 =?utf-8?B?dnRjclFIaGF3N29BbytIWHBDcmROdHE1NWw1b2JSMHhXSmxUbFlYWDdrVTVD?=
 =?utf-8?B?MndDaWFxbzVBOStjdFVQN1JOY2Z3TGt4UW1wZHdHbUcwMU90Y0ozWG5tTUlk?=
 =?utf-8?B?dkRHWnlPK05EaDIzUHJmVm9LVzhkZ1VOUkthYndlZDJzb2syU0VPOGhsNmEz?=
 =?utf-8?B?MmhRVDZTVGdzYWovcit5Q29uOGdwUWFvSUd4ZlZsRGVsaEMvVVpTaXVtOFVa?=
 =?utf-8?B?ZXZmSW9LWkVrRFNsRVJKd0FyaGpzNGJSR2VDL2xwMnpSaHRxRWllUW9WelNS?=
 =?utf-8?B?MEJQVUdoZE15TjFGSmtJVTdmMFJ5cSsxRTlTalZFTFBBb0tOWVFhYTNXVCtw?=
 =?utf-8?B?MTlqNjhVMEVlL0QzRlpTMHVHeTl1eWVFdWxFMW1WaFp6T2dSS1J5SDkyQWNZ?=
 =?utf-8?B?RHpVVExmMHE1MnloSGhYSTN0bGlxSlRwQTdnWGJhWkswYXk5Y2dxa21hM3Fx?=
 =?utf-8?B?dUpVZjVaYys3MS9leFliaVRwUzZXRzVySWZna1ljQ00xVGhTUkVvTkozbG9w?=
 =?utf-8?B?R0MraVZTenIwdkRnTnhQSEljeTEzdFE1RzZOdis4UDV0WFpHTm1QMnJ0L3RO?=
 =?utf-8?B?Tmg3aFVjYXR4d1dObHRlOHozQU92Q3llMHQ5NzZnaW1hNkJ3bGY1SUZqb3Ri?=
 =?utf-8?B?a3BGR1JLYkJmZmhZM2hyNkxlb2M2c3JhQktDNFE3L1VYaStqQWxVcE1TWnJw?=
 =?utf-8?B?Y1BiVTgvdzM5dXozV01RWGhBSmlhRVZmd1hxbEZ0aW5DVTVydEZLQXRQSmQw?=
 =?utf-8?B?Y2hNNnM3bVFwRndPSUt4V2ppTFB2Q2JpTGl5Y2lnc3A1dXkwTEw1L2piM1M4?=
 =?utf-8?B?L0tMUmRxM0JmNXRpTGwzcDUrWXJjWW9kVTVrMkFNakJxbndnVnZMaCsxajJj?=
 =?utf-8?B?a2tySWF1N2gzRjM4M3lnbWFTd2ZjTGhsaVN3QnlYSkRhRjEyNytGdTdNWjVH?=
 =?utf-8?B?aVhEKzR4Ri9heEJ5Uk8wd1VITkJlQytpTzZjb3NDR2pPTzVqZkF2T0syUGlO?=
 =?utf-8?B?Z2U4WHJhcE9NZGExUXBOQVhPOEVVd2o2S0JkRk41clFURjYvbEd0TnpvaDcr?=
 =?utf-8?B?NGJGQkdOeXYyNkxudkZvNitvN0svdVd6M3VjbWs3emF6YTZLb3dmRzRTUGd2?=
 =?utf-8?B?dWttQ1Q1WWFXOFZVVFAxeUE4K0xsVDNPUGdkRlJYcUcrZEtYZktQazlrajlT?=
 =?utf-8?B?TGdLR1Zma05OY1VQNkNxLzkweTA2UVNSSkx5aW5kYWo4NWpCbjZrNGdwQmoz?=
 =?utf-8?B?WDF6SHB2c0VLQkRqVG85TEJjdmFzQzRkMVJkOW5ieVBaVEpVV29ZQWZJMVN3?=
 =?utf-8?Q?2LGc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F12CC956EC902448AB2566D47EBA4F0D@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6532.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e041849-cac1-4506-a038-08dd560cfc27
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2025 02:26:32.6434
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yDDMYMxud4NN/vWW7HRvvXwzhVkgixrxhJCOakM0zzUG3+LfxXj3/QaNXq8oo7tzf+EyDa9hn6D6I4/+ejKw/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7104

SGkgTVNULA0KDQpPbiAyMDI1LzEvMjEgMjI6MDAsIE1hdGlhcyBFemVxdWllbCBWYXJhIExhcnNl
biB3cm90ZToNCj4gT24gVHVlLCBKYW4gMTQsIDIwMjUgYXQgMDY6MTY6MTNQTSArMDgwMCwgSnVs
aWEgWmhhbmcgd3JvdGU6DQo+PiBQQ0kgcGVlci10by1wZWVyIERNQSB0cmFuc2FjdGlvbiBtYXkg
YmUgdXNlZCBpbiBndWVzdCBmb3Igc29tZSBzY2VuZXMuDQo+PiBGb3IgZXhhbXBsZSwgZEdQVSBw
cmltZSBmZWF0dXJlIHdpbGwgbGV0IHZpcnRpby1pR1BVIGFjY2VzcyB0bw0KPj4gcGFzc3Rocm91
Z2ggZEdQVSBidWZmZXIuDQo+Pg0KPj4gVG8gc3VwcG9ydCBQMlAgRE1BIHRyYW5zYWN0aW9uIGlu
IGd1ZXN0LCB2aXJ0aW8tZ3B1IG5lZWRzIHRvIGNoZWNrIHRoZQ0KPj4gY29tcGF0aWJpbGl0eSB3
aGljaCBpcyByZXByZXNlbnRlZCBieSBwMnBkbWFfZGlzdGFuY2UuIFRoaXMgZGVmaW5lcyBhDQo+
PiBjb21tYW5kIFZJUlRJT19HUFVfQ01EX1AyUERNQV9ESVNUQU5DRSB0byBhbGxvdyBndWVzdCBz
ZW5kIHZpcnR1YWwgcGNpDQo+PiBub3RhdGlvbiBvZiB0d28gZGV2aWNlcyB0byBob3N0IGFuZCBn
ZXQgaG9zdCBwaHlzaWNhbCBwMnBkbWFfZGlzdGFuY2UNCj4+IG9mIHRoZXNlIHR3byBQQ0kgZGV2
aWNlcy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpYSBaaGFuZyA8anVsaWEuemhhbmdAYW1k
LmNvbT4NCj4+IC0tLQ0KPj4gSGkgYWxsLA0KPj4NCj4+IFdlIGFyZSB0cnlpbmcgdG8gaW1wbGVt
ZW50IGRHUFUgcHJpbWUgZmVhdHVyZSBpbiBndWVzdCB3aGljaCB3aWxsIGxldA0KPj4gdmlydGlv
LWlHUFUgcmVhZCByZW5kZXJlZCBkYXRhIG9mIHBhc3N0aHJvdWdoIGRHUFUuIEJlZm9yZSB0aGF0
LA0KPj4gdmlydGlvIGdwdSBkcml2ZXIgbmVlZHMgdG8gZ2V0IHAycGRtYV9kaXN0YW5jZSB0byBj
aGVjayBpZiBQMlAgRE1BDQo+PiB0cmFuc2FjdGlvbiBpcyBwb3NzaWJsZSBvciBub3QuDQo+Pg0K
Pj4gVG8gaW1wbGVtZW50IGdldHRpbmcgcDJwZG1hX2Rpc3RhbmNlLCBRRU1VIG5lZWRzIHRvIGhh
bmRsZSB0aGUgY29tbWFuZA0KPj4gZnJvbSBndWVzdCB3aXRoIHZpcnR1YWwgcGNpIG5vdGF0aW9u
cyBvZiB0d28gUENJIGRldmljZXMgYW5kIHNlbmQgaXQgdG8NCj4+IGhvc3Qga2VybmVsIGFuZCBy
ZXR1cm4gaG9zdCBwaHlzaWNhbCBkaXN0YW5jZSBiYWNrIHRvIGd1ZXN0Lg0KPj4NCj4+IFNvIHRo
aXMgZGVmaW5lcyB0aGUgbmV3IGNvbW1hbmQgZm9sbG93IHRoZSBzdWdnZXN0aW9uIGluDQo+PiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDEyMDcxMDU1MzcuNTQyNDQxLTQtanVsaWEu
emhhbmdAYW1kLmNvbS8NCj4+DQo+PiBSZWdhcmRzLA0KPj4gSnVsaWENCj4+IC0tLQ0KPj4gICBk
ZXZpY2UtdHlwZXMvZ3B1L2Rlc2NyaXB0aW9uLnRleCB8IDI5ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspDQo+Pg0KPiAN
Cj4gUmV2aWV3ZWQtYnk6IE1hdGlhcyBFemVxdWllbCBWYXJhIExhcnNlbiA8bXZhcmFsYXJAcmVk
aGF0LmNvbT4NCj4gDQpEb2VzIHRoaXMgcGF0Y2ggbWVldCBhbGwgcmVxdWlyZW1lbnRzIGZvciBt
ZXJnaW5nPyBJZiBub3QsIHdoYXQgc2hvdWxkIEkgDQpkbyBuZXh0IHN0ZXA/IFNob3VsZCBJIGNy
ZWF0ZSBhIE1SIG9uIGdpdGh1Yj8NCg0KUmVnYXJkcywNCkp1bGlhDQo=
