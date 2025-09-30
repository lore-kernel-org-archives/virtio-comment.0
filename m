Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010038.outbound.protection.outlook.com [40.93.198.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A9A1DE89A
	for <virtio-comment@lists.linux.dev>; Tue, 30 Sep 2025 04:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759205747; cv=fail; b=aclAvYJefMmH3p02yY56QMCoR075rlFNNGok+09PQPgq8uEVl0vFpUwDJFSHeAVQE+6hft1ETStnZc4qt+XCJxqrSVMsm7AJKMME6QgcoACB3wOf2XFA5KJP0rkec1d+/V5FDVC9jZkkWNTtUG1RABJLAHdFdziq82zC3Usegc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759205747; c=relaxed/simple;
	bh=BVSEfo2zJE+1FX9PVBQXJDb5BsM1Cj3x4Czg/RJe3I8=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CH2jmje/F1r4s/Q/xT97TdlA2s7y16laXArwpdxBqIdNOq5zAlaUrdO2cm8bFxPttNkPHBaTypjYrsraX6OG+OxQJdEhvEnB3x65WALem3kAadtE0lwaMEyrzF0Udp+F96SFNQnmGJuKxY4XUK3liJYo0VHQ5CTFQvHJSd1zoEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=USOcyf2s; arc=fail smtp.client-ip=40.93.198.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="USOcyf2s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ryfAZWooVnds6a3o+lbmyYrqNbS2F3VkOzDvFSwP3Dwx7Phn8vGFaSr8uwHdat46lnFyhvd1UsAjusHdapaSLi825aerNi6NUJ86S3LqN9SKhzJLXHL2rtoI1EL3L+Kt4wm8n/zFHf8j0o9RxsvzAMPXbpSmQo8ioR95rYihUovpxG4pSs42FojuGXN8Tgc9onlai3zsEvOJTMMNvqGjQfMYL/BxkMFoQKSk1IrebdDvnl4s1OHOx+KiH6Zl6470gf3BHjWwjIeziFgBfGMi13PalUIWfm9MmdOgqHOXt4X0icyUNqkfaLxeKBQawTJcr3u8Vbw7tnHrykpCBmQd0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRQeQ13yieJHLFHarwv3+PD/B4uVMPAf66bxgMG62Z4=;
 b=lmasAonMhc/FCkuA92dmn1IEqWrgVaz3xMlQHpNd2yrBC80gP0WrHy+EJJRN64bGrixedgRXkVV1PbnAShyVAPlU2OWys6AN1H9sl1UA4wzlz8ubjPrn1Zslq0LmjYhC8LoJIel1DxyY1IsMLy3bdeRYUVsJtL+XH0ASDMV4TdYkrCF/0YF9sz0QMYF4t9uJI/k2jN44wY55YdL4J8+SNm+6SD3BXGG3NGnHWOSY598oDc/0VWAAZsIOf09ObJoMtPUWZyIMBteptQK24hYOcHg1SHhpeZETWmRzPOIGDdYvZ1d0lYwoslAevm2CUUWh/6UPz/ekyvmlcaRknauWWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRQeQ13yieJHLFHarwv3+PD/B4uVMPAf66bxgMG62Z4=;
 b=USOcyf2sEbUF5wj9ckKD2nlAGHNF17kX8oQ+2IbrmB1JQJCEY9b4yPUHHYvNqHH1HV6EOkYvPllS+8+36wgqxtXlwNyKkN5qvsP4DQC5HYlp3mHI5vhRPRAgXkNrLvp3MuwOmmzlkspAdjlJG+1hWpIgffnFLZWeGINPuT7NZLiZ8M9x0jvq3AcLEydAhjpcV9A/TbyzqzLWdeGpXKTWD1kH2n8rSJCLds8o+8nr/X0OFvKfGJV3Km65ZXAYXc8AXR51RhCofMzS4wt+fJaDNcB/i5UrJkwPZO8AQjeyJFSODw9KZo76+x4kb98RRAIIYDx59r+c3jPvF8BatUnjdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by CH3PR12MB8260.namprd12.prod.outlook.com (2603:10b6:610:12a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 04:15:40 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%5]) with mapi id 15.20.9160.014; Tue, 30 Sep 2025
 04:15:40 +0000
