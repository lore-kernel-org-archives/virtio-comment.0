Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB341925BD
	for <virtio-comment@lists.linux.dev>; Thu,  5 Sep 2024 07:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725521722; cv=fail; b=WPrmscOhp3e7O6Fjp3Ufh2tODWAmpUxigN1LH4uWHePRIKpJlWZjERbXJXfF3CVAOctku4emrRn3mhy8S1Y+xh62FAjga5uoDU+IVgNWfB+KQwa45FlPaulozOPaU/1+kHTCDgfidQ4h6nZGBc8UcRgtPK3ccZVogRM8Eo5EMxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725521722; c=relaxed/simple;
	bh=o6+Ce/DtHBXcVcBa3yvTq975YUoti8SP0AMcsBdBesM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AAU52XM9liLrSd/CN9VBlqD1X/ZBG9R1Eig3IdOLzs2fFZmT/UZzTWtfWTi0maG6Z+IVDhDnd7KmmWX0BbrjbJGPGNKTdm5JukkVMeBS5u/cAdQ7zyRxI9P4ARIi1MVFkQOcodYgJFPHDofCd8e2gEUqJUvdHoWEvp2pCwTRNvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aPn8DM6O; arc=fail smtp.client-ip=40.107.236.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aPn8DM6O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C+nin1oporiMw6Fw0mEvOuW+eCX4XjtqFUtVVojRJxFwIHS+NUlaPKwtZ9tAjr8dsX5w5G0a5vGCpFvy3qrnvGbo9mqpDVSJ1P80TPpQf6As4iiAQRhSbltNhZYFf0D5cqZQRryJlqQidl5j+KiLBMLqWDx0jsWnRmT9P3FMXPbuR8hZjB9IHH/BGCtQHgoLY2xh2afJQ1FFf4gMibyz7Wf7YZEPTAFj45HMJM6c1aOmSvEB3o3xMaYixLuhf+23C1DsXhs46NoSabIWIhhIW3AVe5cCs/TPw1c1s6Vh71YdhZbmK4WfcEOSq/SgQNMgaEvNmnLVklPygoEfcSUf9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6+Ce/DtHBXcVcBa3yvTq975YUoti8SP0AMcsBdBesM=;
 b=c0if7Mum49H/s3WQdonMXCdbbSiAeinGH/g6F7TNM3vD10l7pVCmeX9R2fexwy/9k3iXyIJle+lFkLZ9KneqZrw2rKQvRyjac0oDh9W5czcNTNdrGJKIOTANs07MT+7LQdSHDbJBHriIwJRDiloWuEQtaRPfOFNm/BInjw2915EC/4I4vraup94OA+yMdUILE3y9vt6VDzWbPupTUsE2d/6EDiydusIM5VtMFmztGdP1Q+xUZHmyUz8sTcIdwM+nby6PLGDj51xcNtnp5SrPHqH0WinYO8Jql/idr5bfBrnfjCxWzeOmzXqa01nb9NWlm1b0/tjNESGBIu4+hufGbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6+Ce/DtHBXcVcBa3yvTq975YUoti8SP0AMcsBdBesM=;
 b=aPn8DM6OUKqAuGgv8WDPdo0EUcUp37VT1IxyiaKV/6V8IAyPF5i1UD6tizLj2vmIq7qHn7JJ4uDplX/BTnMrZA/IOcXLgJEVdggM0ctOSU4TkaefzprZzNdN+ivGyBWXGwJ8ergK+9SUb3jSPSzMyPDtNqjb+3IZfHq8Q5bVSLg7lwvkB/e1/9EZlFY5R8wm8a9jSTjiKhhxi8dskHFA4pce4LhfsfTOSHnknd43sY84ThSGjXSw43saVtr4rFS34UMhkIrz7nHfEqz9U7Jvi9qfldcpo8dSXjksy1r5c0rNQqmVgYErabMLuu1v99nZh7Oh42Gu6mjVBJmzj7xYVg==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by LV2PR12MB5821.namprd12.prod.outlook.com (2603:10b6:408:17a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Thu, 5 Sep
 2024 07:35:16 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 07:35:16 +0000
From: Parav Pandit <parav@nvidia.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>, Jason Wang <jasowang@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
CC: "cohuck@redhat.com" <cohuck@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, =?utf-8?B?RXVnZW5pbyBQw6lyZXo=?=
	<eperezma@redhat.com>, David Stevens <stevensd@chromium.org>
Subject: RE: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Thread-Topic: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Thread-Index:
 AQHa5Ab4bEzmpQ/mGUCtSlfq0w80E7IkrTCwgAASmgCAAAEvAIAABvOAgAAF6HCAA0LrAIAAAIWAgBcwMgCAAAT60IAGsmcAgAALPgCAAAWd4IAACFyAgAAAXACAARSqgIAAD3sAgAApZ4CAAAIfAIAAAfFAgAGafYCAAABVMIAAA+OAgAABY6A=
Date: Thu, 5 Sep 2024 07:35:16 +0000
Message-ID:
 <IA0PR12MB8713676643C6A258BAFA332BDC9D2@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <88a087ff-676f-4616-a573-a765ca77bef7@amd.com>
 <IA0PR12MB87133AC3C33E8D319194E361DC802@IA0PR12MB8713.namprd12.prod.outlook.com>
 <47b314dc-d8a2-489e-a84d-6670c176675c@amd.com>
 <IA0PR12MB8713EBBD32D7FF8AE8149CADDC972@IA0PR12MB8713.namprd12.prod.outlook.com>
 <928aa775-c934-4d3e-bd38-48fb6c374fc7@amd.com>
 <20240903054018-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87134BF3D3326ED35358D6A1DC932@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240903063424-mutt-send-email-mst@kernel.org>
 <20240903063625-mutt-send-email-mst@kernel.org>
 <CACGkMEtKk8Rp16sjbS1swJZ4tabVPme_b6pYggoz19m=Bd99NQ@mail.gmail.com>
 <20240903235727-mutt-send-email-mst@kernel.org>
 <CACGkMEvO=GH1ochdgJ9oT1DriDFrV+3F-TndDW1wJ39S+hPQ+Q@mail.gmail.com>
 <04a787eb-c177-41e2-a05f-43375c7ab7c8@amd.com>
 <IA0PR12MB8713995E39DD585341C47520DC9C2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <ef72f0af-3a04-4a79-9f9d-c6dd7fb24d53@amd.com>
 <IA0PR12MB8713065A3CE6752084FCC6AFDC9D2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <d42bd62a-5527-4468-9714-2555a52a361d@amd.com>
In-Reply-To: <d42bd62a-5527-4468-9714-2555a52a361d@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|LV2PR12MB5821:EE_
x-ms-office365-filtering-correlation-id: 1adcabb9-ac7c-4b9c-6f27-08dccd7d4955
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YS9NTysvZkJrenordm1IY241RkZmOTBnVnRxRHlsUHAvVDlYaXlENXArRm5Y?=
 =?utf-8?B?K0V0S0NnNHhmMWVjZDNjOXh1R0x0ODVaMjVwWEVpTWtHSCtZcmJxYlJMVHNO?=
 =?utf-8?B?ejFWekcrWXlRMW1QS2FrMDVPRS9wWGdnZEx1cUs3ak1PV0xzdGE2THN1bmJ4?=
 =?utf-8?B?NzI4bHZXU00rZzJUZ0VORzhQUllsSjh4Q3NHaHpuSWNOTzYrU0J2TjNETmp0?=
 =?utf-8?B?Qk1vc0Z0ZEgremwzcWpQMVo4K2VkaHZneVBnZ3RrWEpBQXY2eTdTSEtJUUJX?=
 =?utf-8?B?RXpzckludGdvdjJuTmpSRnhLWmg1MXAvMnpQNC9lOEp0RWpLdDkzS0ZpSWlZ?=
 =?utf-8?B?bjZlUFFhcHl3dUNNUGdnNnpzUmxDT21WcStqSWZEWXZwVDRMSGxVLzc2L1BQ?=
 =?utf-8?B?SDdiQnZHOTNNRitPdkx0RkNONnYzL1BDRjNNZE05S1l3WFBHRWxRdUQwb1Vw?=
 =?utf-8?B?MkJOdUlSdnFLOUI0cWltZCtpb1BRMndUY1UzZlNSU3VwbmFRWmE4TGZlNy94?=
 =?utf-8?B?RmlEZWs0R0xCMjk5cHBHYk5pTlkxc2lMWVlmZzhYdW9Wc01RbzZncjh6cnJv?=
 =?utf-8?B?TDFCRjFCTEdlaDVyMHRSNzJua2dydUcvT3NsS2Mxc3duSXI4RnhjTVNmRnlP?=
 =?utf-8?B?L2RzS2FscFZXbFd6dEdNVWJyczZNZW9LcC9ITDFTUFpSQ2o0bjUzWjJOTUU3?=
 =?utf-8?B?QTB3VkFkZTluT2Y3UW5rdWxaV0EvTzRLWW0vUDI4SzJaZGVSeTBzN0hmMm1M?=
 =?utf-8?B?aTh3aVgzTmNzVXVGdTM3VjNuYlFvRU9ldDRtRWd2UDdkam1ybll5Wit6ZEtw?=
 =?utf-8?B?MmwxWGZmWHM2OHNTeExSN3dqRXNsUEdOSlRMS1JOYVhSWlFRRTJxUzUvRzlU?=
 =?utf-8?B?UGpadlMvRHN6ZkdPQWNwN29tK3hsVHhSbEVqZzIwQXY2V1duYkg4blBnK0hJ?=
 =?utf-8?B?M2VJeFZ6eSsvMWowaWFHQndIdG9RQVA4Q1FTVjhQbFpKa2g5NHdsR2pXWnZW?=
 =?utf-8?B?SnBBNVBkdHc4VWpUaDR2TC9IQ0Q4WndZZTZRa1VLK09DR1hhWU1ObE9Zb0Fx?=
 =?utf-8?B?MVY0MUJsZ1ZHcVlUNTN2YTZ6NnJpM0J0NkZHL1F5OFNVNWFnUUxyZ09HK09Q?=
 =?utf-8?B?ck9YNDE0T1IxaUJUakZsZWdUcXB6ZFNGbzIwSlppSFplMVN4S2RITXljOE1L?=
 =?utf-8?B?RU9oSitWUDVDamVMV2VWVDFLSVZDMENoWDdDc1J3UThIYWk5SkVSVlMya2JM?=
 =?utf-8?B?ajNvd1B6QTdRUG1ReWVBaTh6Y3JYUExlSEw5NE9CeDZEbWxYQVRDK0x2emJm?=
 =?utf-8?B?UytxTWxFcXNNdDNQbC9Ta1cxdVBHWk0rRm9MU3RveitFeVhuMHptTXFTOCtC?=
 =?utf-8?B?eEplVW9KM09aalRoL1JTQkZJbmMvUEk4dXplU0pMRFpxOFAxQ2F2VkxTQzNj?=
 =?utf-8?B?MDIzaFpQRjlINDIyUkZ1b2tJZlppQmh3TG0wOW1CTkVOYkxIWVc4U2U5UnYz?=
 =?utf-8?B?QUdSVEMvTm9GMTlKZzJEa1FYOEJxNmdXQmRQc0ZaRkl0Sys5dk05OElFOUZ6?=
 =?utf-8?B?WXlGMm9UUzc3Z3dodlpHaXR3VkJqdHdHS3Y4UFl5Z2tHcjNXWXVDbzBBZHM2?=
 =?utf-8?B?a012UnFtWVJVNjd4VmY4eDZNb0xMZzhHS1hwWllvZFJmbHE2Vjdsd3pTZ0Vx?=
 =?utf-8?B?NFNmREkrdHE3L0Z6SDNvbmJnQ1dwbllybms2RFRpQW1JZWVVSE91YnFsRFhT?=
 =?utf-8?B?WWY0VHRldks5bkNUWm1xSThrK3hXbWUrd2hucytYYmR3WnozS1UzQU5pZjN0?=
 =?utf-8?B?OXFLNXZwTFhKR3RieThLcURXVGE1Sjd3UHlTMjhTNUpWYVlPSzNBeU02VDJm?=
 =?utf-8?B?MWV2U0paK0syRnFmT1V6SXAxa0RYVEJMMmJJRnpPdXM2Wnc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b3o5SzA0bGF2RmF1cVNsT0xaL29yT1E4dUlKQ2FERFFmU2FEaGovYllhMnBT?=
 =?utf-8?B?SjZJUzZwWWxCbVpvUFVFaUsrZXpRTkhpc2hwS3Z3eFVKNStUVmdrbmlvM3d2?=
 =?utf-8?B?UE5QSGtaOGxBb3dQaXN1WXFxTmlyV2d4V3J5c2pIMi9PNllWREY4OEI4a1Zh?=
 =?utf-8?B?M2N3RjhhQmY4amJrQng1OXhWR2ZQMFFHZFlwQzJLdHJ2ZXh2c0RqWWNEZmd0?=
 =?utf-8?B?THBxK1dOMTNseS9aK0o3eU5rK3kwRVNKZDI4Ui9rR0o3NlNBNnlRQ1F6djRu?=
 =?utf-8?B?cnJMRUlpbXNZQ0NLUWhXZHptd3NXU0tBc2R0Mk9Ydm5YekZwYS94ektQcVVC?=
 =?utf-8?B?U3dsT1F6U0ZTWk8rMmRIV285MjdON0c5YzBlT29OMjhFQWJFSnRaRFZQMG1F?=
 =?utf-8?B?bkUzQ1lMR1Y4bVg4N3hQNEwwbnJhSEh3ZVdrZFh1R0JLRnMzdUlmOHh4cE93?=
 =?utf-8?B?Z3RhRFQyenpYWDdCald2SVliVmJHMWp5UnE3ajFuRHBxNGtkYWY0T05jWDhk?=
 =?utf-8?B?RFJ1SW9hdUI3NHVOdzV0blVCOXRvRytURXkvbjB5QTN3cG5mV0U3SDA5NDYx?=
 =?utf-8?B?RFFseWthaENXMjUrY3RBKys1U0N0WnpKSHNpdnFsWFRDK0ZVNm1xU3NmSk1a?=
 =?utf-8?B?b0NzNzMvS0xNQUJ5a1RLeXJvL1NhbThpdlF2Ykdob2dMMVNTY0RsM0EreCt3?=
 =?utf-8?B?Z1RUMjZXRzkxQVNDUGI0MjRkdkpGSi9qTzFxZHpiS01rcE9XOS9naEpHWGFv?=
 =?utf-8?B?WmNDbVNtemhoRGUwVGN6YmhGY0NDcjJ3d1luWEtuS2MzZVhyTHpmLzgrRVBl?=
 =?utf-8?B?OC9sclVpWEh3bFdzUGtrL0drT0hDSlE0ckFxTE9HeGhQVVB5d202NGpINHFu?=
 =?utf-8?B?eis4ZkhBT092eUVQa09DRkhOejVVZHNqb0ZuTTJXMUYxb0g3VFIxdVlQc0hw?=
 =?utf-8?B?TmdSVlBxckN4QUkzNytLSTJWemt5UzNlNWZKUE1rMGFQTUlZRGtqVmJUR3V1?=
 =?utf-8?B?VExKMkhjU00vaU9YYURhdDUwZjBtakViRUlIcWtObXpyempmcnRnaWdYWEdu?=
 =?utf-8?B?bDdpVEN2ZVJva25PUm1DWE0zOTRneCtQSElYcWNJUGRSYk5tdUNud1Qvay96?=
 =?utf-8?B?S3VINlArdDB4NkhScUlLWFcvYUNTQ2dnWFNXbUZkNzZKSUx3blZCM2wxbm5D?=
 =?utf-8?B?WFgrWUtNejI3RFVtRmN2bURoMGlRR1JyUEFWV2d3T1Z6OWNkWGJFclRpcm1W?=
 =?utf-8?B?VzR0ZXlIb3JwRExtRkwwdE1yV3JhYmhSODd1VzNuUVpOZGJkOFV0NVB5L1Ix?=
 =?utf-8?B?SGwrd1VxN2VUUytyYm5hOHlhSlBuWWMyR0xnWFdqOU8xVWR1MlgvVzRWYUc2?=
 =?utf-8?B?U1JYNThiMFNyRW1WNXpBdkxRN2gwdzRYTmR5T1pUNGQ3UUQwZmExVFZMVFdu?=
 =?utf-8?B?Q2FHODlWRnBNTnNwUDk4Q3J5MzVhZDVXTTVIdUY4OEYvRHdGZW1rWEROaHY3?=
 =?utf-8?B?Qk5wZVplOFJKYVdFQk93ZWpxVmY4NVA4clpGOTVKUlpkRWFZK0NxM0p0anJ6?=
 =?utf-8?B?aVpaQmpmbTdnczVzZUJac0dMWjlSYmlWd3VWcHRmZlhrNzUxVzErMnNzMlh2?=
 =?utf-8?B?c3JBUnNlWVRwQ0F6RzBUMERXRHBlNXpGaEdieUtxQXdzb1ZIeGM1eFEvbGI3?=
 =?utf-8?B?Y1VEU1dTRnRhS0xpYzR2bmhSb0lab3JxYm5DR2J0QStmcW9mSEZpQXNYQ3Bu?=
 =?utf-8?B?c2dKUkd1Y0JXZFZGeGFGcGU1bzcyTTI0UXhleFFVaU5TMGdyaHE5SlYwV2hL?=
 =?utf-8?B?TFdYSDZQM3k0MDRNTHhkTU11d0xOdTA3MVArc0gyazY1OUZCY1dEY3dlOG43?=
 =?utf-8?B?ZStuQUdJZWlBaW1tVjc3dERTYm03TTlIS2Q2YS93RjJZcFk4K1FMTkc5NDJF?=
 =?utf-8?B?MUozN3RRVGF1NVQ0VFBPcjQrem9GMVVFNWkvdVBmeU5VeVI0UWZmMjA5dm8r?=
 =?utf-8?B?L2IzeU1rMHE2aUV2R1BSay9yeis1WDRBOWhMMWRwVWllQkhobkhCejArS0lM?=
 =?utf-8?B?S0k4Z2J6N2hoU0JqS0VMM3NadkVFNjRpSDNZV2psaVhpakJEd0lKNnJSVGVB?=
 =?utf-8?B?eElmRnR0M25OY205TjkyZWpIY0JWTU9MM2NTNm5LWCsrb2dhb3lPaG9sODlk?=
 =?utf-8?Q?iOOuzoZtwxgs6KwGPXhEZB8x1zHRbNCaoo4EuZDD+CKc?=
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
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8713.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1adcabb9-ac7c-4b9c-6f27-08dccd7d4955
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2024 07:35:16.4332
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LS76d4b4d2kQ4G0XchjTTgkxclKvTfrf4BidMp7wDFblbbivtdvPG1Y6hEolcubfllAZ3MFFXfHBKHyFg2NJew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5821

DQoNCj4gRnJvbTogWmh1IExpbmdzaGFuIDxsaW5nc2hhbi56aHVAYW1kLmNvbT4NCj4gU2VudDog
VGh1cnNkYXksIFNlcHRlbWJlciA1LCAyMDI0IDE6MDAgUE0NCj4gDQo+IE9uIDkvNS8yMDI0IDM6
MTYgUE0sIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4gRnJvbTogWmh1IExpbmdzaGFuIDxsaW5n
c2hhbi56aHVAYW1kLmNvbT4NCj4gPj4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciA1LCAyMDI0
IDEyOjQ1IFBNDQo+ID4+DQo+ID4+DQo+ID4+IE9uIDkvNC8yMDI0IDI6NDYgUE0sIFBhcmF2IFBh
bmRpdCB3cm90ZToNCj4gPj4+PiBGcm9tOiBaaHUgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBhbWQu
Y29tPg0KPiA+Pj4+IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDQsIDIwMjQgMTI6MDkgUE0N
Cj4gPj4+Pg0KPiA+Pj4+IE9uIDkvNC8yMDI0IDI6MzEgUE0sIEphc29uIFdhbmcgd3JvdGU6DQo+
ID4+Pj4+IE9uIFdlZCwgU2VwIDQsIDIwMjQgYXQgMTI6MDPigK9QTSBNaWNoYWVsIFMuIFRzaXJr
aW4NCj4gPj4+Pj4gPG1zdEByZWRoYXQuY29tPg0KPiA+Pj4+IHdyb3RlOg0KPiA+Pj4+Pj4gT24g
V2VkLCBTZXAgMDQsIDIwMjQgYXQgMTE6MDc6MjVBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToN
Cj4gPj4+Pj4+PiBPbiBUdWUsIFNlcCAzLCAyMDI0IGF0IDY6MzfigK9QTSBNaWNoYWVsIFMuIFRz
aXJraW4NCj4gPj4+Pj4+PiA8bXN0QHJlZGhhdC5jb20+DQo+ID4+Pj4gd3JvdGU6DQo+ID4+Pj4+
Pj4+IE9uIFR1ZSwgU2VwIDAzLCAyMDI0IGF0IDA2OjM1OjU5QU0gLTA0MDAsIE1pY2hhZWwgUy4g
VHNpcmtpbg0KPiB3cm90ZToNCj4gPj4+Pj4+Pj4+Pj4gQnV0IEkgZG9uJ3QgbGlrZSBpdCB0aGF0
IGxvb2tpbmcgYXQgdGhlIHJlZ2lzdGVycywgb25lIGRvZXMNCj4gPj4+Pj4+Pj4+Pj4gbm90IGtu
b3cgdGhlIGRldmljZSBzdGF0ZS4gSGlkZGVuIHN0YXRlIGlzIGJhZCBmb3INCj4gZGVidWdnYWJp
bGl0eS4NCj4gPj4+Pj4+Pj4+Pj4gV2UgaGF2ZSA0IHN0YXRlczoNCj4gPj4+Pj4+Pj4+Pj4gc3Vz
cGVuZGluZy0+c3VzcGVuZGVkLT5yZXN1bWluZy0+cmVzdW1lZA0KPiA+Pj4+Pj4+Pj4+PiBzbyB3
ZSBuZWVkIGEgcmVnaXN0ZXIgd2l0aCBhdCBsZWFzdCAyIGJpdHMuDQo+ID4+Pj4+Pj4+Pj4+DQo+
ID4+Pj4+Pj4+Pj4+IHdlIGNvdWxkIHN0ZWFsIDIgYml0cyBmcm9tIHN0YXR1cyBidXQgaXQgc2Vl
bXMgYSBiaXQgbXVjaC4NCj4gPj4+Pj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+PiBUaGlzIGlzIHdoeSBs
ZXR0aW5nIHRoZSBzdGF0dXMgdGVsbCB0aGUgc3RhdHVzIGFuZCBjb250cm9sDQo+ID4+Pj4+Pj4+
Pj4gcmVnaXN0ZXIgdG8NCj4gPj4+PiBjb250cm9sIHRoaW5nIGlzIGVsZWdhbnQuDQo+ID4+Pj4+
Pj4+PiBObyBhcmd1bWVudCBoZXJlLg0KPiA+Pj4+Pj4+PiBPciwgdG8gYmUgbW9yZSBwcmVjaXNl
LCBvdXIgc3RhdHVzIGlzIGRyaXZlciBzdGF0dXMuDQo+ID4+Pj4+Pj4gSXQgbG9va3MgbGlrZSB0
aGUgZGV2aWNlIGFjdHVhbGx5IG90aGVyd2lzZSB0aGVyZSdzIG5vIG5lZWQgZm9yDQo+ID4+Pj4+
Pj4gcmUtcmVhZCBvciBwb2xsIGZvciB0aGluZ3MgbGlrZSByZXNldCBhbmQgb3RoZXJzLg0KPiA+
Pj4+Pj4gVGhlIG5lZWQgaXMgdGhlcmUgZm9yIGNvbXBsZXggZGV2aWNlIHN0YXRlIHRyYW5zaXRp
b25zLCB3aGljaCBjYW4NCj4gPj4+Pj4+IG5vdCByZWFzb25hYmx5IGJsb2NrIGEgcmVhZCByZXNw
b25zZS4NCj4gPj4+Pj4+IEFub3RoZXIgc3RhbmRhcmQgYXBwcm9hY2ggd2l0aCBQQ0kgaXMgdG8g
c3BlY2lmeSB0aGUgdGltZQ0KPiA+Pj4+Pj4gdHJhbnNpdGlvbnMgY2FuIHRha2UuIEkgY29uc2lk
ZXIgdGhhdCBsZXNzIGVsZWdhbnQgLSBpcyB0aGlzIHdoYXQNCj4gPj4+Pj4+IHlvdSBhcmUgYWR2
b2NhdGluZz8gVGhlIGFkdmFudGFnZSBpcyB0aGF0IGRyaXZlciBkb2VzIG5vdCBsb2FkDQo+ID4+
Pj4+PiB0aGUgcGNpIGJ1cyB3aXRoIGNvbnN0YW50IHJlLXBvbGxpbmcuDQo+ID4+Pj4+PiBUaGUg
ZGlzYWR2YW50YWdlIGlzIHRoYXQgaXQgaXMgaGFyZCB0byBwaWNrIGEgdW5pdmVyc2FsIG51bWJl
ci4NCj4gPj4+Pj4+IEEgY29tYmluYXRpb24gb2YgdGhlc2UgYXBwcm9hY2hlcyBtaWdodCB3b3Jr
LCBlLmcuIGEgcmVjb21tZW5kZWQNCj4gPj4+Pj4+IHRpbWVvdXQgdGhlbiBwb2xsLg0KPiA+Pj4+
PiBXZSd2ZSBhbHJlYWR5IGhhZCBtc2xlZXAoKSBmb3IgdnBfcmVzZXQoKSwgYW55aG93IHdlIGNh
biBpbmNyZWFzZQ0KPiA+Pj4+PiB0aGUgc2xlZXAgdGltZSwgaWYgaXQgY2FuIG92ZXJsb2FkIHRo
ZSBwY2k6DQo+ID4+Pj4+DQo+ID4+Pj4+ICAgICAgICAgd2hpbGUgKHZwX21vZGVybl9nZXRfc3Rh
dHVzKG1kZXYpKQ0KPiA+Pj4+PiAgICAgICAgICAgICAgICAgbXNsZWVwKDEpOw0KPiA+Pj4+Pg0K
PiA+Pj4+PiBXZSBjYW4gZG8gdGhlIHNhbWUgZm9yIHN1c3BlbmRpbmcuDQo+ID4+Pj4+DQo+ID4+
Pj4+IFRoZSBtYWluIGJsb2NrZXIgZm9yIHRpbWVvdXQgaXMgdGhhdCBpdCBtYXkgYnJlYWsgbWln
cmF0aW9uIGFuZA0KPiA+Pj4+PiBjb21wbGljYXRlIHRoZSBoYXJkZW5pbmcuIEFub3RoZXIgcHJv
cG9zYWwgaW4gdGhlIHBhc3QgaXMgdG8gaGF2ZQ0KPiA+Pj4+PiBhIG5vdGlmaWNhdGlvbi4NCj4g
Pj4+Pj4NCj4gPj4+Pj4gQnV0IHdoYXQgSSBkb24ndCB1bmRlcnN0YW5kIGhlcmUgaXMgdGhhdCBz
dXNwZW5kL3Jlc3VtZSBzaG91bGQgYmUNCj4gPj4+Pj4gbGlnaHRlciB0aGFuIHJlc2V0LiBJZiB3
ZSBjYW4gYWZmb3JkIGEgcmVzZXQsIHNvIGRpZCB0aGUNCj4gPj4+Pj4gc3VzcGVuZGluZy9yZXN1
bWUuIElmIHdlIHdhbnQgdG8gaGF2ZSBzb21ldGhpbmcgbmV3LCB0aGF0J3MgZmluZQ0KPiA+Pj4+
PiBidXQgaXQgc2hvdWxkIGJlIG9ydGhvZ29uYWwgdG8gYSBzcGVjaWZpYyBuZXcgc3RhdHVzIGJp
dD8NCj4gPj4+PiBJIGFncmVlLCBpZiB3ZSB3YW50IG5ldyBzdGF0dXMgaW5kaWNhdG9yLCB0aGVu
IHRoZSBuZXcgaW5kaWNhdG9yDQo+ID4+Pj4gc2hvdWxkIG5vdCBiZSBzcGVjaWZpYyB0byBTVVNQ
RU5ELg0KPiA+Pj4+DQo+ID4+PiBTb3VuZHMgZ29vZCB0byBtZSBhcyBsb25nIGFzIG5ldyBmdW5j
dGlvbmFsaXR5IGRvZXMgbm90IGZvcmNlIHRoZQ0KPiA+Pj4gZGV2aWNlDQo+ID4+IHRvIHJlYWN0
IGluIDUwbnNlYy4NCj4gPj4+IEluIHRoZSBjdXJyZW50IHN0YXRlIGl0IGZvcmNlcyB0aGUgZGV2
aWNlIHNvIHBsZWFzZSB1cGdyYWRlIHRoZQ0KPiA+Pj4gcHJvcG9zYWwgYXMNCj4gPj4gTWljaGFl
bCBndWlkZWQuDQo+ID4+IFRyYXAgYW5kIGVtdWxhdGUgaXMgdmVyeSBvZnRlbiBpbiB2aXJ0dWFs
aXphdGlvbiwgb2YgY291cnNlIHRoZQ0KPiA+PiBzb29uZXIgdGhlIGJldHRlciBmb3IgZW11bGF0
aW9uLg0KPiA+PiBCdXQgdGhlcmUgYXJlIG5vIDUwbnNlYyBhc3N1bXB0aW9uIGFuZCBubyBvbmUg
Y2FuIGZvcmNlIHRoZQ0KPiA+PiBoeXBlcnZpc29yIHRvIGZpbmlzaCBhbnkgZW11bGF0aW9ucyB3
aXRoaW4gYSBjZXJ0YWluIHRpbWUNCj4gPj4+IFRoYW5rcy4NCj4gPiBZb3UgYXJlIGNvbXBsZXRl
bHkgaWdub3JpbmcgdGhlIGNvbW1lbnRzLg0KPiA+IEdvb2QgbHVjay4uDQo+IFZNX0VYSVQgYW5k
IGEgVk1fRU5UUlkgd29yayBpbiBhIHBhaXIuDQo+ID4NCkZvciBodyBwY2kgcGYgd2hlcmUgdGhl
cmUgaXMgbm8gdmlydHVhbGl6YXRpb24gdXNlZD8NCkhvdz8NCg0K
