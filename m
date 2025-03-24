Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00520265CCF
	for <virtio-comment@lists.linux.dev>; Mon, 24 Mar 2025 17:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.148.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742838582; cv=fail; b=JhXLqq1F39qk3tmMItp84Mggc9E9tIktnInJViYNNeobprkizt+kJ8v4X9MPjkxZOgepHtxadhqLZ87V89l73tMr/XZng0MeBfJdCkcuelMw9NE3vX0GJh9MeoOlE39xAdmswx03Ci10qH2x5mg9LZyMKp8ENAhYc9atlmxHOHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742838582; c=relaxed/simple;
	bh=khc8o4qUY6PLvkr9T1Q5qjynI78q2mYXRe9lrZ/wkqg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=PFBdbXr4G1s1TU5XyIz9rV90QfaCed5W01ry1zYfqMDnr3MXfLJWUyufeQa8mbuzjQC56vQGqOVJsTFNPDiPV0njEe3ihNQkkAYA5InJwiBNux76CcjMjypAH6aeiR29JC1BKdXWImQ/7+zGa+oc/G850bK5GpYpwfjlC46RkBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=fail (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=psGNHtbN reason="signature verification failed"; arc=fail smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="psGNHtbN"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O9pe9U010553;
	Mon, 24 Mar 2025 10:49:37 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 45k548rxf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 10:49:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uQzuAAWCFzjZQnJ/0V9/F6+sZtMgY0IR9HX+uwUkOSLBcyKTuf2uzcx7QuAwcqcWF2/2g+UM1Sj3kqRA/oJynxqSqm/HVEPZ/gTxsMjIaKFzJWVfYk3snFwwtTHz5tH1oWwZvG+ahq+sJQxRu/VOW13UgKOMfS47ZrgcyVz7xsBy36QeORNnjOO8XH54XsPOkPlE3QPLXWVwvsklkWp+3Lb4iMfh0eNe7y8C0NH3JhYNh4Ely8Ufa54PvpWdX/UoEZriNGwgGkmLKht4wzcwW672muilVjH4Ac7tYv2YZQcRpsysEJl+AxiwFt0+aLIanDk250TYXKAiBw5M5071Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IiCQulEXTJUoaYDwT6ZFLGUmlcFFjQM3becPZWtDmsE=;
 b=XjqHUwAeh50DxvvNVTrvqGad3CmocauOjrRMmug47qtTQvnTX5l8A+cpDnkcwXuAC3mT6HTrhSK5sp8t0Ym4oP9ejPBIUh4IqpO98gouLRSnzG54H7IpW5ZIWoxxLpSGGXC4qnHpO9fyieU+iCimSkJzSR9rb8EXSP42W+9gN7u4+FMZHNWcn5Lz+AmHCy9ynWtXyaqVr/lmVpc/naaZWCghqxebaW6rEqLr1UXCxvGeFhGHaGzQOycSsCWj8I+ivA8B7whmJvmEbM4qtOQwTo/44ufH0KT2UONjbGJrLtlV5SUbdG4+KFt3RDJ/PsYRueks66WzgfbQEy8jCD3KVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiCQulEXTJUoaYDwT6ZFLGUmlcFFjQM3becPZWtDmsE=;
 b=psGNHtbN6XBlxa7jVVzv2qJ1TD93dNTmIU5/gmef2ipgmbWKRXKhBdf6iToMST6SYF2DGf3UBfzf1mIlAmBKZMA7xQx6d07U0l0jCZ9VeddfzFILIBQo2887HxafR4qVynBpG9xpEUmMJd6A8NJqta3Tbt+E1JZKwrfKCj/InDU=
Received: from DM4PR18MB4269.namprd18.prod.outlook.com (2603:10b6:5:394::18)
 by SN7PR18MB3886.namprd18.prod.outlook.com (2603:10b6:806:108::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 17:49:33 +0000
Received: from DM4PR18MB4269.namprd18.prod.outlook.com
 ([fe80::9796:166:30d:454a]) by DM4PR18MB4269.namprd18.prod.outlook.com
 ([fe80::9796:166:30d:454a%5]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 17:49:33 +0000
From: Shiva Shankar Kommula <kshankar@marvell.com>
To: Parav Pandit <parav@nvidia.com>
CC: Nithin Kumar Dabilpuram <ndabilpuram@marvell.com>,
        Jerin Jacob
	<jerinj@marvell.com>,
        Rahul Bhansali <rbhansali@marvell.com>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "willemb@google.com"
	<willemb@google.com>,
        "jasowang@redhat.com" <jasowang@redhat.com>,
        "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: RE: [PATCH v4] virtio-net: Introduce a new field to indicate outer
 network header offset
Thread-Topic: [PATCH v4] virtio-net: Introduce a new field to indicate outer
 network header offset
Thread-Index: AQHbkRDdNt93Af1nh0qaO0Wx8l0cqLOCo17A
Date: Mon, 24 Mar 2025 17:49:32 +0000
Message-ID:
 <DM4PR18MB4269E1366FFDBEE473BBEC9ADFA42@DM4PR18MB4269.namprd18.prod.outlook.com>
References: <20250304075955.208450-1-kshankar@marvell.com>
 <CY8PR12MB719599491B05CAFF67EAC19DDCD72@CY8PR12MB7195.namprd12.prod.outlook.com>
In-Reply-To:
 <CY8PR12MB719599491B05CAFF67EAC19DDCD72@CY8PR12MB7195.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR18MB4269:EE_|SN7PR18MB3886:EE_
x-ms-office365-filtering-correlation-id: c7c81109-34b5-40a7-7818-08dd6afc3c23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?M05FNzgyaHZ6Qk5JQm52aFExRjRsZFp5OEpFUDdqd2l6Q2s0VVlvQnBwV2ZC?=
 =?utf-8?B?dW14RVNpOXNaY1NDSWlkaUk2eEd4V2FTS3dwZnhvZnN4eDdjck1ueE9nWHpC?=
 =?utf-8?B?aDVvN1JMVnNxYUVRUHhDWmFQdmFIWTZkSENjeEw1c0YvNHkzWjh0VWlGL015?=
 =?utf-8?B?eURZb29CNTE5VTJlMzVkV2FHOEwvWmVLZmNZSVhlY1AybmVTaG1SMWhHdFht?=
 =?utf-8?B?Q1B0ZW9ncjZKK0NrTGtoV3JuUUdHT05sWGt0Y0pyazlLOXora0s4bG5RSU9S?=
 =?utf-8?B?ZUxPaW9TWGNlTG44TmhiSk4xMWtzUzA4aCt3RGYyY2dialZjUDh0Uk4rbWZB?=
 =?utf-8?B?NTJDeW8xOUFacUhCUDVRMGZ6dmlxd2t0RyttQ09ZbVNhZGhweHlkUm04VWho?=
 =?utf-8?B?d1o5M1F2R0h0dStINXg0TVdEaGpvWDJLSDQ2WnBZMmlpaVk3cGpkWmZQVDUv?=
 =?utf-8?B?NVZ4d1NhYk8rdEYvVXgzMkwzOEo4YzNzeEpkU1ZzbTFabGVha2xaNjJJZjdz?=
 =?utf-8?B?ZVJTQkN5ampvRG9aVXVMcU0vcUF2MDRoaWlnYWF1OXh2Vk1MSWREUjZSOTM5?=
 =?utf-8?B?aTdaK3oxQ0xNODNXN2VoTDB3aDR0Tk4vTHFXRTBRWkVObkNEb08vRm1McDZB?=
 =?utf-8?B?bXBad01xNFczM09majZxRFYyekNHWTZoTmgvMk82a3llU1lFVzB3cWVzMlpL?=
 =?utf-8?B?bnBZblBPTENJdThmNGVValp6Tkp3elBaL2NEREl1VkFBK2FWL1lmOVVoemlr?=
 =?utf-8?B?S0tZZ3pZVEZWZlR4MjZ6RVdjWjFZRk5Gc3BTdHQzQkYrekN4bEhLeDNVclJU?=
 =?utf-8?B?dzBFOVVWNWpSLzBlNkI3VXdCWEhEYkpVSU5pVW9aVVFPcHQvS25RdE5uOHd2?=
 =?utf-8?B?RXVYbG5ISm9jRWF5OEJBeHh3VjNrRU9rZkdRQlBGNDZpc0MwT29ValQ4dk8w?=
 =?utf-8?B?TGNrQUE4ZUNSYmkrSzlUOEdWRHVZME9qTnB5WEtqR1lkaTBUK0lDdHh5UFli?=
 =?utf-8?B?NW5rLy85Wm10Uk8rS0p1dC8xMWN6MDR3NXRlcXRGZnhkUWxjbDVxOXlGSWk4?=
 =?utf-8?B?YlJicGdrOG5pYlFra2RTZDd0SnZEYXRkeDkyUW4zdHFaMllBNDVoZUx3MmFm?=
 =?utf-8?B?ZC9URXN5bmdPUTRlWnJhU0lPbXhFcktEV2V0VU9LNm84TjdyYnJ6U0RncTlL?=
 =?utf-8?B?V3JnczRRTWhUUlJzZ0hXbzNJakw5aU4xY3F2SFBhcTcrVWRkekNkZXRPMUJw?=
 =?utf-8?B?Y0cxOE1CSjNMN2RMS2RLZGpBWUFsQ0h2Q0oxTS9WRVRYOFZjTHVLeGJicXp5?=
 =?utf-8?B?aUlRdWFYY0Y4dFpESGd3SFM4KzBWbG9WOGNLckdZM3IzNnh6U010a2l5c0N1?=
 =?utf-8?B?Q3lvYjJmZmh6MllXQ25LOC9XdERVT2FhOU51ODZyN1k0VHRYL1ZFUWFuODc3?=
 =?utf-8?B?cU9LcUw2cjJCYVpNZTN4TDNtZzRwRm9WaFN5cWFvUjdmOHlTemk1NUJ2QlBr?=
 =?utf-8?B?QlgzSWIxOE84bVF4bG81R29xQjdtb3p0Zm4rLzlMN0U0ZFo5ZUN2NXRMZHJa?=
 =?utf-8?B?dmQrK3lyZU5wamtjVEFPV2lGVlJrT09rZVJ2bGdOYzllS2VXRldnR2V4ejln?=
 =?utf-8?B?ZWdUamQ2Sms3VW1BSEJxQ1JKaWZwNkMyNzNhdHpkSmdUcWV6OXZ6OWtnOU0z?=
 =?utf-8?B?ZFlOMlhJQ0hhbzNNUmYzY1NwOW5qeVhVdkpYRmMzN2J4S3k3L0s4VWovc3U3?=
 =?utf-8?B?bXRjQ3Y4aElpOG85UCtleDkvUWhMOXJLMEZBUFhtMzhZZVhvM2w3SXpNVllN?=
 =?utf-8?B?RzJ0U1FEUHdDWkVpTkJXN0tOY202c3VCcUtEaERpbkNuN2s3NXU3S3ZISUIr?=
 =?utf-8?B?bkt0V2ZreUZKaS9qL0NsS2NFaS9Wck5Ub0xkMnFhdmd6OVE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR18MB4269.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VTZpd0xvYmU5eVB6NGJiWVJ2SU1KWEdUTmM0TUdIMjF3OU5LeWdvN1VvMlJD?=
 =?utf-8?B?WVdiaW5LK1ZPNDB4cjdFT0pRUXZDYm8wUGRMYjJ2ZTFOcno5c25raklPQnVC?=
 =?utf-8?B?Rk1YSnptL0FRQ2xGSGU5TStpSUk5c1pMR2lESDFKbXhwb2tQaEZaQnRzcDBt?=
 =?utf-8?B?VFpPdGx4VENOZllJU2JkbEFtTXMybExZTVgrTHZNZVJWNThINjhVV0QwZU16?=
 =?utf-8?B?YkZuN09qVzBPUEhWcERFUEF5akcxaTZWaTAvNFhVOXFFNWRXUEorYzBXMFBO?=
 =?utf-8?B?V3BpU2pSMjNOR0FBNll0ZnBweldrWVNtQlB1UzQ0cVczRVNzQ1JBSFJta1Zq?=
 =?utf-8?B?QWo3U1plTEEvOEUzejVXanp1dERpTGxqbG1pQXQ5eW5oa3ErcTgrS0h5d0Mx?=
 =?utf-8?B?Z3l4Z3RmYWkvNXVGaHdHNVBsN0tBVzZUaDZZdjl2RUFIRWhrYkdGaUlBOHA5?=
 =?utf-8?B?WjVhRnUwdXh1M3llMm5iSjJ2Uzg1ZVVlYWZkcjUrYmFlUGo0Y0ZmQ204R3c5?=
 =?utf-8?B?TkNXTUZwakFucFRkR3YzWjRMSDhyZzEyUDJEdGNLN2JWcEl1RXl2L1RhOUZ6?=
 =?utf-8?B?ZzNNSmF4SWRKZjRkbXQ0Uk1vVjkwTWI1U21FVEVQTG9Ga21IOFl5aSt3TWZo?=
 =?utf-8?B?SG81OE5tRm9ieFlFUXdsdjhPM090QkFrYUZsaWc4YTBoNlFYeDlxT0hiR3dz?=
 =?utf-8?B?WUMwcVFya1ZnWmhRaFdJa3hNTFNBTUtFNXVIcnFzZE8xY09pU0dUYm9TTkpB?=
 =?utf-8?B?UFRMQ0tJQnFIQ2J0aUp4RFQ5UWNwTjVnSmRVYm9VMVoxRGF1cU9GbnNQYmY5?=
 =?utf-8?B?aUo0d1dOZ3lHWWdFL3g4d1R3TG1BejNHazZJV09FUnI0VENxbnpiN0lEQzRy?=
 =?utf-8?B?UXNrOEp5S21WbVVvY0FEaWtUOThvaVZuTkdHK0RvejBTczg0aDA2QW10TjdX?=
 =?utf-8?B?dndPRUJtZ1RVUlFqbTlscWJaUzJCWUFSb3EwTHhyMUJuc2dub1A5anV5dUV3?=
 =?utf-8?B?S2dBY21waEdMenlrMU9HakFvcWFBeHdXWURMci9sOUdhYWpiWUVraytDVE9L?=
 =?utf-8?B?Q1VLdkd3NGtuY1huWnlud3ZHbWpjMjA1SUFXckRQbDdndG5VcStNellnRHpu?=
 =?utf-8?B?WW16Z0VoVFFUQW1HWXBsSGJjQWlBRWNoL2s1aW5iRytXTFozWkpnOW1tcitB?=
 =?utf-8?B?Kzh5ZG1yU3BUUmw1LzIyNWF4MnZBYm44dVd4U05kb3ZPcm5vdlI2clg0bzJa?=
 =?utf-8?B?OGV2L3JqdUxaRXBJVm9rZGRzMmNGYlc2ODJBb0E5cEw0Nzd0L2tjcWc4bjEy?=
 =?utf-8?B?UVFjc1R3OFVLai8vS0loR05tdmtwN3p0UDdSVExLUm9yZ2RqZHNJT1B1M29U?=
 =?utf-8?B?TWx3YXRjK0N3L2h3R1RQZU4zOW9kNENCOFIrS2o2OHVYdnJuYnJ3ZlRRcEpW?=
 =?utf-8?B?Nkw0ditPUHhRZ2x5Qm43N21QSC83b1UyLy92Uk9VK1BPMENoWkxtSkRWaGF4?=
 =?utf-8?B?ek1VSlFNWTNFc2x5UVREWjc0Z0R1bWQ5dFFYRG1MZy9TNmF0WnRTZStFUTU1?=
 =?utf-8?B?RHNzZUQwaXBKZ09zMklydGZlaVFKQWlRY1FEZGJhWjNFSUg4S3VyS0phNUgv?=
 =?utf-8?B?alIvVWMxdFZRblRYNTl2ODFCTFdrZVBZNTY0TVJ3MlBwUkZpeVhnTFR5QWsv?=
 =?utf-8?B?Y0lsSEdoeFNIcmV4OFhPVmtyRXNaS2ozdmcxWjM1WjBQNzB0S0JZUnl5M1U5?=
 =?utf-8?B?MEdWeEJzODlEQWJxdHFlakFBblpzS3V6TStXRWNhbWpnVU8xS3lDYlhFT0dh?=
 =?utf-8?B?YXRJVVZVRTBnUlNCcFlHZUt1ek9xZU1Ed1I2RDEyN3FCU2djalNYRG1Lc2dn?=
 =?utf-8?B?alNyVSs4WDdpd2cwUE5xWnZrN3doaEpLQTFLZkFiSk5pMysrT0poSFREWVpQ?=
 =?utf-8?B?b0U2UTVhS1FYcGR0MTJwSk0vYnNzK1VGNHhHRFB5UDdsNDVyVHlhOFF0TXNi?=
 =?utf-8?B?SUlUd3E1eWpKSXFZTDhJOEt2bnRiVFJiSGdtY2c4Mzd2MEVmcnEwOWs2MVRP?=
 =?utf-8?B?ZzBmM3A3dmZRVlAwVjZiQkEwSVVHNUNzWVdsVWM2aXFSR0xUa2Z6Y1o3aVh0?=
 =?utf-8?Q?nBnwIlf7ISCyzl5EJKClm9Fv+?=
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR18MB4269.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7c81109-34b5-40a7-7818-08dd6afc3c23
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2025 17:49:32.9043
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Tey7rQEdMAa9UXEGLGkUgw5dA9fuxU121Q81+Pl9u0vdVyIC41l+SMh0uCd3weeEYqQndubrnG2tB/8j2O56g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR18MB3886
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=av6yCTZV c=1 sm=1 tr=0 ts=67e19b31 cx=c_pps a=PK5aExQQjalka8oDlC/sVA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=-AAbraWEqlQA:10 a=RpNjiQI2AAAA:8 a=Ikd4Dj_1AAAA:8 a=M5GUcnROAAAA:8 a=20KFwNOVAAAA:8 a=1XWaLZrsAAAA:8 a=m86zv8DrBgqYevwgJmMA:9 a=QEXdDO2ut3YA:10 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-GUID: R9SG_N-Spw4goWdr2la6UlWZz3xhIyt1
X-Proofpoint-ORIG-GUID: R9SG_N-Spw4goWdr2la6UlWZz3xhIyt1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_06,2025-03-21_01,2024-11-22_01

> -----Original Message-----
> From: Parav Pandit <parav@nvidia.com>
> Sent: Sunday, March 9, 2025 10:02 PM
> To: Shiva Shankar Kommula <kshankar@marvell.com>; pabeni@redhat.com;
> willemb@google.com; jasowang@redhat.com; virtio-comment@lists.linux.dev
> Cc: Nithin Kumar Dabilpuram <ndabilpuram@marvell.com>; Jerin Jacob
> <jerinj@marvell.com>; Rahul Bhansali <rbhansali@marvell.com>
> Subject: [EXTERNAL] RE: [PATCH v4] virtio-net: Introduce a new field to i=
ndicate
> outer network header offset
>=20
> > From: Kommula Shiva Shankar <kshankar@=E2=80=8Amarvell.=E2=80=8Acom> > =
Sent: Tuesday,
> > March 4, 2025 1:=E2=80=8A30 PM > > This patch introduces a new field in=
 the
> > virtio_net_header called s/virtio_net_header/virtio_net_hdr >
> > outer_nh_offset, along
>=20
>=20
> > From: Kommula Shiva Shankar <kshankar@marvell.com>
> > Sent: Tuesday, March 4, 2025 1:30 PM
> >
> > This patch introduces a new field in the virtio_net_header called
> s/virtio_net_header/virtio_net_hdr
>=20
> > outer_nh_offset, along with a new net device feature,
> > VIRTIO_NET_F_OUT_NET_HEADER.
> >
> > Currently, drivers lack a dedicated field to signal the start of the
> > network header to the device when performing checksum offload and
> > segmentation offload. This requires reading packet, which
> > significantly affects performance in data path.
> s/This requires reading packet/This requires the device to read the packe=
t in
> data  path ..
>=20
> > Additionally, some hardware implementations require knowledge of the
> > outer
> > L3 offset (aka L2 length) for inline IPsec hardware acceleration.
> >
> > To address this limitation, we propose to introduce a new field in the
> > virtio_net_header called outer_nh_offset
> s/virtio_net_header/virtio_net_hdr
>=20
> >
> > The outer_nh_offset represents the start byte offset of the outer
> > network header from the beginning of the packet
> Add full stop at the end of the sentence.
>=20
> >
> [..]
> >
> > Signed-off-by: Kommula Shiva Shankar <kshankar@marvell.com>
> > ---
> >  device-types/net/description.tex | 31 +++++++++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >
> > diff --git a/device-types/net/description.tex b/device-
> > types/net/description.tex index 8d30673..ca1242f 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -136,6 +136,10 @@ \subsection{Feature bits}\label{sec:Device Types
> > / Network Device / Feature bits
> >
> >  \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (68)] Device handles
> > packets
> >    carried by a UDP tunnel with partial csum for the outer header.
> > +
> > +\item[VIRTIO_NET_F_OUT_NET_HEADER(69)] Driver can provide the start
> > +of \field{outer_nh_offset}  value. Device gains advantage by not
> > +reading packet to calculate outer network  header offset
> Please add the full stop at the end of above sentence.
>=20
> >  \end{description}
> >
> >  \subsubsection{Feature bit requirements}\label{sec:Device Types /
> > Network Device / Feature bits / Feature bit requirements} @@ -599,6
> > +603,7 @@ \subsection{Device Operation}\label{sec:Device Types /
> > Network Device / Device O
> >          le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT
> > negotiated)
> >          le16 outer_th_offset    (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_=
GSO
> > or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
> >          le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_=
GSO
> > or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
> > +        le16 outer_nh_offset;   /* Only if VIRTIO_NET_F_OUT_NET_HEADER
> > negotiated */
> >  };
> >  \end{lstlisting}
> >
> > @@ -633,6 +638,11 @@ \subsubsection{Packet
> > Transmission}\label{sec:Device Types / Network Device / De  \item The
> > driver can send a completely checksummed packet.  In this case,
> >    \field{flags} will be zero, and \field{gso_type} will be
> > VIRTIO_NET_HDR_GSO_NONE.
> >
> > +\item When VIRTIO_NET_F_OUT_NET_HEADER is negotiated, the driver
> MAY
> > optionally provide
> > +   the \field{outer_nh_offset} value. A nonzero value of
> > \field{outer_nh_offset} indicates
> > +   a valid outer network header with in the packet, and specifies the
> > + offset in
> > bytes from
> > +   the beginning of the packet. Otherwise \field{outer_nh_offset}
> > + MUST not
> > be used.
> > +
> >  \item If the driver negotiated VIRTIO_NET_F_CSUM, it can skip
> >    checksumming the packet:
> >    \begin{itemize}
> > @@ -767,6 +777,11 @@ \subsubsection{Packet
> > Transmission}\label{sec:Device Types / Network Device / De
> > \field{flags} to zero and SHOULD supply a fully checksummed  packet to =
the
> device.
> >
> > +If the VIRTIO_NET_F_OUT_NET_HEADER feature has been negotiated, the
> > +driver MAY set \field{outer_nh_offset} to indicate the start of the
> > +outer network header offset, if the packet contains a valid network he=
ader.
> > +Otherwise, \field{outer_nh_offset} is not used.
> > +
> s/MAY be set to/MAY be set to non zero value/
>=20
> Here and few more places below.
>=20
> >  If VIRTIO_NET_F_HOST_TSO4 is negotiated, the driver MAY set
> > \field{gso_type} to VIRTIO_NET_HDR_GSO_TCPV4 to request TCPv4
> > segmentation, otherwise the driver MUST NOT set @@ -948,6 +963,11 @@
> > \subsubsection{Packet Transmission}\label{sec:Device Types / Network
> > Device / De  If VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} is
> > not set, the device MUST NOT use the \field{csum_start} and
> \field{csum_offset}.
> >
> > +If the VIRTIO_NET_F_OUT_NET_HEADER feature has been negotiated, and
> > +\field{outer_nh_offset} is not zero, the device MAY use
> > +\field{outer_nh_offset} as the outer network header offset.
> > +Otherwise, device MUST NOT use the \field{outer_nh_offset}.
> > +
> >  If one of the VIRTIO_NET_F_HOST_TSO4, TSO6, USO or UFO options have
> > been negotiated:
> >  \begin{itemize}
> > @@ -1102,6 +1122,9 @@ \subsubsection{Processing of Incoming
> > Packets}\label{sec:Device Types / Network
> >    both the outer UDP checksum and the inner transport checksum
> >    have been validated, otherwise only one level of checksums (the oute=
r one
> >    in case of tunnels) has been validated.
> > +\item If the VIRTIO_NET_F_OUT_NET_HEADER has been negotiated, and if
> > +the packet
> > +  contains a valid network header, \field{outer_nh_offset} MAY be set
> > +to indicate the
> > +  outer network header offset in packet.
> >  \end{enumerate}
> >
> >  Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL
> @@
> > -1215,6 +1238,10 @@ \subsubsection{Processing of Incoming
> > Packets}\label{sec:Device Types / Network  device MUST set the
> > VIRTIO_NET_HDR_GSO_ECN bit in  \field{gso_type}.
> >
> > +If VIRTIO_NET_F_OUT_NET_HEADER has been negotiated, the device MAY
> > set
> > +the \field{outer_nh_offset} to indicate outer network header offset,
> > +if packet contains a valid network header. Otherwise, the device MUST
> > +not use
> > \field{outer_nh_offset}.
> > +
> >  If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
> > device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in  \field{flags}, if
> so:
> > @@ -1302,6 +1329,10 @@ \subsubsection{Processing of Incoming
> > Packets}\label{sec:Device Types / Network
> >
> >  The driver MUST ignore \field{flag} bits that it does not recognize.
> >
> > +If VIRTIO_NET_F_OUT_NET_HEADER has been negotiated, and if
> > +\field{outer_nh_offset} is nonzero, the driver MAY use
> > +\field{outer_nh_offset} as outer network header offset. Otherwise,
> > +the
> > driver MUST not use the \field{outer_nh_offset}.
> > +
> >  If VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} is not set or  if
> > VIRTIO_NET_HDR_F_RSC_INFO bit \field{flags} is set, the  driver MUST
> > NOT use the \field{csum_start} and \field{csum_offset}.
> > --
> > 2.43.0
>=20
> Can you please also describe the description and requirements for the
> virtio_net_hdr size to indicate that when this feature is negotiated, the=
 vnet
> hdr size is all the way upto this field.
> i.e. when HASH_REPORT is not negotiated and NET_HEADER is negotiated, this
> field does not move up etc.
Could you please add more details ?
NET_HEADER can be an independent feature without requiring HASH_REPORT or t=
he=20
recently added feature UDP_TUNNEL_GSO. Should we document virtio_net_hdr si=
ze for=20
each such combination ?
>=20
> Please also add 6 bytes of reserved to have the vnet hdr aligned to 64-bit
> address.