Message-ID: <5f1f310d-8a17-414b-ac70-80028832a78b@nvidia.com>
Date: Tue, 30 Sep 2025 09:45:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
To: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "mvaralar@redhat.com" <mvaralar@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>, "ij@kernel.org"
 <ij@kernel.org>, "ncardwell@google.com" <ncardwell@google.com>,
 "Koen De Schepper (Nokia)" <koen.de_schepper@nokia-bell-labs.com>,
 "g.white@cablelabs.com" <g.white@cablelabs.com>,
 "vidhi_goel@apple.com" <vidhi_goel@apple.com>,
 "ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
 "mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>
References: <20250814120118.81787-1-chia-yu.chang@nokia-bell-labs.com>
 <20250814120118.81787-2-chia-yu.chang@nokia-bell-labs.com>
 <CY8PR12MB7195670B68CC8F454DA821C6DC1BA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79843798615E61FA134A5428A31BA@PAXPR07MB7984.eurprd07.prod.outlook.com>
Content-Language: en-US
From: Parav Pandit <parav@nvidia.com>
In-Reply-To: <PAXPR07MB79843798615E61FA134A5428A31BA@PAXPR07MB7984.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::20) To CY8PR12MB7195.namprd12.prod.outlook.com
 (2603:10b6:930:59::11)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7195:EE_|CH3PR12MB8260:EE_
