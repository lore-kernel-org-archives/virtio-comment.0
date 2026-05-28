Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010027.outbound.protection.outlook.com [52.101.46.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F1C2C11F9
	for <virtio-comment@lists.linux.dev>; Thu, 28 May 2026 05:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779945753; cv=fail; b=qEltbAF+GDuYgFe/bsQb6+WAx20DJzKYZachdERsJKngZw5ScZfxZOKS2FbWi1xr/j+MiR98R2osTPZr/oF+ZJrr/Sm29GGtljAzvm6LUxlizSiUXfU4AMpYajB42YAYo4UUOEE3NzajUE/fLhRW7D+F8br1OgVqglRRX2Z6fr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779945753; c=relaxed/simple;
	bh=Pa86YjW0vINEPDFN/ZyyZr0MY7mDt6oPSJjvOIfLUzc=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KX33W8psM4iBg2Th40ork3CErpfjMXHPUY6jhvmNrWAulol0l5k0klkhKi0AhsLFsDjCn64VSn+apzX5LmQ+lMJimYt5APmcuUn0dn2YYPFBhcJD33JsuprlBCAta6vLw03zPiirErL9rSnWnJMvQxdab0xAk0Pv8VNLoXPfRQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EKrEs9ox; arc=fail smtp.client-ip=52.101.46.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EKrEs9ox"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXsx3Kc4UrWnqaSFUDhJW4R1+bAyv1uzqtxiifI8SSDaBf8v649j7LaYUAXHTJwEvPjA9LmN84PCbcJTe6ilXa9urOtKS2XsrNoUFYX7Laj49pCccQygpILkOkbFfJZgJwnLVdxfz+lagygXx4zkFApUJKuApSZSHOigKJSEIukjK2fDgPnwSQdDIlDVTgb64T0unvYqXUxsEz4LRxBw97B0bEd0Orwk3rZxIdvy81wkcR7C0ZK8Fgmf9W3IEv+h0HNG24lR0+sMT+fz32mQ4HL9bodQK8M7AzC78DdtLLoqxIX3GkS2JEyNeD81XwlQ2rVzn4AeGwEFaMWfEkhicA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pa86YjW0vINEPDFN/ZyyZr0MY7mDt6oPSJjvOIfLUzc=;
 b=tzEusXGh4P9VfAum+P2o4XxE3DQpOlCKTHg+i0TpjyCwm7501747yx6v7Q7f1XZVQp3YvOBCkwlV6SI8qWSJSeq29OfwgzJN3f7fmd9DfS63OIqJSzRRVZzcPkvQJgHUrCLuJuvCUnmGTgOaTB0wPdsYg5hJGzKMMs9Kp8xbirtZkO3ySiW4MNTb8kYxJpS8GGu0lDJ4UmmPO5FpYLO9GbLlEE8/rx/vvXrWbH36AHUG0Iz5m7u48DjJNBSsBi+Nz7DixLTDOjLcaQuaZ+Qhx2Dm9kqeiBT22EvQmwjqAvnT1+juomaNkv+68uF+MZMkEDkpG1JckCJ+O8OPeblsLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pa86YjW0vINEPDFN/ZyyZr0MY7mDt6oPSJjvOIfLUzc=;
 b=EKrEs9ox7ma6Qtt7ejmJkJUoDjq/LhOh6kplkg9uzcwyfnh18xMvygd0aHhfDX13NoQkmJHhgYSF3wcvj50dmNagrHuITqAjdYyVX+r5hsGhmUTrwfibObWnfwsvpYMlu/J1KMaQB72HcwlqmYCWtpibZ+QgBVgpAR1Q0NEX93DHqZhFDQ+4nbJ1993JfucTnNCGP+81uzgBAKE90A85m9Fv7Gm3f8LpRvjb41USRy1iDn13Lf7JfmsLT71rNXlTNy2c2rHQ0CPpNX3czL0dk2SOwzqzqkx04IiwamNZH0OJCGwbw3OOiz+J9ziNmrwprhQ1wdvqZs/w8YgaHIdSdQ==
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 by PH0PR12MB7983.namprd12.prod.outlook.com (2603:10b6:510:28e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Thu, 28 May
 2026 05:22:28 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6]) by SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6%6]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 05:22:28 +0000
