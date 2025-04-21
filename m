Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54FA2571D0
	for <virtio-comment@lists.linux.dev>; Mon, 21 Apr 2025 06:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.148.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745216608; cv=fail; b=SnUewfxCf1L0UC8U+XGlC6sIJcialzoiMdlXe2Jvit5GiKcDcZxEi6fqyKRVYvAC39R0ycqeLF4KTRwALMyEPw4iO4vZkqJRjUfqMmdGrVkFY2pKTqSbDuTo3sHwllfZOP46zPupgXb90U24t+sEc4E9YKwa33zI3ASzVhxbv0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745216608; c=relaxed/simple;
	bh=vkTxSygoinHuTT3xXmItL1yFpEHEv1o5dk0ViaIYjRQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kXUQX+lwmXJS7UkKwI0ieJ9LONgXt+GV98jaO/RE26w7oz7X+5qEzeT6MjAM8UI+ONR7IhJjDXVQvjC7AmPjed+HdN6oMMW6GGhkGgcP0FGIAm5QmI9MShyFo/gjb0DAn4K/fKlrQToycpQ9GINHL5OCp14C6oZ1wqaMZ4WULQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=bcbb3sU/; arc=fail smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="bcbb3sU/"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KNGLpB001828;
	Sun, 20 Apr 2025 23:23:19 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 46496qah0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Apr 2025 23:23:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kUopjRwLsM841DqZQxBWszFqsCnSX9ujiPYPMlSiwVptAKKXAOXv1FubjJ5z3Kg+0kQNroYZVpfpM7pd/v2/DlJzT9oiT1zS54+Nps9NgPequY/o423Vz8Vi+4ULv8OtZ36jowweOeHbyNflN5W2I+aN5UnkyDfb1KMt7WrINaSwyj9wHjKiuOpPx8YzLMEISVjcH0kdKE6+BjJhfHNxEA6BvgNfcfxj+oMi4xFrgj/PMfysoMqov7FB4btqnVYy7BMvrKIo8Am9jZlKrs5bKw6YsBfv0eLjxv7LSY2S9aiVKQ+JHs5M5dlyMEGHwWiVjhaVHSxfzgtv3ny9AB+uZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vkTxSygoinHuTT3xXmItL1yFpEHEv1o5dk0ViaIYjRQ=;
 b=oS/xJPvHyc3Mg44dMmVXtnB4m8502IJF+NUGTjxrW+8K9BEPH0T8y/tLLd5XArsWEC4cSo3Hm9949D8A1olY3oEwlCJ1llobHHxKdPHmqtZ1GMYtKpizbpJTeGQsTsq8iia5UG+b3emn0a8CUDTYb/fERc0Y1SbfSYT1K6F3rvuE+A1t+zGprsTRcU6hzYBCpqVYvl2FXaDouSxX2BArvB+MKvi9m7f/CCbci0eVFRyfy+x+sWX1uEcPv+8nmivhShc1UAANEVv2EWuReQ9XcYMlBNA9LqX6UNBndI/Oz5ztZ867E16xUIa180EU8BIYLwobjPvkhwQTCPsPUY2Hew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkTxSygoinHuTT3xXmItL1yFpEHEv1o5dk0ViaIYjRQ=;
 b=bcbb3sU/j8M3+87+xv1gdS1rshcFQiJECxPZMHujxZT9AiTZbfeay7hJMpjtLWu5zYKfElWO2jCwAoa0xh/KQYPyL3EB1gnmCflj9vOIHMywwh8X+44Q3WCZeQYjUJ+ucSwrL4OT4sPOLpK8KuMwowE7Kixroll3dte5ZkBKAOw=