X-MS-Office365-Filtering-Correlation-Id: d9117ae5-a826-4a57-1f9d-08ddffd803e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aFpJMHBGVHh5ZUZUY1hya2JOeXVodXRGVVZhYWRzdGlvbFFMZGZVc2x2M00v?=
 =?utf-8?B?TXAxcmlHVkVaR2VPRGp3M3A1YnBZMjV4dUlsc2J2UWcxUUEzRmJhSzRqK3hX?=
 =?utf-8?B?dk5XWWgyMnlza052dDlFZFk3WTNDWFNGUW5UekY0NGpZNmdkMnp5YXRsOThP?=
 =?utf-8?B?Q0tORkdlWHlTY1ptSlpnWHNwVVE2OU9VUFFBTDBYS0hrTkczZzNIRFQ3NGFS?=
 =?utf-8?B?bnIyTW54RDFGS1BSQ0JOaGo1Q2t4bXZHL2NoaEFhNWxNeWptWDN4NWg0QXRt?=
 =?utf-8?B?MitxQTZZVmdFU0hBSTdSMXVEcG1rczRhbUs4d2hGUFZxSm9IR3ZsTzFzV1Zs?=
 =?utf-8?B?azNuMk53YUNGYkRiczI0cFNsS2ZsU2w3T1p0ZlVpamRGejNHWklNYzJCUHBx?=
 =?utf-8?B?eXcyYlg2ckFZcGFnMStkRm8xY3pqdmd1a1NweC9EbUpvYlBNaytWUHdvU3h3?=
 =?utf-8?B?ZkRBK1MrbVRkZWh6MDhITHNMWW5kYVJnSGhwS1ZqZGEvTTlIUnQ2RnVvMTdF?=
 =?utf-8?B?Y1dnUnF1VVIvUU5KY2x5aWphK1Zld1hzRSttTmZRK1prK1VUV0tVT3ZTS1Vz?=
 =?utf-8?B?UXVrbTZZLzl6Qit1UFhmRmRvNHFtMCtjSi9MRldqYlJEc2lZSGRVbDBPWVBj?=
 =?utf-8?B?VHdxcHlSdStINzlTa3FRRldSK2xRemV6a0hJbSt5WlhuUkR2Tms5bmVQWmVy?=
 =?utf-8?B?ZXFwSHRsZlpCSHZKcnBNSlVxOVhjTDBTOEJIUkNuOThKb2dndEV0eEdCZmFp?=
 =?utf-8?B?NUsyM2g3Wk5HK0pDSGF0OHE4MDEwUFdkT1FQelVSZXlDTGhnd3NZNnhZeGNs?=
 =?utf-8?B?ME9yZXgwakRhT0toMHo5VU5yVW9zT2owQXoyQTlkUUVmZ3ppcm5peGs2OXdk?=
 =?utf-8?B?V0FTL1FCWWJxZXJpM1U5OTBzZ0FLcjBBaG5zdlF6UnYrdG42TVk0SW9KWkZh?=
 =?utf-8?B?K0R0Qk9oSXFkejE3Vkg1QU9IYUlWU0I0Z1IyTS81V212WWp3UXlSM2tVTzUy?=
 =?utf-8?B?ODZlWGlweUVkRkpWTGNxejFQTHFvK1huL3A3SERodUExRVdQZVdRQWJqK2N2?=
 =?utf-8?B?SGZON0d0MU1kU3VQT25nUTV5dVhNZnRxUjgxblNxWmw3SmRJdU5FWkw4Y2ZJ?=
 =?utf-8?B?by9yREp6NGRmS0RJaHIvQnBSeVhMMjFyU3hTM0VOWWlDNElBakNuVUNXNW5U?=
 =?utf-8?B?S0dVMVFIcGxCZzkzVlRjMTdzSUtueURCUlhhMXZFeXZySjVBK21xNkQzTW40?=
 =?utf-8?B?N1hURUVmSC9iMlZGMDBnRWVxeWNyVmlHVHprNGxaOVpUWHdSU2gwN2FFUDR3?=
 =?utf-8?B?UHFjMEZKcWlCVjU3dDVYdUg4dVoyb1I3Nyt3ZHgwdDdCcm51VnNHVEJjTSt4?=
 =?utf-8?B?TGpxTHVHeGM5a2YzM0V5cVBieGZob2k3Z2dvcEduNDhJYnlDMEYxbXp1czZF?=
 =?utf-8?B?MlYxSUo5dFNHRjV6WXN2Z21QMHhpQUFFOWJZRVNyc2crYnV1bHkyUmdNZkdD?=
 =?utf-8?B?b3NlcHBydVQwWnNhRk9xNy9FYjNuTXZYN3hLOE5jRjNxVlZuZ091d1o1d0dH?=
 =?utf-8?B?TFZiaWRjMWQyakhkK0NqWXNEWS9ReEZmb2dTaW9wWDZ2S012aTMvN2htcTln?=
 =?utf-8?B?R2dmSTE0bENsVlNMVE9SOXJoL0cxZjUrVlNWMXRvakZXRGpOcjE4Y1F4T1RK?=
 =?utf-8?B?T1pPK2MwUklTZVJnaWhmSmxYSnI4dUQrcCtmbWdhdVk2L2NUVzMycXp5bFoz?=
 =?utf-8?B?K3hhaUN4V3Zhb1pOYVRGZlBrVDJDRlJlMTEyenhjOXNlQVQ2V2FyaU0zMkww?=
 =?utf-8?B?N2RSVldXOVAxcGxyd01vMTFXLzJxV1BFVUIwbVdtV0FmUWpleGYyZkNjM3JP?=
 =?utf-8?B?eTdOQzlBcHpoYXg5d25leUZQVFVrenlXTjJkclBrVjN5bDU1Y1N6UzRQSjN6?=
 =?utf-8?B?Z00zdmE4NmxpZWYxQitCTzhPbGhUdkdGZFFGcDZSRnRPdzVFa2syZ0ZNNWF0?=
 =?utf-8?B?NVdrL0pXQTQ2eVdFVEtOQkZtNHEwNXRJRDloT3ZBQk50WG5aZkJQWUZkZWdh?=
 =?utf-8?Q?HDI8yr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0EzQTd5blRFcHhHdFBmYVFkd2dIWDZ6MWh1TkpCa2F0UXB1NGNwak9kSjJN?=
 =?utf-8?B?ekN1OWV4c1g1VTlYZlY4aDFUNEhnVlRjTmZJNitMazJUZTVNb0R5bjJOdFNm?=
 =?utf-8?B?ZEp3UUZBbGVjVm5PWThkaG1wcDJWTkZ3SWtCN3lqdjlsclBxNGNYWVJSY3R2?=
 =?utf-8?B?TzUxOXUxYmtBVjFoTnkwblhBWlJyeWljcVB2Wm1adktNN2ZYSTZpdkE0WStR?=
 =?utf-8?B?cWhUTVo3NExVaFRpTEFoTlRjN0pDa3h1b0ZKRkRBV2ViWVc4L25neWxKMkxo?=
 =?utf-8?B?bStSZkE5VzB4eGJjYjAzaG1naWFRVGRNZnFNQzdFRVNYbUJsS0lJSEN2OUY4?=
 =?utf-8?B?Tmg3Z0R2bk55V2p0S2xkUlRodStUREVsR1Bub0tLNkgzZFlHVXdOdE93Mkds?=
 =?utf-8?B?WktPbHlxTTVLQlZOYzZzUTJFMTIrRnNiUFZ6c2wwQ0RoNTc5OWpvdDdEWHR5?=
 =?utf-8?B?T2NMcWhWdU13MjZxenJ5aStRUlhjdDg2cGFVc0krMURkU0FMVmJLMGdTQ3Yr?=
 =?utf-8?B?OHcwOGduR1VEZUNKTUpydHU5MEg3blBjMC9LOE1UMnI5NTR5TURuUFZ0SzdY?=
 =?utf-8?B?V0tSVndVN056OUdrcFJhL3JYcWlWekRjMW1aYjBXU2p4Y2hpelR3L1hpeUVC?=
 =?utf-8?B?NFg1VWs0U1F0aUdYWXl0WENuM3BwdHVwRVpXM0RLNDhDdWFBanNibXRqTzlF?=
 =?utf-8?B?ZnFMWTJVQ2padmNNaWorSE90ZnR4eEZtYlVVbVRBNVVNRWR2SDJFSCtPcnRr?=
 =?utf-8?B?SEZ3eUZxNjBYdllFZjZNSUQ1a3dSajg0Q2pNM0QxWUtuTTg0K2FLeVphV2xR?=
 =?utf-8?B?aXRXQ2FkTFY1QlRKN25FYTlaZzAvdjUveFBWZ0IvNGttMHlwenlYODNGTmVI?=
 =?utf-8?B?YlV1cEFEVzZid0xNRnFXblRaZy9JYnVxSnVXaWtyckdoV3NiQ0N4eE5xZDFW?=
 =?utf-8?B?WWNwRUNjRVdGaStzS3FHRjdHa24wMENMNWZRNTVlZnFvVXhTY1Y0QXVhRnRO?=
 =?utf-8?B?cWU0R3l2YVV6ZEd1dDR6LzE4VmNKVWtFM043SmtCOVd1dlZONmxXcFoxWFVR?=
 =?utf-8?B?TjllNDd1T3djTi9hYmVwSmNaUk0xKzhCSzVTbEdKNGx4UmFxbWJRd0MxS1Yv?=
 =?utf-8?B?bFJRVE5WQ2lsclU3NDk1SS9uWk8wbS8rS1dDbGk5MzVPSUo5NHA3Vzk4clFX?=
 =?utf-8?B?SkJvZ3JRTFZqU1pkcUZlZEx6aGhZa2x4dmNMbVlHSTZjcEhCdU9NcDY2OW1T?=
 =?utf-8?B?MnU5dTBabzJPTEFURmRRQ09HdWhDOGthSzNQdno0NWNWSHZQcEZVbXpaRVA3?=
 =?utf-8?B?amhKdkM4VnZlZnphUm5BMjJJcmh6NGtYNWdoT3RlQmtkSHlidWY4elM5SFFM?=
 =?utf-8?B?T1gvRXY4QkgySTIrUlh0SEF2RUlldXlzSXppZmp6Z2ZreFdSL2xkc24wMS9H?=
 =?utf-8?B?em1vTUU5L0hVVGxneFlMNEZYWGp3OGlWK096bU5pZXZjdzNMSG1jUGNFNTc0?=
 =?utf-8?B?TWQ1Mkt0N2tCc0ppN0wyOXA1a29TUHRRaStJdG5EQktRVHhOdnl5cFMydGFS?=
 =?utf-8?B?VmFwZ0h5cFQ0WTJmVVBDd2p1aTY0VDFpSHk3Sk9XNFBLUGwzc0dKOE9hY3Rl?=
 =?utf-8?B?UVRmYXg2a0tLNUlMc24zbFhkcjBpaldtb3c4emxDS0xZb3ErMHRlWittUjQ5?=
 =?utf-8?B?OVFwaFVLa1orTmdMUXVOd3pVbFBFbUtLNFJNMURac05Sa0NLcmVwYS9MU1Uy?=
 =?utf-8?B?VkJzNGcyWHlLMFpTQjJzNmE1MVpQOXdsSzQzdWVWSituUFZLTEsxWVpMbW83?=
 =?utf-8?B?QmFMVUsweTVsMExGOTJqbXlCWnJsY0JlbzkrbjlTYXhldW5iVUt0K0NKa3Z0?=
 =?utf-8?B?anVsRnZYZ3ZzY1RoTHV1aXZ2S1ljYjdPM216MWVXRzBCUVJSZERnVWJSTmtK?=
 =?utf-8?B?b042alF6Q01pZGxrMFlKYjhUdlBpalFwcGFXQVVGZDhmQzI1bThOVy9nbDZG?=
 =?utf-8?B?YjhSanhnRlNuTTlTd0dQdEJPTjk3YnZDWko2czNwS054TW9yMEdlNjFPUURq?=
 =?utf-8?B?T1pHS05INzlhd1lVSHhnME9FemVrNVg5YU1TMGF5YXVHM1Bxa1NZVlRjZ2dT?=
 =?utf-8?Q?pOU/Bav2y0AD4T2ZZfN0eqf6J?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9117ae5-a826-4a57-1f9d-08ddffd803e2
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7195.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 04:15:40.3300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4fdTwyXiFwJs1vmA/u+ex1a13FswdwAqt/1PmD1wrUC/JlLh3x/Pyry/mo9oFBu/p2LnQaKSMQzfOyNv3L+4KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8260