From: Parav Pandit <parav@nvidia.com>
To: Demi Marie Obenour <demiobenour@gmail.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: RE: MSI-X vector limits and reserving a virtio device ID
Thread-Topic: MSI-X vector limits and reserving a virtio device ID
Thread-Index: AQHc7jQSUvRlGuwC0UCTtXzxb9wyDLYi5uiw
Date: Thu, 28 May 2026 05:22:28 +0000
Message-ID:
 <SJ0PR12MB6806C5A16CB0899E095E835EDC092@SJ0PR12MB6806.namprd12.prod.outlook.com>
References: <11771164-7919-43e1-a980-03f036bdae2e@gmail.com>
In-Reply-To: <11771164-7919-43e1-a980-03f036bdae2e@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB6806:EE_|PH0PR12MB7983:EE_
x-ms-office365-filtering-correlation-id: 6ccaa02b-5696-4250-f5da-08debc791c45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|22082099003|18002099003|6133799003|56012099006|11063799006;
x-microsoft-antispam-message-info:
 7NGtb4VzqB3e0nVXGCVlrDhnHkKSoJM5QfnDPLiAElf9vjLEaPZtGMKvaYHRNoKqzwV/qftlhxAPE2/vOYU2HFeP4fmBlNL/LvResWZAFg1ZmK57dwIijViYdXPk8nubqvXpRUMryWvFJvrCJ/MbgM/2csZ7LXRhjncWr4QQb4XKhOcR1r80w147YgzEZLvd9TSKrsn3gK+g0yv8kGbQalJeTIaCr458UXik6ixjfD9S5gRC6n7JTq3093+cgyIuCruvcofUtvIIXmsoi/eS9LtVyEk2KwKk0bZvYdfyQcboz/On3A8BJtj6vuXYFOgq7jt1ox3i6IIXE5tCGaJrZ7pObn0CGrkKOFy4KOdNPTfi6TrLCE5WLg3uk0XPtHKDaf1VfaJGeafeg73EP9r9Ul/ic5CJ3rVBXP6Zb+ipUnTYPlLvo84+xWRosNdbnwSllXBCIrNS3zY9ClhxunHFB1P3YV95SKB2p8gPZ2CEHDNiqTr3ZnmWeQRj71mgUCdXAUhTJtnuUcx6JTPJww6D55mfJxW7eaM9N80c6JxfMLk9Xh2tMVXNA2zdiru5UJeVOdq6tlGR01U1czfUSiXmRMQ00l6wL16GBWCCQyy5TKhqsB0Oe034RJWN5E0SPanBCQfPWbZFIeGImyf8UQT1ojlALTc5nBmfUrxuCt19q5eNX7/0cml1PXW4/mJxMPJxz0cE5E+NXhOvFXX37sWIBX+yft7HT/a+h5uHButgBfWdMsPmncOaqDxkyA/FgYlV
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB6806.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aW9HRzZEM3luU2hETlg4dUxrZmtLZ3lVa3FZNE5tR081SzVaZHc2TWt1d3d2?=
 =?utf-8?B?MzZnNXRiV3Q2TktrYklQdnphRVArdmM1QTNmVnBpSlZyWk0rVVFQOXdwRzJo?=
 =?utf-8?B?NThrR0xxUVN1L0lDeERzbWJVMDRnSnFoV2VuN090SENReWJ0dElIZlc2RG14?=
 =?utf-8?B?cTZ0KzZ3MjRhZ1J4TDd5VzNHc0JvdEM0UEc2UEhLNGxxb0lvL0tBYXN1d2Z5?=
 =?utf-8?B?N2JickU2WHlBTzI1NWZLZU9Ea2czbDZIM2QreVNwcENNa2U2SmU2bzYwRENS?=
 =?utf-8?B?cEFUbktPdzd4elpDam1XUkRyWldtcnIxSkxiNTQ1ZGJtUHB5YzgwanJQQUVh?=
 =?utf-8?B?cDlEY3BzQmxva0RvOXFoZW5BR3JMdlg2UUVCUXpsYnQ5NVhJcDkrYUU0NDFN?=
 =?utf-8?B?QTlFUk5rVWlWaE0wckVxQXNSMURCekVOTHBMZlU0andJcjFZUlNzckg0RDNC?=
 =?utf-8?B?eUs3RUNPY3EzUkpSeTQzZkFBTlZGbExyMUV6UEh4aEdVWG1MT0RqWm5mREQr?=
 =?utf-8?B?bmdFTUx2WGpPQ1lJRmVBSHkzYmtYcm0xTy9pOUxUR3FMNzZXb3RVTmFiY01v?=
 =?utf-8?B?VHJMVEdpWFJXbkl2SWJZTDFWZUZqMFZubG0zUzJSZGtZV0lhd2hFOTgyWDJp?=
 =?utf-8?B?Zmt1cCtMWkdQQ2dXVm54L0pLWHNHaFZzNXorM1dZUkU1Y2UxNHp0NHFVeEVm?=
 =?utf-8?B?WnZvZEdhdFd5SmZpQVAyVGp2LzdCMG9LeDVLY2NmbUJnZ0hDS3ZTZWN5aVlz?=
 =?utf-8?B?NjJGZEkzUWsxTHc0c25ycHpMVnlJUzZoNllJODYrZXBMZUh5NGtrRDQzSW1I?=
 =?utf-8?B?T2l2eGYzVUg1ZTZMK3Q2K2dCdHJXRmp0cG52clZkQUE4T3A3NmpFTWt4UGxS?=
 =?utf-8?B?ek1aWEwzbjZCQlRUNzVPMnZHTGVRT21Hd1RWYXBYVzRlNFZOVzE5MXpHRDhL?=
 =?utf-8?B?VUpmbVVVYitrejdVZldPQkQxZnNIRlJwVTc0Q3ArcC9Ld2g0RnNSeithQ1pY?=
 =?utf-8?B?ZG5YaFI4ejRkR1gyUGMyVEhNbUcxSGFyUW8ybXN2LzRUejVIeGtsbUlyK0Vo?=
 =?utf-8?B?M0pvbVhvUFdTSEZFd0tuM3JrKysyY2g5bEliak1LRVJKQ0VyZkprc2hLakRw?=
 =?utf-8?B?SS9wbUZ1ZDFLMjZqN0VpUnlsMmtnRjM3M3BWeFczdmw5UDNJdWtnNFdCTkhP?=
 =?utf-8?B?U3JheDZGdFNMcVpNL3VEQTNZUHBhOHpiNjRFYVdJTGJ3YS9jRmJRWFVFZ2R2?=
 =?utf-8?B?RGNjaFNFVk0vbU40NjBvZHFOS1I3WXR3YnRkR0pJRk5mUFJ4cG80TSsvY3hC?=
 =?utf-8?B?blI2YU5YVnQ3bjkvaThiV3lvY0dQYmczSXhER2NhRWlJSmJKblR6OHd2ZGpj?=
 =?utf-8?B?cm5ORmNHdEhrV29ZbXVxa2E5VkRyeURYK2ZPNS9nRURYTndCejJoYXdSNlBN?=
 =?utf-8?B?SENheTFUQWk4ZkIxNi96QUs2QXIyOVZlTk1YdTdFRlN3cU94cUdUYk92dFdP?=
 =?utf-8?B?NXMvUzJrZzRYSDRHRWJMZHE1Z2ZDdVhBdzl0eGpOSnNkOHN2OFZoTU5LRmdl?=
 =?utf-8?B?WHQ4dHJzcExNb1ZDMkt2WFpOVlJVVWJRdnFmWm5vbXpYdVpGei9Kb1VzODYx?=
 =?utf-8?B?RTFCbjlMMTlaa3pPNlZmQ0FaNFpDT0JZU09oUGMyb0NWRzR1ZVRCN0Y1T1Bx?=
 =?utf-8?B?Yi8vSlN6bC9DWkhsT0REOHpmV0grQ3RtbDFnZ0JSei9MSDhtL0orL05vOU1X?=
 =?utf-8?B?TGdmUWEyVWxwN3IwaUFjRS9Pd0dnVW5WUFNBTktMQzdZY0lIdGs2ekhEYlBE?=
 =?utf-8?B?M3F3Y2w4a1V4WHhLaWVQSC9hSHBpdVRUby9HcGNCMkN4L2lEb09ORGtUV05F?=
 =?utf-8?B?Mk1aWDh4TTZ3UGRxRlF3SWtTaGpJNExpZUh5NVJWdmIxaG5xTkRzY3pSemdM?=
 =?utf-8?B?eThhWkF3aFNjVE9TNXV2VEgzQWo2a2JHY00yWTdrRm41a2U1ZWlXbWNydDFM?=
 =?utf-8?B?V2xpeFdhcmFmenFOQ2VkVG9BaWkxSVVFRDFKV2JrR2tIcHA4T09mQXVmczZs?=
 =?utf-8?B?WWhwbHNUNVFDRjg2bVRBT1lNa1ROL3NyY0dJTWVZSUtMbmlVNStNUHhpNm9s?=
 =?utf-8?B?b2ZETGg4MHphTytST1ZrbHNsUms1blhCZENCYXhkQkloS2loQ3cvSENOVGQw?=
 =?utf-8?B?aDJvc045dnhGa1BYTkNlZ0E4NVVVYUtYL3k2RGY2V2xPb0huelFURGN1WnV2?=
 =?utf-8?B?SkMxRVo2M0NEWUIzTkE2V2xVZGZxendKMS92OUlyWXVlMm53ZUtRcEFtWUN4?=
 =?utf-8?Q?Np1DL/EOdPGdNAn6/S?=
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
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6806.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ccaa02b-5696-4250-f5da-08debc791c45
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2026 05:22:28.3629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: geQmE4JF6GPucO+Ja3yVToUDGxucBQFcEiCfF34OsAETmluF6wMOXykSKEWrx2cloCvUdIdJYFJQVfiCYVWKsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7983