Received: from DM4PR18MB4269.namprd18.prod.outlook.com (2603:10b6:5:394::18)
 by DM6PR18MB3458.namprd18.prod.outlook.com (2603:10b6:5:2a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.34; Mon, 21 Apr
 2025 06:23:15 +0000
Received: from DM4PR18MB4269.namprd18.prod.outlook.com
 ([fe80::9796:166:30d:454a]) by DM4PR18MB4269.namprd18.prod.outlook.com
 ([fe80::9796:166:30d:454a%4]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 06:23:14 +0000
From: Shiva Shankar Kommula <kshankar@marvell.com>
To: Parav Pandit <parav@nvidia.com>, "pabeni@redhat.com" <pabeni@redhat.com>,
        "willemb@google.com" <willemb@google.com>,
        "jasowang@redhat.com"
	<jasowang@redhat.com>,
        "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: Nithin Kumar Dabilpuram <ndabilpuram@marvell.com>,
        Jerin Jacob
	<jerinj@marvell.com>,
        Rahul Bhansali <rbhansali@marvell.com>
Subject: RE: [PATCH v5] virtio-net: Introduce a new field to indicate outer
 network header offset
Thread-Topic: [PATCH v5] virtio-net: Introduce a new field to indicate outer
 network header offset
Thread-Index: AQHbsfH0LwEmzH5ic0a9gLPMNgMG07OtpwiQ
Date: Mon, 21 Apr 2025 06:23:14 +0000
Message-ID:
 <DM4PR18MB4269F73B786E83EF68A70F37DFB82@DM4PR18MB4269.namprd18.prod.outlook.com>
References: <20250401195655.486230-1-kshankar@marvell.com>
 <CY8PR12MB71952A4DB7191843654451C2DCB92@CY8PR12MB7195.namprd12.prod.outlook.com>
In-Reply-To:
 <CY8PR12MB71952A4DB7191843654451C2DCB92@CY8PR12MB7195.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR18MB4269:EE_|DM6PR18MB3458:EE_
x-ms-office365-filtering-correlation-id: 6587a5aa-dc0c-40d1-7ff6-08dd809cffa2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?M05VRTdZbmRDMWVwaThuUE4wWVdybnpKaE1NWWhzV0FBUTg2dFBqRVgvMG9j?=
 =?utf-8?B?SU8xLzdHUGM4NlBsQzZrNjNESE16bFF1UWlsanVhWVhCbU9xUnRGUHpCL2M2?=
 =?utf-8?B?dGlnZnNRUlExSGRKY2NsYUdmclRYd0kyNzc5KzJsOVVjWGd5MXFiYVpuZzdr?=
 =?utf-8?B?OXI5UVpseTREQTVHUG85VGpOTVEyell6dU1SNlNpNjJtNis4YURVUjkvcWVo?=
 =?utf-8?B?WWpJcFBieDQ3SnJMczU4TzRPYjVxMFgreXRXZ0FCc2IyZDdjN3pCdU9RVnN3?=
 =?utf-8?B?TGRuNjJhVDcwRGxTWDFvZzR1QkllMXdNRitLUU94Y2FINWxtYVp0Z2VZanFp?=
 =?utf-8?B?VXhkbFJScWhPeHhrNGtrQUdDMEpjbXJmZUMyUGN4UFdoWThzRTJycytzRUd0?=
 =?utf-8?B?TmxxYlQrNzhHYW5oSmhma1kvLzZSNThmSkV0TUtEcGxmNFA5MEtkYVJ0ZE5Z?=
 =?utf-8?B?K1F0Q0o2NmZicEp6T1gzcmpDc2RPTGtpUnE4NmszVUJpQ2Q4WlFSd1hDazR3?=
 =?utf-8?B?S1Vpbi9pWlFlSVl1T1BnUlZUVk00ZnZ4SjJrTXRoVU9SRUR2Tk5iTU4vanVT?=
 =?utf-8?B?M0lXRDA1QVE1WDd4WjMvb0NXUlIyZnMwLzYzRnQ0RjNUS3NwSlJ2VzVzQnFp?=
 =?utf-8?B?REJlTyt4cCtFeWRXQ0dpT2xtT0hscVdQcTcvdEZydzZXZERrdGtOT2ZUcE1N?=
 =?utf-8?B?MWNWK29nRERMMjcvVDIya2FINVVxR0l4emFZSXlVWUs0ZDlmVjJPQzl3SHQv?=
 =?utf-8?B?cnJiVTN1MnB1RUlpTnBaTThHSG05NjdRNGZIOTJ3V2lOYTlJbzRYZmtOK3F0?=
 =?utf-8?B?ZXJCVVRMeTd3U3dWRmliOWZXUHg2NW1XWXJrdlRkTjBYQmZmNWVnWlc0blhi?=
 =?utf-8?B?ZEVqWmxUbUFzdG02aUtlWFBFRUZ5UjRYSGNrRXk1a3F2bFd2ZjdpbWZOckhK?=
 =?utf-8?B?Rm43Ynl6SFgzendsYnB1WUY4UC9YYmo1YXpobUFyQXJHekZ2WFRHaktoSWxM?=
 =?utf-8?B?VEZQV2NkcmNiUVpLWmZkQXRuQWJYRmM5bDU5RCtNTWw0UkNRMEpYWDJpc1ps?=
 =?utf-8?B?Ykh6M0ZxQ05Fb3lHWkVvQ0tUNUFiWUhhbjFoRDMrazd2THhlN281eS85RjZP?=
 =?utf-8?B?SlpWOHh0cERPS2ZlVUljVnBtZmRxVDI0T1dRSWRiWm1oNWFWaDBNNy9hQ3hF?=
 =?utf-8?B?R1RUTnArcTlSNmJxQnJwS1NNS2U3ZlRObWxLUmpUeG5vSjNiYkpyamFob3Jv?=
 =?utf-8?B?ejhsMGwvN2E3eFRlUlNWNC9RR2VlMXBleTNOQk1YUzZYWWFlWFd3Yjd1QnBR?=
 =?utf-8?B?M1RVQjAvdnRUQjBDYjMvWWx5MVdVbXpPRlRlNkRSRGU1UmQ3VHh2WGNTKzVa?=
 =?utf-8?B?M3R4T0tsN1k3WlMzR1RJbHRNMnFjcUtMdDZZQUlONTBobmZmYUt3OTd0VEtG?=
 =?utf-8?B?N3lSekR5WW5tbXFOdU95K3pDdXd2QkNSTkNnejFEcGVGcGdaVzFGME5xdFpY?=
 =?utf-8?B?dHZYS1hTOXpycEFKYVRXaWgzNURCVzRENDcyd1FKbjE3RWIvV2VoRHQ5MkYv?=
 =?utf-8?B?ZnMxWTVxODRKalcwSVBsbnZqUWdKMDhFWDVRL3grU2NSTVpFWkEwa2ZydkRU?=
 =?utf-8?B?enoxVVR3WFNmdWNZNG1YaHdqNHBGSTZsS1JGaGJrVnZud1hLMGxncmMwYzlQ?=
 =?utf-8?B?a3ZmWkxGeWRhaUxUTGQ5elVJdU9BbFUwTHA3K1Z5elZUYXZGUWtSd0lWdFNF?=
 =?utf-8?B?RVpIOEVaUEpFSFJMRm04T1FZNm9QNS9Ub25VNG9nWmtTQ3M1WnJvQUZnUWRy?=
 =?utf-8?B?aTN6SEFqSjl2U3Q4c1orSE9kQkhVZ1NCSlo1S2xlREhTV1YyT2lJcXVVK1Zv?=
 =?utf-8?B?dERFcVBROFNpbTNlOHU3VmIzWFRCeHdDVnB6WXgxQ1FhcWxpUW9QeVVsdFlF?=
 =?utf-8?B?aktoaTVpUFRGZ1o0MlR3QlNiUXhBT1hYWlN2Sk9wYW02c2hCYnhoMDhYTCtT?=
 =?utf-8?Q?WJ46/TLyFCmCEMHgZ5wfPlQJl6BQfQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR18MB4269.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NFozUDFkdTJud1g0M3J0c2YyN2hZL0FEbC8welNwbit3dzhwazhxcnRaaTE1?=
 =?utf-8?B?elhEb0hnWFNyaVhXRCtkNjltRDdXeU44a0MxR00xWDBRcEppcDJueGc1OWQz?=
 =?utf-8?B?WU4rOFZjYm45Zm9OZGlGZ2YwbW1wS3gwMy94UDV5Qi9kNituWStMbTRxaUhy?=
 =?utf-8?B?MEFUN2YrNzI0S0JDcFdSbEFNWHNwMnZLVUQ2THVhVVJKUUdWZ1NuMVdOcVZD?=
 =?utf-8?B?eG5BbHVuVU51YXd3cWFMNkIwTGRmMEhNUHJ3VDZMVEw0bHV3YlFwcWpBZ2hD?=
 =?utf-8?B?bzFrTjFEajNaRGo5MHVvSmhDc1NuQmRvSWFyUWswWHpORS83emdlUWx2MldR?=
 =?utf-8?B?SWh4ZmRpWGlpRWZGYUgwb0FyZ2xxWmg5cWVocXNkN1VCbGV4L1N5TUFaY1FF?=
 =?utf-8?B?cnMrV2VQRU5yQXMwWHdHOEd2TFFIdzA5Z3RvY3RzcEMvdjBDK1VjVGJETm9T?=
 =?utf-8?B?cHBaZTAzS0ZvT2NXZ090TjY1V1JpSk10V2FQMGR0dEg0dXlqZHZDdUpZallQ?=
 =?utf-8?B?azloRkxkS0VuL29kenVSdEZZWURJYzRTZU1VR21mcExwcHZRNG5Kbk9rRjM2?=
 =?utf-8?B?dEVpUjNkUFBLblJvamNsekRaT0lEbDR0bHI4NXg5VnVLamFqNnF2SjBuR1Rv?=
 =?utf-8?B?NFA3RTBuWVlGbHRIcUo4Y3UwRDNzajUwZVEzR0JqN1hNL1RDN0h6eWRMSnFl?=
 =?utf-8?B?elB3OG04cTZWdVZncXY5Y20vdGg4QUlLRFo4TE40YjdpM3RpOXJkc1JpV1No?=
 =?utf-8?B?V1Q2allDOXdBVVRWZy80SmtFSW5HWTNpMStPZWk0VmFhQUQvNjZYekwvR09E?=
 =?utf-8?B?czJNUGEvb1VqbzZ4ZWoycS9ING9aK3lTc0pDaXlJMXBVSVBNbWhkVzNYMFpU?=
 =?utf-8?B?Y2dwMi9Wd255YzNiWFhCWXB4VURRVEFjb0JyZkkzUCtsaGlOM3JTWDdBQ1Nu?=
 =?utf-8?B?dzl1SEtnWnM0QTUrcUd0UkRSay9Fa3VkODZWS1BZc2k3YTE3U3hZWlY2T0Qz?=
 =?utf-8?B?QWVLd1FzcEtQR0x2a2VqRGhkY25TanN0VGNOTlhnN1dvc25JWVFnb3pEUTdq?=
 =?utf-8?B?WUhHSTVrNWdHQ1lJWkZuZURpQXIyVVJIUnFXVFZCWHBSVDhiWml4NzZQcUF5?=
 =?utf-8?B?WlZTSjVHQk1xdExwVUtJRkhxNWRNRkdtYTlRTkdQR2pucmNiamM2THJHMnBX?=
 =?utf-8?B?MHE2VmZKcjJJMXBXS2x0RWVlcmZzQ29JOTJDemI1KzJIa2pZMU8zK0laZGNV?=
 =?utf-8?B?cVEwcmk2eHFoMUdFTDFQbFU3SkNrYnh3ZVR3NnBGcVE4MC9aN0RxcDRYakVV?=
 =?utf-8?B?M0xFTndnRkJBbHJJUFFGbjlmZjVLakVBbWZ0VTN1Wi85NjJYbHE4d3BaUkM5?=
 =?utf-8?B?dTlKMC9jNll3OXBHc2d0U1JWM1NPdnNtd29uTHpwSFdqRXIxRmZJc3Zsa1ZR?=
 =?utf-8?B?QWlwWEpGVlZGZjdPSVRSSkVKQ3lDYUtmMFhXT0NwWk5EeVF6bHE0ZEpKbHZp?=
 =?utf-8?B?RXI5K0gwdGpNYWRBV0RFK2hDY0I3RTNLSUR2UlZVNklrTmd2c3lBZUhUOEVN?=
 =?utf-8?B?NHVmOVFJaWdQc2p1a3hoTTRMZEpBRTRBV1V5UHVEWjZmRFp4b0lUU2pKRG5S?=
 =?utf-8?B?MEZ1djcrTGZTQ1FQUlpjZkhaOE9KN3hTeExxVC9iZ1pGbi85N3RheGpZSTV2?=
 =?utf-8?B?SWFyK0FOTnhpNVA2SkZZTWZmQ2xFem4vbUpaU2Qzd2lTS2pxOE8ydnRRaTEw?=
 =?utf-8?B?YlFqSlAzQTlGMnd0RTNRQ3UwbGJaNTM0TmJkRnRpOVpMUFdyMnRBVnArVGdU?=
 =?utf-8?B?UmRZaTk1bUMzYitUMnBUempnakVoQmpNc2xHUTlTVUMvZitLTVNvV3hYanFo?=
 =?utf-8?B?aCtTMnVid25EV1BXRHduZzB2ZGRsMHVFMlRqVHo5N0o2VlU1Z1RCY09DSlQz?=
 =?utf-8?B?cTdVOFVGSlQ0bzByaWVCdEphSWFMYjlYY0lpdlFFbkN2a3RjZDAvZHBiUDRt?=
 =?utf-8?B?N1Q4SmxVUVNnN25SVGdYcVRBbXQrTDBNT0RpK0RZdWRxdFE3dEFySERObGg0?=
 =?utf-8?B?RmpIOGFNaitOTXkxZ2x1SWN5NDRJbElIRWowaUdZdzRXY0pianVFQ1hLVDQz?=
 =?utf-8?Q?r1Qmf44B/mLPp9TeSTu21XUzF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR18MB4269.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6587a5aa-dc0c-40d1-7ff6-08dd809cffa2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 06:23:14.8073
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MpNazug7hNYfrZ/o10REeNW6SyDyQTOedfgLKF800PgmHQgwygl8JAlWfkICzCuYjJATSAqWeJ8Zhiinnu7ePg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3458
X-Proofpoint-ORIG-GUID: PkxFPNTkTMQdeEC_DxT3m3Tw31M7jYxS
X-Authority-Analysis: v=2.4 cv=LoiSymdc c=1 sm=1 tr=0 ts=6805e456 cx=c_pps a=2bhcDDF4uZIgm5IDeBgkqw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=-AAbraWEqlQA:10 a=NEAV23lmAAAA:8 a=Ikd4Dj_1AAAA:8 a=0-8sbPPrZAtfp4M1mVMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: PkxFPNTkTMQdeEC_DxT3m3Tw31M7jYxS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_03,2025-04-17_01,2024-11-22_01

PiA+IC0xMjE1LDYgKzEyNDEsMTEgQEAgXHN1YnN1YnNlY3Rpb257UHJvY2Vzc2luZyBvZiBJbmNv
bWluZw0KPiA+IFBhY2tldHN9XGxhYmVse3NlYzpEZXZpY2UgVHlwZXMgLyBOZXR3b3JrICBkZXZp
Y2UgTVVTVCBzZXQgdGhlDQo+ID4gVklSVElPX05FVF9IRFJfR1NPX0VDTiBiaXQgaW4gIFxmaWVs
ZHtnc29fdHlwZX0uDQo+ID4NCj4gPiArSWYgVklSVElPX05FVF9GX09VVF9ORVRfSEVBREVSIGhh
cyBiZWVuIG5lZ290aWF0ZWQsIHRoZSBkZXZpY2UgTUFZDQo+ID4gc2V0DQo+ID4gK3RoZSBcZmll
bGR7b3V0ZXJfbmhfb2Zmc2V0fSB0byBub256ZXJvIHZhbHVlIHRvIGluZGljYXRlIG91dGVyDQo+
ID4gK25ldHdvcmsgaGVhZGVyIG9mZnNldCwgaWYgcGFja2V0IGNvbnRhaW5zIGEgdmFsaWQgbmV0
d29yayBoZWFkZXIuDQo+ID4gK090aGVyd2lzZSwgdGhlIGRldmljZSBNVVNUIG5vdCB1c2UgXGZp
ZWxke291dGVyX25oX29mZnNldH0uDQo+ID4gKw0KPiA+ICBJZiB0aGUgVklSVElPX05FVF9GX0dV
RVNUX0NTVU0gZmVhdHVyZSBoYXMgYmVlbiBuZWdvdGlhdGVkLCB0aGUNCj4gPiBkZXZpY2UgTUFZ
IHNldCB0aGUgVklSVElPX05FVF9IRFJfRl9ORUVEU19DU1VNIGJpdCBpbiAgXGZpZWxke2ZsYWdz
fSwgaWYNCj4gc286DQo+ID4gQEAgLTEzMDIsNiArMTMzMywxMCBAQCBcc3Vic3Vic2VjdGlvbntQ
cm9jZXNzaW5nIG9mIEluY29taW5nDQo+ID4gUGFja2V0c31cbGFiZWx7c2VjOkRldmljZSBUeXBl
cyAvIE5ldHdvcmsNCj4gPg0KPiA+ICBUaGUgZHJpdmVyIE1VU1QgaWdub3JlIFxmaWVsZHtmbGFn
fSBiaXRzIHRoYXQgaXQgZG9lcyBub3QgcmVjb2duaXplLg0KPiA+DQo+ID4gK0lmIFZJUlRJT19O
RVRfRl9PVVRfTkVUX0hFQURFUiBoYXMgYmVlbiBuZWdvdGlhdGVkLCBhbmQgaWYNCj4gPiArXGZp
ZWxke291dGVyX25oX29mZnNldH0gaXMgbm9uemVybywgdGhlIGRyaXZlciBNQVkgdXNlDQo+ID4g
K1xmaWVsZHtvdXRlcl9uaF9vZmZzZXR9IGFzIG91dGVyIG5ldHdvcmsgaGVhZGVyIG9mZnNldC4g
T3RoZXJ3aXNlLA0KPiA+ICt0aGUNCj4gPiBkcml2ZXIgTVVTVCBub3QgdXNlIHRoZSBcZmllbGR7
b3V0ZXJfbmhfb2Zmc2V0fS4NCj4gPiArDQo+ID4gIElmIFZJUlRJT19ORVRfSERSX0ZfTkVFRFNf
Q1NVTSBiaXQgaW4gXGZpZWxke2ZsYWdzfSBpcyBub3Qgc2V0IG9yICBpZg0KPiA+IFZJUlRJT19O
RVRfSERSX0ZfUlNDX0lORk8gYml0IFxmaWVsZHtmbGFnc30gaXMgc2V0LCB0aGUgIGRyaXZlciBN
VVNUDQo+ID4gTk9UIHVzZSB0aGUgXGZpZWxke2NzdW1fc3RhcnR9IGFuZCBcZmllbGR7Y3N1bV9v
ZmZzZXR9Lg0KPiA+IC0tDQo+ID4gMi40My4wDQo+IA0KPiBSZXZpZXdlZC1ieTogUGFyYXYgUGFu
ZGl0IDxwYXJhdkBudmlkaWEuY29tPg0KDQpGaXhlczogIGh0dHBzOi8vZ2l0aHViLmNvbS9vYXNp
cy10Y3MvdmlydGlvLXNwZWMvaXNzdWVzLzIyMg0KQ291bGQgeW91IHBsZWFzZSBvcGVuIGEgdm90
aW5nIGJhbGxvdCBmb3IgdGhlc2UgY2hhbmdlcyA/DQoNClRoYW5rcyANClNoaXZhIA0K