On 29-09-2025 11:14 pm, Chia-Yu Chang (Nokia) wrote:
>> -----Original Message-----
>> From: Parav Pandit <parav@nvidia.com>
>> Sent: Monday, September 29, 2025 9:48 AM
>> To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>; virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com; mvaralar@redhat.com; jasowang@redhat.com; xuanzhuo@linux.alibaba.com; eperezma@redhat.com; ij@kernel.org; ncardwell@google.com; Koen De Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>; g.white@cablelabs.com; vidhi_goel@apple.com; ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
>> Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
>>
>>
>> CAUTION: This is an external email. Please be very careful when clicking links or opening attachments. See the URL nok.it/ext for additional information.
>>
>>
>>
>> Hi,
>>
>>> From: chia-yu.chang@nokia-bell-labs.com <chia-yu.chang@nokia-bell-
>>> labs.com>
>>>
>>> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>>>
>>> Clarify that the VIRTIO_NET_HDR_GSO_ECN gso_type flag does not mean
>>> that TCP has IP-ECN set; instead, it identifies that the TCP CWR flag
>>> is set and will be cleared from the second segment of an aggregated segment.
>>>
>> Above text is seems to be clarified only in commit message, not in the spec changes below.
>> Can you please add it in the actual spec wording, including requirements?
> Hi Parav,
>
> This is to fix current error in virtio spec:
> "VIRTIO_NET_HDR_GSO_ECN is a flag within the VIRTIO_NET_HDR structure that indicates the TCP header of a packet has its Explicit Congestion Notification (ECN) bit set, signifying congestion in the network"

