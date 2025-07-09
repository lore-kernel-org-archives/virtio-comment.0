Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE7728B7C2
	for <virtio-comment@lists.linux.dev>; Wed,  9 Jul 2025 10:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752055542; cv=fail; b=nX2YGv1ABhJvkQ9wrgFjbnhA3jHeM9c6L7uhNfm/NyV3kcJxH6Dq69Gf2dofW5v4/xamwNXoscuYPDVkyRp8EqCSFooYC1/W4B51gOZ0MBebGL4TFzOkPnlKRKI8uMj2EptUbA8Q5UQW5p4qH/lldvH8NNaF/4DdTIK5qYsgq94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752055542; c=relaxed/simple;
	bh=FMf3K8N0POUCQOUJaRkiehg7RDD1WHpPckCA/KW6gBU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QQlBKTvkdVfWY1d5jQivZpB+zOpgfrC7XqfzI20RUQ7kkfd98iMO5AWO6Zp9Es3cJfAGDF72lROTjisGdziBht4xyWLx/wb1iQfeyOebh7tsXMjfbxTeWvkgE4lBcUN3gojXzI5D6pD5ITdcOXRZ81i022V5+2m0CGeA8kB6p8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eNgEOlAO; arc=fail smtp.client-ip=40.107.243.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eNgEOlAO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kr/iF7xmMnMqSxiUFOi18WMkzrO86NEyAUip6J1SNeRm5jKxGxK2SPiwwP3K7ZvkKd0kMYrsd8DkoJOBuOfo1q9/rDw+xIDG+N4yKF+YdtnbMAUjuG6lT6w/b+5G7Zz6m9ui0T0wjVsu4AdYEQlOeq+phRqTXqG/KRBBCjFmI6MUVCuHe5rl3f9GmqNC1Dh3lRjAjshWCKbRZuRG2cKd8CJvb+CvcGQ72rEyfh8zuLXAwUiGOS9u73lTK8i0eyqsL6uR9prNnM7p5YPb9D05+Rv1m4tE2g3W0DygX3br02cJF5qZJIXqh1TemdvygEUcctA7srifetwpc8UY4xL5Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMf3K8N0POUCQOUJaRkiehg7RDD1WHpPckCA/KW6gBU=;
 b=LYl4nZAIfy77BWuT9D6WSmz6cW3gY4o/hdg3fl6cnsHMEtwBh0Igbm6xzJ77RgvPtXXTPU6QX0CRiwMS5Tu4T7zxsaFK6HrX/X4EXKv5NwwDLITjvPnFHQTC3/RvXaan/AiI/fzX/zzqaJdepxuRSSUq7o1wqi28lWGXmt3OGSV1hYgSNtXljZ5rVLkewHajUdf7yh2Mu/3rB3PCVYIya6hW0dZkWNaFD6DSDKCeLNO1g0uv3Dl2+22IFOX3aLc+R8ey9noKEoV+ka7ZGMQKR9FZbxvHmpTojDKyKC5h3GIMgYw0fU/9R4JLxbhA3S6SuASDcPuj4a2u6l9MEt4oSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMf3K8N0POUCQOUJaRkiehg7RDD1WHpPckCA/KW6gBU=;
 b=eNgEOlAObzKOSE0KSv5xugjSbX+XKqudZWMpLIO/nDwv5PF112M55PZfCaoHYzEios9RX8E80CBEHytjFlHy4qH8r0bWYoAGgew2XH3HkiZvb2QmhHfqBSTi1RzodaC0kK39BxN5Uzjw5OJs38DGRLHZ+O/k84r9p8KvHKHyDjNUcBCk9jjSumo+lY4tXIM8JCvidM15uG4zqQgELoiIYC0Lfu2D8KYCUkVlYVxjYKwb8SRjxSFVUjf40jtpHSMziuhy+3O1xM8c9o1p8/lA6kexPfCeL6MKWEZwKIhfUTQdvipPmkixb692d9g445nmO3s2qCMy+qTuprms3x7q/Q==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by SN7PR12MB8790.namprd12.prod.outlook.com (2603:10b6:806:34b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 10:05:37 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%4]) with mapi id 15.20.8880.029; Wed, 9 Jul 2025
 10:05:36 +0000