DQo+IEZyb206IERlbWkgTWFyaWUgT2Jlbm91ciA8ZGVtaW9iZW5vdXJAZ21haWwuY29tPg0KPiBT
ZW50OiAyOCBNYXkgMjAyNiAwNToyMyBBTQ0KPiBUbzogdmlydGlvLWNvbW1lbnRAbGlzdHMubGlu
dXguZGV2DQo+IFN1YmplY3Q6IE1TSS1YIHZlY3RvciBsaW1pdHMgYW5kIHJlc2VydmluZyBhIHZp
cnRpbyBkZXZpY2UgSUQNCj4gDQo+IEknZCBsaWtlIHRvIHJlc2VydmUgYSB2aXJ0aW8gZGV2aWNl
IElEIGZvciB2aXJ0aW8gdmhvc3QtZ3Vlc3QsDQo+IGZvcm1hbGx5IHZpcnRpbyB2aG9zdC11c2Vy
LiAgV291bGQgdGhpcyBiZSBwb3NzaWJsZT8NCj4gDQpWaG9zdCB1c2VyIGlzIGFuIGltcGxlbWVu
dGF0aW9uIG9mIHRoZSBkZXZpY2UuDQpJIGJlbGlldmUgaXQgc3RheXMgYXMgaW1wbGVtZW50YXRp
b24gYW5kIG5vdCBhIG5ldyBkZXZpY2UgdHlwZS4NCg0KPiBBbHNvLCBJJ2QgbGlrZSB0byBrbm93
IHdoaWNoIHN5c3RlbXMgaGF2ZSBhIHNtYWxsIGxpbWl0IG9uIHRoZSBudW1iZXINCj4gb2YgTVNJ
LVggdmVjdG9ycy4gIA0KSSBkaWRu4oCZdCBmb2xsb3cgdGhlIHF1ZXN0aW9uLiBUeXBpY2FsbHks
IEludGVsIGNwdSBoYXMgYSBsaW1pdCBvZiAyNTYgdmVjdG9ycyBwZXIgY29yZS4NCg0KPiBUaGUg
dmhvc3QtZ3Vlc3QgZGV2aWNlIHVzZXMgbG90cyBvZiBNU0ktWCB2ZWN0b3JzLg0KPiBUeXBpY2Fs
IGltcGxlbWVudGF0aW9ucyB3aWxsIHVzZSAyNTYgKiAzICsgNyA9IDc3NSBvZiB0aGVtISAgVGhh
dCBjYW4sDQo+IG9mIGNvdXJzZSwgYmUgcmVkdWNlZCBieSBzaGFyaW5nIHZlY3RvcnMsIGJ1dCB0
aGlzIGlzIHVuZGVzaXJhYmxlDQo+IGFzIGl0IGNvbWVzIGF0IGEgcGVyZm9ybWFuY2UgY29zdC4N
CkRpZCB5b3UgZ2V0IGEgY2hhbmNlIHRvIG1lYXN1cmUgdGhlIHBlcmZvcm1hbmNlLCBmb3Igd2hp
Y2ggZGV2aWNlIHR5cGU/DQpJbnRlcnJ1cHRzIGFyZSBnZW5lcmFsbHkgbW9kZXJhdGVkLg0KSW4g
b3RoZXIgZGV2aWNlcyAoc2NhbGFibGUgZnVuY3Rpb25zIG9mIG1seDUpIEkgaGF2ZSBtZWFzdXJl
ZCBwZXJmIG9mIDggdG8gMTYgcXVldWVzIHNoYXJpbmcgYSB2ZWN0b3JzIGhhcyA8IDQlIHBlcmYg
ZHJvcC4NCg0KPiAtLQ0KPiBTaW5jZXJlbHksDQo+IERlbWkgTWFyaWUgT2Jlbm91ciAoc2hlL2hl
ci9oZXJzKQ0K
