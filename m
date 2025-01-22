Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B49F215774
	for <virtio-comment@lists.linux.dev>; Wed, 22 Jan 2025 18:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.156.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737571183; cv=fail; b=QuMQNkfqfeQl6OwCd8qyhr7qjuSXL9C/Us1OiJoPNUgMEYr1eTgdbCttkVhHdqAbbGFlskSUaVq41dMzxBNb21D0BowW6IGx7KkCFSAlVWRC4KCPzloDiVEKJINPfI9HXtPx6407CHLLt3ZwrL4kIoGa/BYm1MXRuFsdzkPi0G8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737571183; c=relaxed/simple;
	bh=wxG4xz4akPs62eoDlxdYWYG6rtCW7FnIxlb4mapzNsY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=D3EoAvam1z/aQdmzznE2fxucvTeD9Ntk/jaDdd4FUBZDaMrqYPMZ0cf8C79DJ/pwVCh/xvBKM1URxxl//yJg1od5Lhwm2KVfASkK7cHwb7s+x+6mKDw79FqTqQKs586LY2y6jFjhmWRSBIH5JW4KO2j3JeRglUYgZMJmunOlg5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=fail (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=js5gM5iq reason="signature verification failed"; arc=fail smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="js5gM5iq"
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50ME4JAS024007;
	Wed, 22 Jan 2025 10:39:38 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 44b245gmnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:39:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pS0SA/HNk4j/gAD5sjn5xXtL4uIP76a77SLi+klWAaxEVkEFavRUAf/71nPBsWx1iKgaWiijL29z/NCqlJpX0Aa1rnSnwzZfWLEjmx0sgZ370nZUR/BwrmY4R7PwCHWKFe0KeBgMJNGlFxVXlY9kJgqrt7twnxADUssayGC7f8JC8P77mmrZcSflMH8ZK9zhuIBD2aCiuFwc8bbFDbSVJ9Nbw1k+DLtgYr15jQlaxXPdjLlZwbpjj97wTkZCRgClQ6PIWzmoQnQbE6CfrQsqTWNIvhe9KPAIt1CDo8p4gNebr4hZMaUMaAdaz/PfC18ODWwcu0/LHxF1ZQF60vjdfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGqf/Kaf97bmOVauFnkdyagTJh/FEcMuinflwlixpB8=;
 b=HUbEpduBKAEKzIYLKun7NYV35SRxnNnnhx/wrpEqoWTUbIE7PRV4JEUzvrpdxuBr+2IKuWOdVEvOAq4HD7yMBhglShIt0i9K73yVkOppR8kTSDuOfMqI/9SApm0ISZg4ybC3QoEJM2m+w6uCNSqXs3Lb17M5BoreFJ7wfTvrqZgyAPRbGiLV/7j24Iep2KSirbEIozpERmebFGTVlUoHyUyeaJiu9zac6OmnImk0Ez4ixXMNCTa/opsiSX/PABVmv9Bj8aefuMxuBSUimLCb31/L1rnWRrWHwBquj5bkcTPvEsWK+i2tKIAohTeA9T6Z+7y/GAUscFqj6D3YqGKRWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGqf/Kaf97bmOVauFnkdyagTJh/FEcMuinflwlixpB8=;
 b=js5gM5iqIxA6cQbxLYRzomJRpj3wSY3E3FNHNRV2jhxQwPCkpTLI9xZ0aHoG3wB9xXc5VLEPhD5iQz2HMI56K5WrM6EQgvJ5cxdCVCsfR3Aq5hiEoMSgOAK8nVF/JqGbOohcTK0TjvbwIxqOIv5KWr74NVKy1zo1wWcT9thHMYI=