From: Parav Pandit <parav@nvidia.com>
To: Albert Esteve <aesteve@redhat.com>
CC: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"ribalda@google.com" <ribalda@google.com>, "alex.bennee@linaro.org"
	<alex.bennee@linaro.org>, "adelva@google.com" <adelva@google.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "hverkuil@xs4all.nl"
	<hverkuil@xs4all.nl>, "gurchetansingh@google.com"
	<gurchetansingh@google.com>, "daniel.almeida@collabora.com"
	<daniel.almeida@collabora.com>, "changyeon@google.com"
	<changyeon@google.com>, "acourbot@google.com" <acourbot@google.com>,
	"mst@redhat.com" <mst@redhat.com>, "eballetb@redhat.com"
	<eballetb@redhat.com>, "agordeev@qti.qualcomm.com"
	<agordeev@qti.qualcomm.com>, "gnurou@gmail.com" <gnurou@gmail.com>,
	"dverkamp@chromium.org" <dverkamp@chromium.org>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>
Subject: RE: [PATCH v9 0/1] virtio-media: Add device specification
Thread-Topic: [PATCH v9 0/1] virtio-media: Add device specification
Thread-Index: AQHb8LTLBRb77N9LUEyiaoa5CXxgRbQpipaAgAABHyCAAAO+AIAAAD2A
Date: Wed, 9 Jul 2025 10:05:36 +0000
Message-ID:
 <CY8PR12MB7195B3BA93D4040519D9CB32DC49A@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250709093456.350242-1-aesteve@redhat.com>
 <aG454cwrUWP3xjAU@fedora>
 <CY8PR12MB719541D2A89FB2730AED842ADC49A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <CADSE00KhZURawiTbCVov7qaZtTUzG6HLcdcH7KTEA5C0vMpJ5A@mail.gmail.com>
In-Reply-To:
 <CADSE00KhZURawiTbCVov7qaZtTUzG6HLcdcH7KTEA5C0vMpJ5A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|SN7PR12MB8790:EE_