I am unable to find the above cited text in virtio spec.

Do I miss to find above text in the spec?


What I read in spec is:

The driver SHOULD NOT send to the device TCP packets requiring 
segmentation offload which have the

Explicit Congestion Notification bit set, unless the 
VIRTIO_NET_F_HOST_ECN feature is negotiated, in

which case the driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in gso_type.

> TCP header does not have ECN bit, and this flag shall indicate the CWR bit of TCP header is set when doing the GSO for the first packet.
> The corresponding texts in RFC3168 are "When the TCP data sender is ready to set the CWR bit after reducing the congestion window, it SHOULD set the CWR bit only on the first new data packet that it transmits."
>
> So, do you think adding above texts in the commit message is ok?

Yes, but only commit message is not enough. We need equivalent text in 
the description and in driver + device requirement section.

Something like,

When the device is transmitting packets of gso_type of segmentation type 
A, B, or C, and if driver requested gso_type of HOST_ECN, the device 
must set the ECN bits in the IP header and CWR bit in the TCP header in 
the first data packet of the TCP or UDP segments.

> Chia-Yu
>>> This is used to offload the TCP CWR flag in a way that is compatible
>>> with
>>> RFC3168 ECN but is problematic for non-RFC3168 use of the TCP CWR flag.
>>>
>>> Foe detailed requirements, please refer to IETF RFC3168:
>> [..]
>>
>>> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>>> ---
>>>   device-types/net/description.tex | 35 +++++++++++++++++---------------
>>>   introduction.tex                 |  3 +++
>>>   2 files changed, 22 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/device-types/net/description.tex b/device-
>>> types/net/description.tex index da9ff17..0da8f9f 100644
>>> --- a/device-types/net/description.tex
>>> +++ b/device-types/net/description.tex
>>> @@ -54,7 +54,9 @@ \subsection{Feature bits}\label{sec:Device Types /
>>> Network Device / Feature bits
>>>
>>>   \item[VIRTIO_NET_F_GUEST_TSO6 (8)] Driver can receive TSOv6.
>>>
>>> -\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with ECN.
>>> +\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with the CWR
>>> flag set
>>> +    and follow the requirements of the CWR bit described in
>>> +    ``Section 6.1.2. The TCP Sender'' of \hyperref[intro:rfc3168]{[RFC3168]}.
>>>
>>>   \item[VIRTIO_NET_F_GUEST_UFO (10)] Driver can receive UFO.
>>>
>>> @@ -62,7 +64,9 @@ \subsection{Feature bits}\label{sec:Device Types /
>>> Network Device / Feature bits
>>>
>>>   \item[VIRTIO_NET_F_HOST_TSO6 (12)] Device can receive TSOv6.
>>>
>>> -\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with ECN.
>>> +\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with the CWR
>>> flag set
>>> +    and follow the requirements of the CWR bit described in
>>> +    ``Section 6.1.2. The TCP Sender'' of \hyperref[intro:rfc3168]{[RFC3168]}.
>>>
>>>   \item[VIRTIO_NET_F_HOST_UFO (14)] Device can receive UFO.
>>>
>>> @@ -729,9 +733,10 @@ \subsubsection{Packet
>>> Transmission}\label{sec:Device Types / Network Device / De
>>>       header (ie. MSS).
>>>
>>>     \item If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature,
>>> -    the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}
>>> -    indicates that the TCP packet has the ECN bit set\footnote{This case is not
>>> handled by some older hardware, so is called out -specifically in the
>>> protocol.}.
>>> +    the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type} indicates that
>>> + the
>>> TCP packet
>>> +    has the CWR flag set and follows the requirements of the CWR flag
>>> described in
>>> +    ``Section 6.1.2. The TCP Sender'' of \hyperref[intro:rfc3168]{[RFC3168]}.
>>> +    \footnote{This case is not handled by some older hardware, so is
>>> + called
>>> out specifically in the protocol.}.
>>>      \end{itemize}
>>>
>>>   \item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO
>>> feature and the @@ -828,10 +833,9 @@ \subsubsection{Packet
>>> Transmission}\label{sec:Device Types / Network Device / De
>>> \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
>>>
>>>   The driver SHOULD NOT send to the device TCP packets requiring
>>> segmentation offload -which have the Explicit Congestion Notification
>>> bit set, unless the -VIRTIO_NET_F_HOST_ECN feature is negotiated, in
>>> which case the -driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in -\field{gso_type}.
>>> +which need to follow the CWR flag requirements described in ``Section 6.1.2.
>>> The TCP Sender''
>>> +of \hyperref[intro:rfc3168]{[RFC3168]}, unless the
>>> +VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case the driver
>>> MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
>>>
>>>   If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
>>>   VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
>>> VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit @@ -1168,9 +1172,9 @@
>>> \subsubsection{Processing of Incoming Packets}\label{sec:Device Types
>>> / Network  \end{enumerate}
>>>
>>>   Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL -
>>> and ECN features enable receive checksum, large receive offload and
>>> ECN - support which are the input equivalents of the transmit
>>> checksum, -transmit segmentation offloading and ECN features, as
>>> described
>>> +and ECN features enable receive checksum, large receive offload and
>>> +RFC3168 ECN support which are the input equivalents of the transmit
>>> +checksum, transmit segmentation offloading and RFC3168 ECN features,
>>> +as described
>>>   in \ref{sec:Device Types / Network Device / Device Operation /
>>> Packet
>>> Transmission}:
>>>   \begin{enumerate}
>>> @@ -1273,10 +1277,9 @@ \subsubsection{Processing of Incoming
>>> Packets}\label{sec:Device Types / Network  the
>>> VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{flags}.
>>>
>>>   The device SHOULD NOT send to the driver TCP packets requiring
>>> segmentation offload -which have the Explicit Congestion Notification
>>> bit set, unless the -VIRTIO_NET_F_GUEST_ECN feature is negotiated, in
>>> which case the -device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in -\field{gso_type}.
>>> +which need to follow the CWR flag requirements described in ``Section 6.1.2.
>>> The TCP Sender''
>>> +of \hyperref[intro:rfc3168]{[RFC3168]}, unless the
>>> +VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the
>>> +device
>>> MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
>>>
>>>   If VIRTIO_NET_F_OUT_NET_HEADER has been negotiated, the device MAY
>>> set the \field{outer_nh_offset} to nonzero value to indicate outer
>>> network header offset, diff --git a/introduction.tex
>>> b/introduction.tex index
>>> 80aa67a..1c4cb33 100644
>>> --- a/introduction.tex
>>> +++ b/introduction.tex
>>> @@ -180,6 +180,9 @@ \section{Normative References}\label{sec:Normative
>>> References}
>>>       Leiba, B., "Ambiguity of Uppercase vs Lowercase in RFC 2119 Key
>>> Words", BCP
>>>       14, RFC 8174, DOI 10.17487/RFC8174, May 2017
>>>
>>> \newline\url{https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fhttps%2F&data=05%7C02%7Cparav%40nvidia.com%7Ceab35f44f49848fc8e8b08ddff7fdb9c%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C638947646846725275%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=%2FdaRBtZYY54NGKxprZ80CKOGgCaf0vkd5a%2FQQwR%2B6EQ%3D&reserved=0
>>> %3A%2F%2Fnam11.safelinks.protection.outlook.com%2F%3Furl%3Dhttp%253A%2
>>> 525&data=05%7C02%7Cchia-yu.chang%40nokia-bell-labs.com%7C9bd29c383d0e4
>>> 96aa3c708ddff2c774a%7C5d4717519675428d917b70f44f9630b0%7C0%7C0%7C63894
>>> 7288674229109%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIw
>>> LjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C
>>> %7C&sdata=vhqjeUh8%2B6VOKIe3RF5WxlMoQwNkC3CacP0C1kN60fI%3D&reserved=0
>>> 2F%2Fwww.ietf.org%2Frfc%2Frfc8174.txt&data=05%7C02%7Cparav%40nvidia.
>>> com%7Cc6ffebfc748f4772784708dddb2a50c9%7C43083d15727340c1b7db39e
>>> fd9ccc17a%7C0%7C0%7C638907696998232587%7CUnknown%7CTWFpbGZsb
>>> 3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkF
>>> OIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=jRjpor%2FkXifPfp
>>> t7IFBo5JNF4%2FlE8pBsw7CMT4wS%2FRo%3D&reserved=0}\\
>>> +     \phantomsection\label{intro:rfc3168}\textbf{[RFC3168]} &
>>> +    S. Floyd., ``The Addition of Explicit Congestion Notification
>>> + (ECN) to IP'',
>>> September 2001.
>>> +
>>> +\newline\url{https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fhttp%2F&data=05%7C02%7Cparav%40nvidia.com%7Ceab35f44f49848fc8e8b08ddff7fdb9c%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C638947646846783353%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=N20ttoJr21E0K0P9fo5Wu9tpme%2FkGOR4fR0B1qV5b9s%3D&reserved=0
>>> +s%3A%2F%2Fnam11.safelinks.protection.outlook.com%2F%3Furl%3Dhttp%2525
>>> +3&data=05%7C02%7Cchia-yu.chang%40nokia-bell-labs.com%7C9bd29c383d0e49
>>> +6aa3c708ddff2c774a%7C5d4717519675428d917b70f44f9630b0%7C0%7C0%7C63894
>>> +7288674266369%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiI
>>> +wLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%
>>> +7C%7C&sdata=AjjuXnQgsRppd33zhfiyfkIaWljEuCZR8T%2Fl8cvXby8%3D&reserved
>>> +=0 A%2F%2Fwww.ietf.org%2Frfc%2Frfc3168.txt&data=05%7C02%7Cparav%40nv
>>> idia.c
>>> +om%7Cc6ffebfc748f4772784708dddb2a50c9%7C43083d15727340c1b7db39e
>>> fd9ccc17
>>> +a%7C0%7C0%7C638907696998249586%7CUnknown%7CTWFpbGZsb3d8eyJ
>>> FbXB0eU1hcGki
>>> +OnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIj
>>> oyfQ%
>>> +3D%3D%7C0%7C%7C%7C&sdata=q7NaQPhNzVlOz0bGZVTw5ZYWFcq412q8J
>>> 57YHxTpkMs%3D
>>> +&reserved=0}\\
>>>   \end{longtable}
>>>
>>>   \section{Non-Normative References}
>>> --
>>> 2.34.1
>>>