Received: from DM4PR18MB4269.namprd18.prod.outlook.com (2603:10b6:5:394::18)
 by BL1PR18MB4374.namprd18.prod.outlook.com (2603:10b6:208:31d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.15; Wed, 22 Jan
 2025 18:39:34 +0000
Received: from DM4PR18MB4269.namprd18.prod.outlook.com
 ([fe80::9796:166:30d:454a]) by DM4PR18MB4269.namprd18.prod.outlook.com
 ([fe80::9796:166:30d:454a%5]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 18:39:34 +0000
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
Subject: RE: [PATCH] virtio-net: Introduce a new field to indicate outer
 network header offset
Thread-Topic: [PATCH] virtio-net: Introduce a new field to indicate outer
 network header offset
Thread-Index: AQHbalXb2PKYJQsEM0WrX+YjR5Yy27MjCqAA
Date: Wed, 22 Jan 2025 18:39:34 +0000
Message-ID:
 <DM4PR18MB42691DAB8C11347CE3ED224FDFE12@DM4PR18MB4269.namprd18.prod.outlook.com>
References: <20250114171636.3175670-1-kshankar@marvell.com>
 <CY8PR12MB7195D27F3BB0A02F11B48106DCE42@CY8PR12MB7195.namprd12.prod.outlook.com>
In-Reply-To:
 <CY8PR12MB7195D27F3BB0A02F11B48106DCE42@CY8PR12MB7195.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR18MB4269:EE_|BL1PR18MB4374:EE_
x-ms-office365-filtering-correlation-id: 1bc20f63-14ea-45f7-a4a3-08dd3b141e0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OU5qTDFKODlIUWtGZkNCcG0ybEJCcnlFUVVHMkw3NGRCbndjUHhUdXF3T0xa?=
 =?utf-8?B?Ty81WksycU0yMFFzZExCSGp2Q2pMNFFBWHBEMDY2UlhvWEZweWM3bDI2OFpS?=
 =?utf-8?B?UmROaVI4dy9BVVZpVUJjeWswL3RuLzdjY1lpS0VwbUYzRys0cE5MVEd4K0la?=
 =?utf-8?B?M3dERnhSdzRoYXorck9saEVpOTdhdlVCRVZyckh5SXdydllpUWUyNkZyTC9K?=
 =?utf-8?B?bVNtNGFGaEFhTlp0VnZKTXRjbm1XdTlrNWgrT3hYYklJdG5YeTJYN0xHckVx?=
 =?utf-8?B?bEdBRW5BU0tDdk1yaW5rM0h5K2UzN0hUbmpnMVhGOExtbEU1MHFreFl6S3lU?=
 =?utf-8?B?T2lFRkM4SmNCNmJBQmFkQUxkK0hDKzJMRUhIa3dlTkl4Y05RQ0M2SlpWMUxl?=
 =?utf-8?B?a3NmV1NZdVRVZTdSVkJwWUo4d3pZbHEvL1dHbGhENks5RityVE9OVUlBTjd3?=
 =?utf-8?B?THpTOEZzdDVwcnJDL3A2aVVjSys3SUpuTG1BZjZybkdqZGF1SklTeUlNZklI?=
 =?utf-8?B?NC9pL3pJWWFuNGdRcXZMWUtHMThEWlRBcEFUMnFyR1IxSnMwcUNibTc1aS9O?=
 =?utf-8?B?QVhDUnl5ZFZOQU9MY1Vqa0JQcWh0UjZBajVnR1NEUzZodmkrRTVEYnFQb1JS?=
 =?utf-8?B?NW9vNyt2T1RjdmFlOG55OW5tQzYvNWlYY2s3YUVsbWdBTHV3SkRFNDNFT01t?=
 =?utf-8?B?TnhYL3I1cWhTalRBVVdMOGxweWc1T3NzL0J0dkZGaGpza21MdUI4cVRWV3Zu?=
 =?utf-8?B?amFXV0drbWxtNjhvN2tPRmd2RDFiRUo0aDI2bWxtcnJTT0Y2UTB2c2s5Sy9q?=
 =?utf-8?B?ZEJhWTVuVEpIY29rVTJ2K3N6cERhMHpGc1psM20wWUhXaTNGajZia0FEZ29I?=
 =?utf-8?B?SDJEWjJYTFNyWi9nazZyTmZGSDROQTVaaW4zSlhEWU1EVWZHaEs4VHYrandN?=
 =?utf-8?B?aWRCYVRKU1NuQTFiUVEyazdEd0p0MU92T3FFeGdpNE43NFA5UEtQQXdWZlhY?=
 =?utf-8?B?aXF0bHRSQmdib0J3cy8rbzFoRHBoekhEYjZmUVZKR1BqNkZhcC9XL1V5ZUp1?=
 =?utf-8?B?SzEwM0xuRFNSejN6djMwMGszRHVZQkRyOHpUOWtlL0RWRlZpNEdrWXBVcXBT?=
 =?utf-8?B?cVpwZTQwY3FvOUNxdFU2VEl0MGNxaHlQUW5TRTRxSmU3WFE0KzVBbFkzNlkv?=
 =?utf-8?B?ZWt1aXNmQ1QrZTlXTHArTlg2SzAyYkpnUmMvS1N4alFqU0RUUDQySUhHblEr?=
 =?utf-8?B?R3g5N2xMNEc5MXJiS0RFYnZHUy9BZHM1YkhvYnJzSmRzM2dCeFlRbWthK29G?=
 =?utf-8?B?NlM3cGg1TlNoMUxKbEN5S1FIbEpHY0pvTlN4TEdTak44YTl0Ukp5YkwwTEtO?=
 =?utf-8?B?S1lnSUVuMTRNeE9FQkxqZzBUb3hLa1hNcUtVcUI1Mm91cHIxbUV3ZXMrd2U0?=
 =?utf-8?B?bGNWZFdBZ256Z0lxMEZXYmQ2bmJsVXVWRVdlRjM1VU5XZk1uOE55eExZRjZP?=
 =?utf-8?B?RXd3QXNrSmtDV29wZFMwOTJ5UVJsMVB3eGF3QlFCZTJwR3c5UHd6OU9SL1lk?=
 =?utf-8?B?clFKZnZSRUNZL01paS9oVG4rY2hJeC91dm1LNEIvNEk3ZVJQRzEycG1rZTZW?=
 =?utf-8?B?YU9YRGtSbzlhbTJhWmVkRzA4cDkxUVhkckFqSmVQYStTTVQ4SFNoY0pxT2Jo?=
 =?utf-8?B?ZVYyRis3VHVIVnZKeS8xWGJ3MXQzUC9nQzhpcTQrUkVrYW42cUNOb2NVemhu?=
 =?utf-8?B?ZVBGVEx4WEgrZmRuWmpuY3V3NW13dXdaeWRpYitvSWZDNllxNlhvS0luK21T?=
 =?utf-8?B?bExncS9IRGd6UVYrcTF4S05jOFhXd3A1VFNQb0VTc1p6VW9XMFZaM2x2WGJ2?=
 =?utf-8?B?QjE0Wi81eEYwNUJxaVh5T1dsN24vaDBiZXFkdG9IL0NYZ2c9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR18MB4269.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N2VMeG50ZTlMSks1dmhkODduZmxORTJIQXhCQ1ZnRllpclZWSUl0Ky9zOUtQ?=
 =?utf-8?B?c0V5T1V0NzJ6dnRqa0pleWFCdjZMQjhoMzNHY3pzU1hseGtwcGNqbXA3Sm5Z?=
 =?utf-8?B?RnJBRkZsR2ZrNU51alhVcHhkUjU3TmZPOU5WaWV0c0p3MUhVdzR0dkk2c3Rj?=
 =?utf-8?B?cTk5ci83Y3RPVkgwSmVpcEF4UTNIc1YwcGF6OHl6Wnd0dnkweXYyTGxGOXhJ?=
 =?utf-8?B?bGlWajN0QXZSZ1hvaHVTdDc5aTZyWXNBR3BVdDZoUnpvZ0J6ZEx1QTB4ZXQ2?=
 =?utf-8?B?clhuQll0eGNLVGpCamhVWkUyeExpR2c5UTdnUkpyYi9QdGxmMkJtaEw5ZXVM?=
 =?utf-8?B?MVFHc3I2eVlNS1Y4ZktvdEVOcS8yMDdEVFNUT1hlYUg5Qk9EZUNVT3RWZ2tk?=
 =?utf-8?B?alpTZkpJVTNZejZ0d0dXNDhjbExBbUpQaVZzbWI5TmxmSDQ1cm04Rm9hNmZk?=
 =?utf-8?B?MEVqWkFlb2dYNkQvcW11NXczZnQ5RHpFUDdvNTRXYkdxeFZsU01MTjVHOENo?=
 =?utf-8?B?bk9jQjBKemtOS0pXNm53SE1NUWR2cDFReU4wQUFDN0lsb1IrUTZQUWpnYzYv?=
 =?utf-8?B?V21YcERtcG5GdlR3RGRGS1ZEcjhTQnRHVnpRaUlCa0xIc3ord1BJWFdqc2Z4?=
 =?utf-8?B?elNVUnJudXRVcDRjRVR4azE4ZVZzS2lzQzNuZGlXMFQ3c0Fyb0t5MkFvQVY4?=
 =?utf-8?B?ZStQTm1zVEZvSlpjbXhZTmpGOElrb0ZoUTRWU0VPRjF6UTQ3Y25EVHFNeXM1?=
 =?utf-8?B?cnR1dVRMVjBmSFF1b3cvMkY2aHVEaTEycnNQc2ppd3FLS0VLdE1Hb2hJTFFu?=
 =?utf-8?B?Wmt6cjBuejNnY3RYTFd2ZUl6NXlrZS8vU0ZqSmRxVVdubDhIVUllSnk3MHlH?=
 =?utf-8?B?eG8zeWtqbmpRRGc4T0tYOWhGd2liYUNER2pSUXEzMTRReEI5dElud0p2NjFo?=
 =?utf-8?B?ZVl5Y0M4ZE0yWVExQW1UMGYwdit1V3hNbVA4RU55bk14QVNmcVdTYmoyT0RG?=
 =?utf-8?B?UkJYKzFCYjl6NzgrZXdMNlBZZTBpVndud1F3b3k0akp1MTc1VlpacXR1TWxH?=
 =?utf-8?B?NEdHak4xWnYzWWJHYUU0aENEWHFUa1BDamNRQ0RPVXhRNk5KcUh6czlWVi9y?=
 =?utf-8?B?b2Vxd05UZHFWMFd3SXZjcmlxVTY0MnBIRVJrVnVLd0ZtZW81V29VSlptNkR6?=
 =?utf-8?B?WWVkanBaZU5EUHhLNDVzT0RleENoWHJodTRRVjViYnVTa1dVN0lDWVpmak5i?=
 =?utf-8?B?OWk5S1pTWFRPSE82MmZWMnRoRG91L1UzUzh6V3N0Unc2NnoxUzdxZDVqWlVN?=
 =?utf-8?B?NkY5ZU9IQ2g1WXVrQVNLcFdkS0tJQmtUbWlDMk9wMzZZM1VkUHc4WnRvdG9H?=
 =?utf-8?B?ekwyb29KUVJINU8zZVVFSGMxZ2U5a1dpWHJNdXlEeFFQTEVBcDBBL2xGejlP?=
 =?utf-8?B?MU1YYnhFZjRjVEZHRUp1UU80TmF4WENXR25OMldQLzlpd1F5MFVMY3hYRUkx?=
 =?utf-8?B?UElhZWV3K2dmbTF0V1hZMUhocUZneVZzOE5MNTNHV3dIWVpncjhZYmhDZGtk?=
 =?utf-8?B?U1diR0tVekdOVTFiOXg1YW5aajlLLzY0eEg4UHFHSkt2V3NJTHlGSCtzZEFB?=
 =?utf-8?B?NVhVbjhTNlIvZ2dmSGRENlgwcWQ2aDc3bFp0Z01LUE9SMzlwSDJ6Wk04am5D?=
 =?utf-8?B?alc4ZlNLbVRzV20rcThHK0lyeHltMUlQU2YxTmQ3REcva1Noc2cvNTFwektj?=
 =?utf-8?B?d3U2dFJrVzhKQkVJUUx3RXVWaTU1TzlzMUVVVW5SQS9uMlpkY0E4Uk5QVThu?=
 =?utf-8?B?QlhFMVJLeDZ0N2djUWtYUWw3eVFkNFptUU1rdGJPZUU2UkN3OGZPQy9lajdO?=
 =?utf-8?B?ajNiaDhPeGZoYkVVSTRDcWdCaTJsM2lnQ2ZQTDFxV1dBVnAxdWlQeU5iT2Nl?=
 =?utf-8?B?c1hrU0FoSEE4RTNDSUsrWDFnOXcrK25hZHBTNFpMWlpxMXFVQko4MjhhTVB4?=
 =?utf-8?B?V2JZRnZpdFdzNXl2Umd5VktlQzZRVDdUSm01S2crelFKUWltcVdCWjNUMG5v?=
 =?utf-8?B?S1RWTVo0QUNqUms0SmtyektnNHFNbXg4cWs2SDROWG9SM0NUd2RTZllrWnFy?=
 =?utf-8?Q?vEp/66x1hT+wcHf+HA0RVQJWI?=
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR18MB4269.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc20f63-14ea-45f7-a4a3-08dd3b141e0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 18:39:34.5910
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bwqqmfl9ykrQvoULeDJZB6HSDh785BqnZZ/EaSTnAs3/LPQKFwXpIYdJXvegzpXMFW/VgHjnZ+uuqGLdUnSNfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR18MB4374
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: pjnli4Iy_ec_ARYMsfPjfCRT_nacLmoE
X-Proofpoint-ORIG-GUID: pjnli4Iy_ec_ARYMsfPjfCRT_nacLmoE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_08,2025-01-22_02,2024-11-22_01

> -----Original Message-----
> From: Parav Pandit <parav@nvidia.com>
> Sent: Sunday, January 19, 2025 3:08 PM
> To: Shiva Shankar Kommula <kshankar@marvell.com>; pabeni@redhat.com;
> willemb@google.com; jasowang@redhat.com; virtio-
> comment@lists.linux.dev
> Cc: Nithin Kumar Dabilpuram <ndabilpuram@marvell.com>; Jerin Jacob
> <jerinj@marvell.com>; Rahul Bhansali <rbhansali@marvell.com>
> Subject: [EXTERNAL] RE: [PATCH] virtio-net: Introduce a new field to indi=
cate
> outer network header offset
>=20
> > From: Kommula Shiva Shankar <kshankar@=E2=80=8Amarvell.=E2=80=8Acom> > =
Sent: Tuesday,
> > January 14, 2025 10:=E2=80=8A47 PM > > Hi Everyone, > It has been some =
time
> > since this patch was sent. I am resending it for your > review and
> > look forward
>=20
>=20
> > From: Kommula Shiva Shankar <kshankar@marvell.com>
> > Sent: Tuesday, January 14, 2025 10:47 PM
> >
> > Hi Everyone,
> > It has been some time since this patch was sent. I am resending it for
> > your review and look forward to your feedback.
> >
> > This patch introduces a new field in the virtio_net_header called
> > out_nh_offset, along with a new net device feature,
> > VIRTIO_NET_F_OUT_NET_HEADER.
> >
>=20
> > Currently, there is no field available to directly read the outer
> > network header offset in case of segmentation offload.
> > This requires reading packet data, which significantly affects
> > performance in datapath.
> > Additionally, some hardware implementations requrie knowledege of the
> > outer L3 offset (aka L2 length) for inline IPSec hardware acceleration.
> >
> > To address this limitation, we propose splitting the csum_offset field
> > into two 8-bit fields named csum_offset and out_nh_offset.
> > The csum_offset indicates the offset value from the csum_start and
> > may not exceed 256B bits(2^8) for protocols that use a 16-bit one's
> > complement checksum
> >
> > Following table lists such protocols and their checksum offset fields
> > within their headers
> >
> > +-----+--------+
> > |Proto|csum_off|
> > +-----+--------+
> > | IPV4| 10B    |
> > | ICMP| 2B     |
> > | IGMP| 2B     |
> > |  TCP| 16B    |
> > |  UDP| 6B     |
> > +-----+--------+
> >
> > The out_nh_offset represents the start offset of the outer network
> > header from the beginning of the packet data
> >
> > This issue was briefly discussed on the mailing list in a different
> > thread, which can be found here
> > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
> 3A__nam11.safelinks.protection.outlook.com_-3Furl-3Dhttps-253A-252F-
> 252Flore&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DXP728rR_yI3bCCyFq0
> MEWPS2176D_oSryc7cD-0TRPs&m=3DTIEwJZ_xRsOSm7KLONVdffWXkShROf-
> Sdyg3IKBNiKzIV8csp8rKVRdL0RlLde13&s=3D6cECQ7qUASslb35Xab87t1Kd3kFJyqK
> 9iT9KzbPMN0Y&e=3D.
> > kernel.org%2Fall%2FDM4PR18MB4269FAAC3CFC7E57E25DFBD2DF8B2%40
> > DM4PR18MB4269.namprd18.prod.outlook.com%2F&data=3D05%7C02%7Cpa
> > rav%40nvidia.com%7Ce81096db39a14378627708dd34bf3909%7C43083d
> > 15727340c1b7db39efd9ccc17a%7C0%7C0%7C638724718122375976%7C
> > Unknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMD
> > AwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7
> > C%7C&sdata=3DTHSOD9fclucwxtnizGLo8pIpjsTs1YoRww4VA%2FvDwgI%3D&re
> > served=3D0
> >
> > Signed-off-by: Kommula Shiva Shankar <kshankar@marvell.com>
> > ---
> >  device-types/net/description.tex | 26 +++++++++++++++++++++++++-
> >  1 file changed, 25 insertions(+), 1 deletion(-)
> >
> > diff --git a/device-types/net/description.tex b/device-
> > types/net/description.tex index 76585b0..48c081b 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -88,6 +88,10 @@ \subsection{Feature bits}\label{sec:Device Types /
> > Network Device / Feature bits  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)]
> > Set MAC address through control
> >      channel.
> >
> > +\item[VIRTIO_NET_F_OUT_NET_HEADER(50)] Driver can provide the start
> > +of
> > \field{out_nh_offset}
> > +    value. Device gains advantage by not reading packet data to
> > + calculate outer
> > network
> > +    header offset.
> > +
> >  \item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner header
> hash
> > for encapsulated packets.
> >
> >  \item[VIRTIO_NET_F_VQ_NOTF_COAL(52)] Device supports virtqueue
> > notification coalescing.
> > @@ -418,7 +422,13 @@ \subsection{Device Operation}\label{sec:Device
> > Types / Network Device / Device O
> >          le16 hdr_len;
> >          le16 gso_size;
> >          le16 csum_start;
> > -        le16 csum_offset;
> > +        union {
> > +                le16 csum_offset;
> > +                struct { (Only if VIRTIO_NET_F_OUT_NET_HEADER negotiat=
ed)
> > +                        le8 csum_offset;
> > +                        le8 out_nh_offset;
> > +                };
> > +        };
> >          le16 num_buffers;
> >          le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT
> negotiated)
> >          le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPORT
> negotiated)
> > @@ -457,6 +467,10 @@ \subsubsection{Packet
> > Transmission}\label{sec:Device Types / Network Device / De  \item The
> > driver can send a completely checksummed packet.  In this case,
> >    \field{flags} will be zero, and \field{gso_type} will be
> > VIRTIO_NET_HDR_GSO_NONE.
> >
> > +\item If the driver negotiated VIRTIO_NET_F_OUT_NET_HEADER,
> > +   \field{out_nh_offset} indicates the outer network header offset in =
bytes
> > +    from the beginning of the packet.
> > +
>=20
> This field is mostly useful to device when there is GSO or checksum offlo=
ad.
> So this should be set optionally by the driver.
> When feature is negotiated, it means that csum_offset is 8 bits in width.
> A nw header offset may/may not be present.
> When offset =3D 0, its not present (because 0 is impossible value for nw
> header).
> When its non zero, it is valid value that device should use.
>=20
> Can you please update the proposal to cover these aspects?
>=20
> Also, this may find its use even on the rx side too, so that sw does not =
need to
> parse it packet.
> So describe the text for it similarly.
FWIW, while processing incoming packets, when the VIRTIO_NET_HDR_F_NEEDS_CS=
UM flag is set=20
by device, the csum_start and csum_offset fields indicate how to calculate =
the checksum, which still
involves reading packet data in software.=20
I'm unsure how this benefit in the RX path. Could you please clarify ?