x-ms-office365-filtering-correlation-id: 110e7b83-a23b-47b2-9d17-08ddbed0267f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|376014|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UEVqL2VidFRzUys5U2dkVExyRW5rWksyQTloZ0lwbDFva05RWkRyV3V3UjQz?=
 =?utf-8?B?MlYwK3F6Kzk0WTE0aG9FcmJ4RFoyTHBKeTMwcTZUbERWZmhmYVNLRUNHMVI2?=
 =?utf-8?B?TlJGeW1PR0ZLNnJRSmgweVNuZURLMTUwUVg4eEdiT29jcEtQOXF5QUhtYVhw?=
 =?utf-8?B?S0JRTExRV1hFTzRBTVRDSDQwS1hNeW02WFVBL1ZOZzExZExQTXZoY24yOGFt?=
 =?utf-8?B?NE0zRUo0aEl0V2lFYndLNGF4MmJGK0JCLzZqWDZ3T1BZQ24xTytxMW9ySzJx?=
 =?utf-8?B?VVFBKytMdXYwbVNTMW1hcEllMndpZUMrZlROa2pNSGJoVWxGcEVBQXRiN1V3?=
 =?utf-8?B?ei9TUWdQU3pqb0R2T2RlUkIyTjZHdzlHc2FiYjBGdmdrT0tnRDhKNXlBVnNJ?=
 =?utf-8?B?RjhuSHM1RVBmNmV2UTlMOWJFVFhLWUJzVUQwVFFOY1NZN1VsODVtSGxGRCtM?=
 =?utf-8?B?MHkwQXJqU2lVNFFWZ25GWXN2Z0RQNUtkbmlpRW9rVHpXbWpTdXl0UWg1Yjht?=
 =?utf-8?B?WHNndnVkaGVxajRyRFB1aWk5VkJ3cGFtUlRieGRXUVBBQW8vVExBU1hyZnh6?=
 =?utf-8?B?OFhwMWUxUFdNQndiYUQ1amlrTjRONDFpczhxWHR5Q0czK2owL0lLV2h5amxm?=
 =?utf-8?B?dmxVZU5FcjZpU0daT3FXSFM4UTArekFRdkVlVFVyWEZFd2R0TWJGQk9EWDIr?=
 =?utf-8?B?YlpQaFJ4V3J6WmZVcDRHRG8rRlNhellnMnNYYUtmM1dUTGR5b1czTjUvd2Zv?=
 =?utf-8?B?WExtZ2ZSZmhYTzlxT3BpRHdGNnBjQ05PczM2SDVML3dDeVM0WXBmbWxNTUR0?=
 =?utf-8?B?b0huenI0aGtmUU5oekZoZ0ZzWGZxRDdjbkhTTk1JdExmaHhnMVlaeFRUTHE2?=
 =?utf-8?B?K1l6N2hPaEJTeFBPcjAwVnFUZS9DYnNhVm5jam5PRm43UkhCczJScWNDMTlT?=
 =?utf-8?B?czdsekdWVXBkNDZNZUhuN2xmUS9CWmRsYWVQcWNJZ1B4eWdVcHViaVJHcmpU?=
 =?utf-8?B?ZkVXZitZMWhJNW5QK2o1WDBoY2FISFJvWDNJNGFrOHlRTkJheFBmRWxIc2o1?=
 =?utf-8?B?VUszQmdHY3g1a01icGcxZnFiR0pCUHdMOFVCUy9OV0grVmF4bDdpTkdYYTJw?=
 =?utf-8?B?RnlPSDR0azNFN2IyZVdIUHdobUl0YjRiRGd6dEpQT2txT09RNm0zVmZmTThJ?=
 =?utf-8?B?UWtFUlFGV1IrWnNmdXdya1U2NktrdmRQMCthMEZVZkFVeXZnUm12TjM0S1Jk?=
 =?utf-8?B?SThab1BwSU95SGxMM2FIZzViMUpqNXhsd2sxOFFSMjZFL0JOREN0QTBEWjly?=
 =?utf-8?B?cG1RUWxNanUwZW1Zc1lWQ3NjNzRIY0hGOTJVMzJvZnIyVW1KVW80cDFyOGQ0?=
 =?utf-8?B?WC9zYlRPb1RnQklTNXlJakprcEZCM3l6em9CT3U5MFBwVjgrZ1JSeVU5eEdT?=
 =?utf-8?B?R0J5M3Q4dFVJdkNJUTYyVFZwKytVRVRib0JDWTQ1RzQ0YlNnN2FvT0doYkFl?=
 =?utf-8?B?ZGFaTVhUY2l2Y2E2Um1jbU5iUjJxY1NyY0Q1TTBhdnVhWDU5RzQzcHhwMkJr?=
 =?utf-8?B?TVg4WEhob202UDZoRUQ1ZVE0Z25CT0RuakJXVE5CZVJpQ1owS1RTZkNwZllD?=
 =?utf-8?B?cVpxMW9FY1laSGltT2RrMThKZWdDOGxFNmtpL3IrRGZIakhHeTQzNnBGb0Ji?=
 =?utf-8?B?SkhVU2pPTi9peVVwdXVWWGdrdFMyc0RPb3MyN0lIc2pxcmROSWZnTElnN3I0?=
 =?utf-8?B?elRqcUZMalRCK0N3TW5HT0JzTlVqVjEvMk9TRXVSVmlFUXpRVXcwczdyVG13?=
 =?utf-8?B?RUpBMEpiOHYySUxZS0p3TWthNkZDK20zM3pSTFdSVE0wQ3BoR3JCbStiL0Rz?=
 =?utf-8?B?MkxidUFkSmxIc014NlVjUG8velhmWkMxK3JCNnkwQTZrMHZZMjdhTlBWbFBh?=
 =?utf-8?B?Y0FOdnhJL3BqcFVjRjF5YUE5ZmhITWp6MGF4ems4K3FQNFhPWFZsc2FSZGto?=
 =?utf-8?B?VC9IZ3VnVmFnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?em9wdHZuWHo2SSt5anp3bTVVRkc5dU83di9OVCtycmw4MGpSZ1J3VS9sUjI1?=
 =?utf-8?B?aEtJK2ZzM1doY1VIRXZSdjJ1RW5kblBpTGUzOW1TNHFmb21XNkRQNWNOR0RM?=
 =?utf-8?B?T3ZuWW5IMGR0QnRzNEdYZUxPWVpDZnVLaVdiUTh4dzVyaVlUUEVwd3Y1dW11?=
 =?utf-8?B?cVg1OURvdzBrUUV2aXJXYTRkdXFaQ3JMUTZML1BZYVl2UUFhVjNWS0xhWjFq?=
 =?utf-8?B?Q3pRR2JsK09LQzBpTDV0eWJDY0NMVGp2alFtaG1oaCtxNHg1QStQZW9qRTJz?=
 =?utf-8?B?WTk0anFLQ1ZWVU1lVjB3UzJvV3JLcFB1TmhCU1lWUFp0WjRGWmxndUZYYjBK?=
 =?utf-8?B?ZzJva1IzazBZcGkzY05pMEt3UUE0UC9WZmVZczBldnpDYnh3cExLT2d6SjMv?=
 =?utf-8?B?VzhxcVRXcUxtSkh4VVdYR01QbDRsVHpRNXI4QjJrMDFSV09mK1F2ekhJY054?=
 =?utf-8?B?bVJSSFBEWVRaZmVlU2FkUWNMKzBHVmJ6U3I3QUhlYU13QkRmNFJ2bHNXV0xR?=
 =?utf-8?B?SzlUaGFGZFF4ZnNuWFFkYmdWSU5veEJaNVBlcFgxZ0ZtQ1M0WDlWMnNVcWJj?=
 =?utf-8?B?N3VwUno0Rk04N3VHNWFGYUcvdDlmaGVKOVBwL24xMDlEdXV5T29NZkxaTkNU?=
 =?utf-8?B?T1pjN1NFMXUvQmM4NkMwS2hiTDh6LzkzTVJsZzhqRFRnUTNPTDgxMEswK09y?=
 =?utf-8?B?MGQ0WWFnQTFpdXZlNnRXQWhPVzVIdVEwNE1tTkNnSGpRaTduSWVsclRKVjEx?=
 =?utf-8?B?bVVEbVZOTXF0RGZCSGRuVGVTTXVaOStSVUlidEdkQ2d2SUtpRjlOdWJFMDhU?=
 =?utf-8?B?RkVEbmFxUy9MUnZEbjg0NHN5ZVMveE5Za09Bb1Q3UEpySUV5VWlaODlvZkhh?=
 =?utf-8?B?aEhlbE9Ya3ptZmxHU3U3bnhkVVVYaFpaVmNBTzJ6Z3krWXh4bEdYbmZqRklC?=
 =?utf-8?B?aENMQWZNMUh3QVBvNjF6YTFpcXVYMVZJOW1ZYVFGV21TZkU0cUlrc1Y5R0Jp?=
 =?utf-8?B?Yy9yektHZHFEckhXYzJaVVVlcWJBdmpadk9vcmE2MWxMMG5tclc0VnJ5elVV?=
 =?utf-8?B?dE5zMm5QUVBzcTZqSEd1NExxN0FHR2R3a1B6T09ka2xEOThxS1I1ajJ4OTlG?=
 =?utf-8?B?UUtXdGZsRENvcGcwam9XakJsd3lURUU1bHphQ1J5bGJWQzJyeU9QdzRiOWVS?=
 =?utf-8?B?QVRCNFN4a3lJaUZiaTJNYTBUdGJLelQxc3JOZnAzMjAzTjh5ajRielRSLzFZ?=
 =?utf-8?B?RDllZWRVUXVHVXlmTmh1SlNyMTNXcm1EeWxMUkhqZkNwcXQzSk8wM3NTTmNk?=
 =?utf-8?B?Tnh4Sjk2TGM1NGVXT3JiTHc5M1grQllRcGhjVWJGZmdKVDYrUUsxd2g2aUhk?=
 =?utf-8?B?UjJEWjVZOHJkaHo4cUVTdTN0UElXRmJoblJHeVFSVXg5YWg1ZnlkS0RKUW1l?=
 =?utf-8?B?aWEvWk43NEQrVEp2OVZtQWxKQnFJUVFiNkVBSkFsczB1T3dYcVdwSHZKM1RN?=
 =?utf-8?B?STZoSFp2aXhJT3lqeWhBNENPWHhXY1FwZEpCeXk3SUFDN1VGenFPVzgvTVhr?=
 =?utf-8?B?TjNTajVzdDkzOVdGZ0YreDUzSzVpU09VZEJhL3ZvS294b2czeU1xNXI2bXVB?=
 =?utf-8?B?ckExTSt1OUxnQ1pJNXpxUHBnQUYrdjNnVEZpMVN0WjZXVjlVMkkrWitMUVd5?=
 =?utf-8?B?VVpwWURQOWtzSFdlcnRwY2lHek52bUJUZjhpWngyRVBGNC9KV0ErMFVlSHIw?=
 =?utf-8?B?V2VtcXc0cUJlZDhnK1VBUWRaaGN3Q2xRNkwrbjNFdndkbTZaeEhMWUhrM290?=
 =?utf-8?B?TzRXNlcxZW1oS2doYVNFeFdDekdXTTl1WnJiS2lNWVJjcXp3bitTck8wclQv?=
 =?utf-8?B?YWttTDRIZmp6M0NzTHY1SWk3VGlIbVoxMjVQMHJIWGJ6OEgvUnBBM0NLSnVP?=
 =?utf-8?B?b09kOEhnS2dxN1pIYThqbUZWRHJFT0dWbWdlMFJRclU3ZXhzVVI5SWJnVlY2?=
 =?utf-8?B?aGdCMk14Zm11UFdWSW1UL0hNWmd0aVZkZWRzR3V1OVBRR3FTeEw1NHNTQ3pa?=
 =?utf-8?B?Sk9PN3RWMXRKVlNCYW1Zb0dsMUpHc1dDQUI1aytIV1k4ZXh4dXFqMEo2eEdp?=
 =?utf-8?B?WEdPcWwwcXNNOHozTkVGRVNSVEFYV01BckYyeFE3OUFLbmNIWWZuNE10YUJS?=
 =?utf-8?Q?jNh1zzMFeF2p9RENpIUATJNBREvyaGk/X9UDxSe3F7nx?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 110e7b83-a23b-47b2-9d17-08ddbed0267f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 10:05:36.4772
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9jls9BGIupQPNoc0LuHO7+8lWvsioDLQmGWx60RQEmf31hFITM+eV9IbpINO3MWpr60RBHPwOLZO9Fmz97P8uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8790

