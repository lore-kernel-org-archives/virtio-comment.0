Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1489222315
	for <virtio-comment@lists.linux.dev>; Fri,  6 Sep 2024 01:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725587677; cv=fail; b=YRR1v1kb5K5Up5e/J/kOTGMphBMS4LTL4ntxZii2227ll/HQ60oZszqzx4DAtWpDHThoNaFvOQCOqCd0ft/FNadVHyTiaPO3OluYl/VruM4LyLdAqfoqLBDL1SQPyw082SsqlrFDdo37esIqDN6L5Mw/hhp56HDkN9G2aI32gik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725587677; c=relaxed/simple;
	bh=QkMXB6gewnG6s4i1ZxyGMhYlYC0VXTtzdaAxoCg0uDQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Xa0TTC2T5idgU48VvSyGFkXBxzIjx9Idihx52l9XMPikxYwCXVC9nMI3U6dtRXGqPkDQS3BZBKQ73PQ9nO+92ziJadOWeQxUkpr9pqSWvUlX69os3iUB3iVw8jIBTKbzEVHIeOqrhPRG2N2gW77cgmSVG4UCkDKvuDme4J+MbVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qq2XaB0O; arc=fail smtp.client-ip=40.107.92.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qq2XaB0O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1XHLsw8wlr8YS4JFKouBctHaaGeF3jk/gUT+AlNSaqxwPfbeRXUuixQuVexrSRfi788FegWIGNedhdqWlaF1yOxRAEmxKejOkC1UZonHAT5euVSmd8BS7LVVvCmUmEgBSCN2USbEkkWb2HdK7+G8O2LyEyWasIwKP621JH3t6dRUFPfKJx1rzn5U6i1WQ1yw4fR9X2oBW8I1eGgKgc9WR0gZ5wZEhzxMtLTK4lJp+0Ebn9EKv+1XsTknaI3LbXvQp6zkWRicFQL07Byxw9+uy7WntpkVmINpy1gL3DOTfarJpy1nFH1WUyQW30wLy2UY2GmiO5sUl5uTdBlblaoRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkMXB6gewnG6s4i1ZxyGMhYlYC0VXTtzdaAxoCg0uDQ=;
 b=Pai5H+IZenMTvjA3VFWCnTyZ3OPrORabAXe7rc1qtEST7O1LuaM7Up3+Qaf09u4sSeph7FPVurCVklMplhWMM6WyL8zlw/gk5chHElAsHPULY9zWCjlWxF+a6ia+AhfDIcdK2h4jvLxbCz5fsbA+xIlXs+bVvqPHpaHTSaMSUhoxjox+mY1fYl1jU3iIK64YK1TIkX8hOo7RFS4uNmvfHYX9L/fu2J/thD6Y+mQBTN91XTCrmqNAJ730nNsiSYEqLreuIjsSltuWOyywpsz3QSyw+RTErfue9Q2ysvcQ7IwwZP0ciW5Rs+AbhDsYH5GL9yoSv3sH3pVje/kXxsVDbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkMXB6gewnG6s4i1ZxyGMhYlYC0VXTtzdaAxoCg0uDQ=;
 b=qq2XaB0O6hsgf5VbsGn3oHaEl3aSW70przGNm1HRf9XzPZoHyVPUh/nv12baC+sezLBDJ/fDu9g3PruQed8D6Izmz7+RMIva6KeRZzc68wbFK3ADhNimwAFpkz5wRRQgvs252OGI7EmLItQgUSQbbrVTrx0iar1FGeE4rfh90hhJH+qUPu43nfIWpDKPYxfB2h9FdSwFbicJ34l0NnQFZDiFQ4fukpnV8nxqseZjy6adVJOX4XYyo75FM2hHBnggC30Nhyb7GDDqvDHG28+Vfn5wJZLq0OiqzZsrc7/PneMrwbVHGCE1wHmcFzNcZqy1pFeGbOdIp6JbVMLsqfe2ow==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by DM4PR12MB6277.namprd12.prod.outlook.com (2603:10b6:8:a5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 01:54:31 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 01:54:31 +0000
From: Parav Pandit <parav@nvidia.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	=?utf-8?B?RXVnZW5pbyBQw6lyZXo=?= <eperezma@redhat.com>, David Stevens
	<stevensd@chromium.org>
Subject: RE: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Thread-Topic: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Thread-Index:
 AQHa5Ab4bEzmpQ/mGUCtSlfq0w80E7IkrTCwgAASmgCAAAEvAIAABvOAgAAF6HCAA0LrAIAAAIWAgBcwMgCAAAT60IAGsmcAgAALPgCAAAWd4IAACFyAgAAAXACAARSqgIAAD3sAgAApZ4CAAAIfAIABlg2AgAAFzYCAABC2gIAAD/aAgAEYguA=
Date: Fri, 6 Sep 2024 01:54:31 +0000
Message-ID:
 <IA0PR12MB8713377601388A75FAB86CD7DC9E2@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <20240903054018-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87134BF3D3326ED35358D6A1DC932@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240903063424-mutt-send-email-mst@kernel.org>
 <20240903063625-mutt-send-email-mst@kernel.org>
 <CACGkMEtKk8Rp16sjbS1swJZ4tabVPme_b6pYggoz19m=Bd99NQ@mail.gmail.com>
 <20240903235727-mutt-send-email-mst@kernel.org>
 <CACGkMEvO=GH1ochdgJ9oT1DriDFrV+3F-TndDW1wJ39S+hPQ+Q@mail.gmail.com>
 <04a787eb-c177-41e2-a05f-43375c7ab7c8@amd.com>
 <20240905024935-mutt-send-email-mst@kernel.org>
 <47b21a27-d34f-4836-9af4-b009001536ef@amd.com>
 <20240905031759-mutt-send-email-mst@kernel.org>
 <bae7e0bf-4baf-4a36-8fd3-0f99e86a89ba@amd.com>
In-Reply-To: <bae7e0bf-4baf-4a36-8fd3-0f99e86a89ba@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|DM4PR12MB6277:EE_
x-ms-office365-filtering-correlation-id: b1c9ce9f-4852-464d-e6d2-08dcce16d9c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dVZQUXZ1dUFxRklLWDFRTmpWb3J1VnhmTWk2RDNJbXdUMUw0YlRZM0szOWJs?=
 =?utf-8?B?QVJCSzBrbkxLdHdjYm9wSDR1SG5WV0FJaXVmdE9nQnUxNWFxQU44a25Sa0dk?=
 =?utf-8?B?VnBLTUY1K1VOTnI1bzRPY0trUGI3M3l0VTRUeXUzdFl1MkxoYjFWWXljZnBB?=
 =?utf-8?B?UkRCellIajM3Mk8xNUxuSEt3bm95ZUViVFNGdTZQRUozTGFtSTVEMmVmQTZB?=
 =?utf-8?B?azNVOHJFSVQ3UkFOZS92T2k4VG12bGYxb2kxZjA2eGovKzErMk1pMnNlSDln?=
 =?utf-8?B?U0Z0Y1VTd2hJcEg1RVkzSStDK2NEU3o2ZUpXLzdJRXJYdENrZ2tvN29HSHB6?=
 =?utf-8?B?T0JWaDgwS3l6T0RkSFB5eDY1N1hlQURYTlYwREZMd3ZtTG1NUkZkWDR5MXNR?=
 =?utf-8?B?RlYxU3RQc2NHQVlFK2dMZkY5bFVlMXZNZHdxYUNpSmcrbEMzL1hyTjlJalBi?=
 =?utf-8?B?Z25ZQnFoek1HbTBpLzV4ejZWQUM1Q25zTFVsclRwUlVRYy9kdmNNaUw1SEFR?=
 =?utf-8?B?QW0yeW12MXdZN2ozMURybFRKYmgrdlBjTzZlTDRLMWlaQVJhU080SDk0WFJw?=
 =?utf-8?B?ZkRadExQTDFtQThEcUZsR2czR3c1Z3BrVURiSWp5aHpJSmtFQWc4VXEzTmZ3?=
 =?utf-8?B?WGs4YjhKUU1FUmZXTVRoc1hBV3Rma2Y3OG5SUVdkWnZ5MVlvWmExeXVLV0xn?=
 =?utf-8?B?UnhKZ2lua01ZWkQ5d1NldmltanNpSVFSK1RsYmk0QXpiUFBQeVl3Z2RiZmVM?=
 =?utf-8?B?b0FBSUhlS3FGTlhUWmlMSUNNaXk3U1haSmZmWmovVXZXQjQ1TmNhS0RabEVl?=
 =?utf-8?B?M2Q3YW1JUWRLQmZvZU9lV2VpaURnaVg2aDFTcVNNaEpoT2llZWJRSEJkcW9t?=
 =?utf-8?B?eFVEWitkalJOc2F2dlJiMXpqUXJ4bFB6RXozbkxieWRma0l0REgvYlpJMHZS?=
 =?utf-8?B?MjNUd2tZRHV6N2JyZzdDREF1SWllV2owZDdIem1aWkgvanA1YkNlVG85NVBO?=
 =?utf-8?B?UWpRWkhoOXdsOS9TS1VOYmFnUTJBUEtyTlRBc2tyNElVOEd0ZnMzb2Qyb0lZ?=
 =?utf-8?B?S05PaitEWUw1bWM5RXZST1d0OUlkZHkwSmRrL2MvMlYxTjhHdzh1ajA4c0Ni?=
 =?utf-8?B?KytyY2JoQ3E5bU9PR3R0WEpZNFBublJIMTdJem12RVVUMGFYTzlqWDZmWTlR?=
 =?utf-8?B?MTFYWllvcnRtUVE0K010Q0d6NTJ6SVU3K2JpTDliVE9vUkhHdVN5MDBGb2Fx?=
 =?utf-8?B?QjBpZ1JrQnQweDZlM1BwKzNQUFk4OVo0d1NoZDZvYjd6SHNzNjdhQUNyOTlU?=
 =?utf-8?B?dmNUVnVuYTBlY1VqeDBuUlU0SEpiTTZPZ2VmQm9TajBVbWplRWw5ZEJZSk5J?=
 =?utf-8?B?OFhEdkZPMlFIQ0xPMVNBOWVrWmRDa2VUaU1sdVAzL0cvUjBrUzRRa2RpMDVD?=
 =?utf-8?B?ZlBUbE1IZ3VhUUZoOFlLb3NBbVRPRTBtbE9hSHFoYXRTWE5EdENjOFB6UFg3?=
 =?utf-8?B?VjNEdHZHZHhwemU0UVlTeHRvVW9qcmVWOVZia202Wm5UZWRzeklLNHQwK1ZY?=
 =?utf-8?B?Tkd4T0hieXpqVFBqRTB0OTFCYWVtcCtod0xJYlBvOFYxaGdOVmtRbHpxOUVo?=
 =?utf-8?B?WE45TUxPV3duNmNna1NsRzE4QkJQWWpPVDdlTmJiNkowVG9TVU9wdU5CQUsw?=
 =?utf-8?B?Vm9rOGdhSElULzE2ZzRLcDhiVlliT2FrcGdUWE5PZmdlVFhlaWtHdkVERVpm?=
 =?utf-8?B?ZEpOTm0zb21CY0R6SFNZUjVlMEptcEJQQmJaOElnQ2NEUU5SZHlvak5qYXRv?=
 =?utf-8?B?WndrUWxNdzYvbWZhM3NNSVRBZTJUZzJEcXV1S1RKV29GeFlqdG4yZEhpaVBX?=
 =?utf-8?B?NjVlVFRTOGhJSkprRWhLa2RjMnFHRUM2ZjR4UjhEclNEV2c9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RHY1UFl1MlVJRkRDR2lKdEQzOWdYRjQvY0hnbkFCdjYwcFU2L1lSSDRPem9I?=
 =?utf-8?B?eXhvblpmSk8vbzA1QnNvNjdqMm8rcDI2a2I2UUthRkZvNWtsSEpNZDVhYTMx?=
 =?utf-8?B?MEtreXdaL2NrVm90Z0FWTW5Yemh4c0JwUWNURDR0RktBTURCZ05NejRZVmVu?=
 =?utf-8?B?Sm1mS2Y3Y082YSszU1N4dTRYUVRSeERoaGlUU2VuekZKT1ZRN3JwTEpWbTQy?=
 =?utf-8?B?MU9jM2IybGZnenE0U1pHZkNVMFgyRzMxSnkxZXNYU3BCNWwveWZaSVNXb0px?=
 =?utf-8?B?bmdWaXFKWEp3MFVJYUliRkgvQnZNTHlDTGNwOUJrYVVpRWdram1Dd0dXNXBH?=
 =?utf-8?B?UXVPOXRPbjYxNVhnZnpIVERzeithc0M5VjJnY2VrU2VMSWNVTkFnWEtTdXdG?=
 =?utf-8?B?R3ZGMlY0cmREcU1WZkgxeWVITDQwWnJsS0t0K1lmVng4ZE1MVlgxU0JGMEJE?=
 =?utf-8?B?MHZ3c0YrV3JQNDU2V2tMeG9qVS9kVm8yTzdnV0NscEZ0N29RUlIzUEhGc0ht?=
 =?utf-8?B?c1g4VFVTWHlUOFpiQlBKWGhWQnFNWTlTSUNqSjM3VDdsbDljMlpyTU1jcXQ0?=
 =?utf-8?B?N3VvL1VZV1c1ZzJTbytxdkV4MEtKQWlwbTdSRy9mdm5XTXViM2ZRY3VJMTEv?=
 =?utf-8?B?OFllVzh5UVUyajdWOUNVdEEvU0JFdTdHcXQxbjQya0Z6NTl4L3dsMXkxZFU3?=
 =?utf-8?B?cFJ0TmRTWkZRUGRLTHJzcjN2WEEwZThSeGYwRkJBcUVyd3dlT3QwV2VtdlVl?=
 =?utf-8?B?SlBuMm9lcWFsM0xtVnRDanZ6N3ZiaFlTRHhKVEN1RWZqc1NsTVE5SndKZS9Q?=
 =?utf-8?B?T0REWjZZWGM0allzYjhuRnZtRStoeDMzbERJdncyckErU2FLMVNsQS9LUmlw?=
 =?utf-8?B?VWJpZDk4cnE3RDNqNDlVOU4rTzNmMFllWm03Y3IydTdMOTJ2akEyNWxRa2hm?=
 =?utf-8?B?bjJrdldBSjBlVXBOUWVqR25sUHlKcno3M2VDQlZvRndpd2l5NXhmRXlLdFFC?=
 =?utf-8?B?azFSSUJkK3d5ZVJmVTJCK2UxTG8yMU5jSENQZ0ZRMTRkRDBQUTV6VVVXNGhr?=
 =?utf-8?B?Rjh4TnVDdDluY210VHZwaDd5TzM5L3V0R1h6VjVlVHZ6YjBZNk4yV2tKZXJu?=
 =?utf-8?B?RGtvUzI4cTlVVkx2d3lqdHVOcXgzb1dTeEZPTmtpNGlVL2Jub05sWGVvbytp?=
 =?utf-8?B?RTZQMnZhd09uLzJ2VnBZNGtZbko5RDNXOXNxL3NKdDh2ekJ1cDZRMDFQK1JZ?=
 =?utf-8?B?ZTU5VTNUSjRGd1VxKzl2YWl0by9zYWxFQTZzaHJrbEMxcHhwaVRCSWZkOFBo?=
 =?utf-8?B?TTFuMFU4MC9Id2dpclFWa0tMcWcrRFVTVlVEd2NzQWp1S3FLRndDMDg5YXBX?=
 =?utf-8?B?WVdBSzNkMmxIa2R1VERSWTFOMW9CclM1b2xkZmtuemNNdlI3bHlFbXpkNjIx?=
 =?utf-8?B?Uk02UGhXY0wvbTBBejhZTzFTY3U2ZzBTQ29XekJMYks3MFBxRHlnM08vMDF4?=
 =?utf-8?B?Yk02bDh2dnRBNXgrbk5zVWN0bjdiTFl3L1Jka3hsclJuaTdPL05QbmxPT3Rk?=
 =?utf-8?B?Qjlka0pwWXF2L0hiWFc5WkxiZEM5aW1SaWtsNVJrRlN6eWRWajVFUHFHNjdZ?=
 =?utf-8?B?YTFveEhpQXVEVmVnWDBuN0pBdGlKK3pSMXNoREF0MWo4SFNDT0ZhZW9BNXlq?=
 =?utf-8?B?ZnB4MWZ1REFOZ1BETkFoczR2UjAxRFJvekR1eVhZdkUyWlRac0VndEtYM1JS?=
 =?utf-8?B?LzFPQk9XNXNrYnZ6UnJMR1hlVlc1eGpTb1lVejJSSmI2ek01U0V5K3o2Z2Zu?=
 =?utf-8?B?UDhPa2xMSUFvd3Vma3crNlVRUUZlbVZsREZ5eGxYZWhCR2FFcm5qcW9LSjJs?=
 =?utf-8?B?VFJxS0ZXNVBHZUNsaExxcGFUYTlBWk1Zc05uelI2SU8raVJWYW9qWmJ0aEU0?=
 =?utf-8?B?Mk4vZG1xZnFTZnBIN0x1eThUQURvUThJSFNXSDZkbGt2NmZJYzg0Z0M3aHBy?=
 =?utf-8?B?YWhoajM5NWg4STFxeUU2SktRUzlBTTAwUC9raTVjQ3V1WFlMZ1ZQYlZDWjhx?=
 =?utf-8?B?UXZOYkpvd0Rad2VNc3hDMWo5alB1aTgwaDBTbUt1cTd0bFQyTlI3SnNNZ0J5?=
 =?utf-8?B?VWpNZDV2T29kMW5Pb0hxZ3NVeE5UV1lUYWpDbTEzTjladUF6bjJ2b0tNN2xy?=
 =?utf-8?Q?sEoPR6dPcnThYM0tFt4A7Om4M5GfSgCIDPXTHjMfTMZU?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c9ce9f-4852-464d-e6d2-08dcce16d9c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2024 01:54:31.7325
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GeX7ksSHqVUJezgdEWGkRLlH2+MhLD3qdE6qMxCBDbIXLcMwMG9iI9nDzG6nENrg85dWgdm4m3nNF9H2NNQRLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6277

DQoNCj4gRnJvbTogWmh1IExpbmdzaGFuIDxsaW5nc2hhbi56aHVAYW1kLmNvbT4NCj4gU2VudDog
VGh1cnNkYXksIFNlcHRlbWJlciA1LCAyMDI0IDI6NDAgUE0NCg0KPiA+PiBUaGFua3MNCj4gPiBv
ciBqdXN0IGEgcmVnaXN0ZXIgZm9yIHN1c3BlbmQgdHJhbnNpdGlvbnMsIHdvcnJ5IGFib3V0IGV4
dGVuZGluZyBpdA0KPiA+IGxhdGVyLw0KPiBPSywgd2lsbCBpbXBsZW1lbnQgaXQgaW4gVjgNCg0K
VGhhbmtzIFpodSBMaW5nc2hhbi4NCg==