DQo+IEZyb206IEFsYmVydCBFc3RldmUgPGFlc3RldmVAcmVkaGF0LmNvbT4NCj4gU2VudDogMDkg
SnVseSAyMDI1IDAzOjMxIFBNDQo+IA0KPiBPbiBXZWQsIEp1bCA5LCAyMDI1IGF0IDExOjQ54oCv
QU0gUGFyYXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPiB3cm90ZToNCj4gPg0KPiA+DQo+ID4g
PiBGcm9tOiBNYXRpYXMgRXplcXVpZWwgVmFyYSBMYXJzZW4gPG12YXJhbGFyQHJlZGhhdC5jb20+
DQo+ID4gPiBTZW50OiAwOSBKdWx5IDIwMjUgMDM6MTQgUE0NCj4gPiA+DQo+ID4gPiBPbiBXZWQs
IEp1bCAwOSwgMjAyNSBhdCAxMTozNDo1NUFNICswMjAwLCBBbGJlcnQgRXN0ZXZlIHdyb3RlOg0K
PiA+ID4gPiBOZXcgYXR0ZW1wdCBvZiBpbmNsdWRpbmcgdmlydGlvLW1lZGlhIGRldmljZSBzcGVj
aWZpY2F0aW9uLg0KPiA+ID4gPg0KPiA+ID4gPiB2OC0+djk6DQo+ID4gPiA+IC0gUmViYXNlZCB0
byB2aXJ0aW8tMS40DQo+ID4gPg0KPiA+ID4gSSB3b25kZXIgaWYgaXQgd291bGRuJ3QgYmUgYmV0
dGVyIHRvIGp1c3Qgc2VuZCBhIHBhdGNoIHRoYXQgZml4ZXMNCj4gPiA+IHRoZSBzZXJpZXMgaW5z
dGVhZCBvZiB0aGUgd2hvbGUgc2VyaWVzIGFnYWluLiBTdWNoIGEgY2hhbmdlIHdvdWxkIGJlDQo+
ID4gPiBhIG5vbiBlZGl0b3JpYWwgY2hhbmdlIHRodXMgbm90IHJlcXVpcmluZyB0byB2b3RlIGFn
YWluLiBUaGUgdjggaGFzDQo+ID4gPiBiZWVuIGFscmVhZHkgdm90ZWQgYW5kIGFjY2VwdGVkLg0K
PiA+ID4NCj4gPiA+IE1hdGlhcw0KPiA+ID4NCj4gPg0KPiA+IFJpZ2h0LiBJIHdhcyBhYmxlIHRv
IGFwcGx5IHY5IHdpdGhvdXQgbWVyZ2UgY29uZmxpY3QuDQo+ID4gRXZlbiB0aG91Z2gsIEkgcHJl
ZmVyIHdoYXQgTWF0aWFzIHN1Z2dlc3RlZCB0byBzZW5kIHRoZSBmaXh1cCBwYXRjaCBzbyB0aGF0
DQo+IHY5IGRvZXMgbm90IG5lZWQgdG8gZ28gdGhyb3VnaCB0aGUgcmV2aWV3IGFuZCB2b3RlIGFn
YWluLg0KPiANCj4gSSdtIG9rIHdpdGggdGhhdC4gSSBhc3N1bWVkIHRoYXQgYXMgaXQgaGFkIG5v
IGNoYW5nZXMgZnJvbSB2OCB3aGF0c29ldmVyLCBpdA0KPiB3b3VsZCBub3QgcmVxdWlyZSBhIHZv
dGUuIElmIGl0IGRvZXMsIGxldCdzIGRpc3JlZ2FyZCB0aGlzIG5ldyB2ZXJzaW9uLg0KPiANCklm
IGl0cyBlZGl0b3JpYWwgY2hhbmdlLCBpdCBkb2VzIG5vdCByZXF1aXJlIGEgdm90ZS4NCg0KPiBX
aGF0IGRvIHlvdSBtZWFuIGZvciBhIGZpeHVwIHBhdGNoPyBOZXcgcGF0Y2ggc2VyaWVzIHdpdGgg
anVzdCB0aGUNCj4gY2hhbmdlc2V0IHJlcXVpcmVkIHRvIGVsaW1pbmF0ZSB0aGUgY29uZmxpY3Qg
ZnJvbSB2OD8NCj4gDQpJIHdhcyBsb29raW5nIGZvciBzb21ldGhpbmcgdGhhdCBJIGFwcGx5IGxv
Y2FsbHkgdG8gcmVzb2x2ZSB0aGUgbWVyZ2UgY29uZmxpY3QgbXlzZWxmLg0KVGhhdCB3YXksIGl0
cyBiYXNpY2FsbHkganVzdCB2OCArIGZpeHVwLg0KDQpTbyBiYXNpY2FsbHkgYSBzaG9ydCBkaWZm
IHRoYXQgeW91IGRpZCBtYW51YWxseSwgd2hpY2ggSSBjYW4gYWxzbyBkbyBiZWZvcmUgbWVyZ2lu
ZyBpdC4NCg0K
