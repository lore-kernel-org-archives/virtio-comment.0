Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2081.outbound.protection.outlook.com [40.107.237.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDCA4D8A1
	for <virtio-comment@lists.linux.dev>; Fri, 30 Aug 2024 02:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724985449; cv=fail; b=oGjmGYYrBNYCS+qsyjWpNBS+qX29KNxo/FZfD+hgNXBqdCG4/Wc1zpkDx/85NyFLJMyPevO4ADC4zANwy0YUOHDT28jRXAQxnAYHHdYw9EqO4/bVj9+uP9Sa+jAZiT33AK3EfcXWLW1afeWUFk7u4vuNy8nv4MYu/JOwaC0+Qqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724985449; c=relaxed/simple;
	bh=Q7wA42pj9VTbbA8uWZUuRerN9qpTjheSy9dv5F+tvns=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fZDyD1kpK+CPz6BROT3hIdK+wtZNp0ZO0qmm/oXqqXC08Vcig2wCpDkXjJU1BQ+3A06EaNydNVpQMFVK2+6CgW9lflx/tb1rNjNA3dMgtuNIZTON/3OT5V3TOvD1MwVtVj23eoQaZxMTdunBmKU1xR4k/czk/WA2gpr+QLSdRhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=g9H+8nJU; arc=fail smtp.client-ip=40.107.237.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="g9H+8nJU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jMh7V+43fIwP4ispfi6CAgfgOcxvwMFehJMb1jrhOFcNX5ZBjGaYwrMSFW0ltEwS3i4ugN15dqOw2sN4dVbwzGp5ebGYPA+VD1GhaJ1i8rhguIEY9FIHOJwZ05IoGxUuNPA42hsN97Vyy0yFNW09rqMINSTqieR/h00GPGXcTW8POlkSLtUQVROpCqEYrvFt5WUNgxQJoXVDcO8lHo5RhkWTtdkk+s8R1H/c1rjLGulLSEd+C7pVB2oIAHoKRS2P9QX6PdWteURPBl97ypBd+7jbgDvvhOvKCo18tw6E9z/lW5Tll9HyanmzGSs3LLY7+wjSZIsMr8DZb/5uzIj8xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=294DWBH88U3hS0JW+g0mAtHCBefppDHAe+QBECbdFw4=;
 b=AbxN0+SY6BvuA+0/6e9XIAnG9KKw8E4ObM1awgxqZgat9k/iqStftC4upIXsnxrZoJX7H/Oi4qThHnx+qjmGbB2KestmoPs2vGhc6UoFSNP/cPjPnYwIB+z9O+A6hnsYS9xd+mCUvDya/84/jvVAw8lZfuddPLXAx6WPUDfGR3YeHmxz8xy69HClBd8hCV+/QFJrDP9DaRRo54O+/5MgxS/oJBqtE+HtMmV4li3IxFeP7mWcEGBY6MNndDuo56h9buIm6ks2uwUJ0LWZSsEp2Ng3h3cY0xR2+NzBLzhgxBpxL/bzYuzso8RQytKZx4Qil3Eu/XhPu00mu3hjBsO6nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=294DWBH88U3hS0JW+g0mAtHCBefppDHAe+QBECbdFw4=;
 b=g9H+8nJUqACPKmifHAtgeAiGNbNoshJdPivxW7UA9PgNnhzQtXx/v36ITIeHwvEeH/5paD/gqOZ9M+/4S0c8ji0NDX0pZ+BExeJJokBGpYxCfCaosKLAz33pNppEhctpclU21ee+tDH2z8sO1w856mv8IIK1IDMoIPwYR3IGS8M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by SJ2PR12MB9190.namprd12.prod.outlook.com (2603:10b6:a03:554::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Fri, 30 Aug
 2024 02:37:24 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%4]) with mapi id 15.20.7897.021; Fri, 30 Aug 2024
 02:37:24 +0000
Message-ID: <bbebed0c-c4d1-4e9f-95f7-da0d1c12d220@amd.com>
Date: Fri, 30 Aug 2024 10:37:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
To: "Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>
Cc: "cohuck@redhat.com" <cohuck@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 David Stevens <stevensd@chromium.org>
References: <20240801113516.22155-1-lingshan.zhu@amd.com>
 <IA0PR12MB871379BD50370080A9B6849EDC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <50dae8fd-de3f-49cf-9b90-b53f0416133a@amd.com>
 <IA0PR12MB8713E194469A590D09B1BA1ADC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <fbcc2cd6-793b-495e-b036-7baf77e87e33@amd.com>
 <IA0PR12MB87138A02C6F9F6282EAD8236DC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240815065136-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87139D0ABCD441C9EB10F5EFDC802@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240815110443-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <20240815110443-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0003.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::20) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|SJ2PR12MB9190:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d72899e-08b4-43d7-4cc7-08dcc89cae48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MzJlV3k1cDZCYzFyNnJRblJhQlovamRvaVNSd1RQbGpNOU1YMFFlcVZqV3dI?=
 =?utf-8?B?OW5VdjI2c3lOTU00bFoyTDZHVE90TE5uN0hEVGVNbW9hNnFicTE4MTBDQ1kz?=
 =?utf-8?B?RFRKRGl0K1FvWGU3S2MxcUJmNk9EM3M2bWV1eTEyMU9mS3JWakl5RjllblZq?=
 =?utf-8?B?dGM1eVZ2b0tPZWN3Q1ZtdWQ3NWhNSDgvdjZ2alFKRjVEV0NTbEc1VVdiOE1y?=
 =?utf-8?B?WlBCU0k1N2xrTG5qdE95Q2FLbytaWWdoS2hNYkFCUXluNFoycGptMnRpckZr?=
 =?utf-8?B?S2pUOCtpa1VHVmR1eU45VFhkYjJ3UXUxSkZ4UVVhS0o5VXRwYzZHb1N6ZkhM?=
 =?utf-8?B?bTBKdkliZExGUTZNK3FiblRIczNCcGpmaXJ4ejVEOEYzNlRmWjlweGRpdFcv?=
 =?utf-8?B?RnhvTVcrV0M1ZUcxRlZER25HTzZyNWtTVnpnTm5wOXZjMFVxVW1ubURPT01s?=
 =?utf-8?B?SGoxMmxYWlpiaGxYRjg5NVh1WVBhSFV0R0s3aHorNEhvdkFOZWlNL1dWOG5M?=
 =?utf-8?B?ZkJkY0VBbFpRR0xXRE5MWHZaOTU1MlNsd1VUL1Q0YWZsZ2JzZ0VFSXppNU5Q?=
 =?utf-8?B?WWZNSk1qbG9PTkVCWmlwWkpsMmEydE5scXNnMVFTenBuYytnQnBDQUd1ait3?=
 =?utf-8?B?aVB1aVJWT3J0QVhDOXltTzFBL202WEFVMzBoNllkRlJobDFwaGVrblY3Mkdk?=
 =?utf-8?B?KzhjaGl4bzQ2UVNYMlEwL0VHYUZwWHNEaGxCNERsUlFNSjNudUhkSjJmcHc4?=
 =?utf-8?B?WXQ4STk5S2tybEEwcnA3Z2Q1VzUzMHQ1dlJoTFgzSVNhVkVPSklMbVNSWFpO?=
 =?utf-8?B?aFdXZjkwSGlqdTIzUm5QdklXclJHRndLVlpTTTluN2tLaUlSL2RVME1FSDJk?=
 =?utf-8?B?blBpbWNsQmpSNDNZV203QjM4WDY0NTJIZGN6MUd2WmpHNDl2YnlaZW1lb0xO?=
 =?utf-8?B?Z0RaT01kTE51V0JpM2hXWUNsSmVJSEducVhuYUpnaUZwdjNIVy9STFg3OXVS?=
 =?utf-8?B?VXJiY0s4ZzUxditXM3B3a2tUK1pOZGtkbWxQY25saFVPRUpUU2NLTE9JRTlB?=
 =?utf-8?B?UzFMYnZnTTcwd3Zmd0xlZThQbFNaVkJVUnZtZDh6OFQyaVVOWitTVXFTaW9Q?=
 =?utf-8?B?bldKNGg1Mkx6VjZTRVM0WWhwR1orWnVWNllLdURXZ2VIbVB6c2xMZTQwRGEr?=
 =?utf-8?B?MjBZV3B3ZGprRnhoRGVyUVF3QWR2WkdBaStYbkVNaEJGTitEelhhYVk0c1dx?=
 =?utf-8?B?NnkwVUtZcVBKWHo1Tm5wQ2xYaTNlS3c1b0QvRDNic1lGWU9LZlVLNG14eXJP?=
 =?utf-8?B?dVplNU5sVFJMRTl5dE9tZ0pvRHRGWCtMYndnb0RYQ2c5NmYwMmtOYXFLVzZh?=
 =?utf-8?B?alFoTi83QWdwdXJ5ZnhhRmhEY1l5bTY2eW5NL25HL29GVGFlR3JhZTZaMWlz?=
 =?utf-8?B?c0t2OVV6VHFISlA5cHhFNGl6T3RGUjY1dlpBZlpSbmZTQW5XTHVsUFprN3dR?=
 =?utf-8?B?U0FlRExYVUhOdmxWUXorNmp1V0dUVWxjdDB3U1pRd0hUcGs3cm53T2dYSkpS?=
 =?utf-8?B?VnNJR3BhQmUxR1JTKzloT1VRRDIxOGxPUjRYdk9HS0k0U2VEdExTVmowOG44?=
 =?utf-8?B?d2RKZ1JIdGNGMkVwK2QvWWRWL3dWeFB5cGxaRHlBeU9tMjNDUllBRHF5dnp4?=
 =?utf-8?B?aXdTSmRTVnduR20zR3loMFJtbFk0Z2pJd3pvMGl6TVRTek4vZUkwa004YnpV?=
 =?utf-8?B?ak9IV2ZZMGFRNU1nRWV0WFM3WGRPVnpsV1FXbGs1TEVITk1Gd1NRc0JtSGcz?=
 =?utf-8?B?SWoybnZKSWIwY0x5azAwdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3RsNUNRM1JaMkdOY2hPa2YrenZoVng3WkwxZktxcFFHTzlMZGloN1ZMYngw?=
 =?utf-8?B?RVZmcVBLL3FMb0NjMUhvWGJrYkhsVGtIdllqYnVIUXRBdWhWcThlSDZLd0hi?=
 =?utf-8?B?L1ZXeVk1eU5VUFlOUHpOVGV2QU9pa01BV3lsZWZZeVpwYW1EQUg5aTdzOHhJ?=
 =?utf-8?B?aENSN3R4cnRwVzdrbGMwd1hoQmdmZTFrMHpOZ01CRmhZM25JSElYT1ZlQkEz?=
 =?utf-8?B?eUNnWlBGWnkzUUs2eWw4SVFNZ2V6TURwK1NHbHJieCt3Mm5lN3EwTFV3OHFX?=
 =?utf-8?B?MVJ3a3E2YmtpQ0N1SS85RHJnR3krV1ZYU1VmbkZDT2VQQlo3NXYxKzVkVnFl?=
 =?utf-8?B?N0NiRTEyc3ljYnV6U2xUNm83WXFiUWkrcjAzNkR2elBHWDh0eGwyOEpFZkVV?=
 =?utf-8?B?bUFheXkxaS93eDdhS085QWhSYU00ajVaeXo5SXAwQkRjOGRhVGsySUEyWTFB?=
 =?utf-8?B?a2VQK2wvOWsyMExIMi9XUFVyWlVhTnFGall0KzVIeE8wclBIYmorbUE4bE9J?=
 =?utf-8?B?eFlaY0NONE8zK3hWZURScXNTYXIrY2YrRHVQNEEvWTlhWFo2TlBvS3AvZ3h2?=
 =?utf-8?B?SjNuaXFZT2tCMGt5ZDVmdjV0ZnFEam1jUnhYQjJtUkdWcURyVityaG5uVXhF?=
 =?utf-8?B?MGlReTNKd1ZaTVdEd0c1WUZRRTl5eUR4ZWRMS09aTmVTTzYvZSsyc2tDeHpH?=
 =?utf-8?B?YjZsaFhORkpLVmVlTkI2SlpEOEtTekozWWFVMmhTNy9HSHFnSlI5U242aHdO?=
 =?utf-8?B?ZW9MRmxvYkVmZHNRd2xJWll6WGZtS0xIWnh2UEhoU0h6b3F0Z0dkUFFMSzNm?=
 =?utf-8?B?dUNzUCtwblQ0RkVnaWV4Y25EK2k4WXdMYkNEZUdwSzdmcXd2RVE5bi8xWnBp?=
 =?utf-8?B?bWRuazUxbzJSNjgvUUgwT1ZCeWtlZWgwMThPUHdHQnIrSnJMMkNkSWNOVlg1?=
 =?utf-8?B?ajEwY2g1Y0NLTEJ1WFc3QXRpeVpITWMxYlB3Rzd5V1llVlIvNGkwelFtK28v?=
 =?utf-8?B?N050NDNQU2dZMHZmQ3Nxdml4eDg4VnJzYWR2ak0vOHFHU2R6dnFERFdSWjNO?=
 =?utf-8?B?QlN1TEE1ZkgzMUdCdGVjclZ0SjZzbjgvV09KemJtMFpCSHlOM3MyM01uWFBv?=
 =?utf-8?B?ckQxTFlYa3ozUXQxU2ZLSlBLY2JOUFNqbUo1TGNxaDRKdnZETUxWVjJ0dmxI?=
 =?utf-8?B?UTFSalRoajl6NGkwb0JvOEJuNnhrT1pzUVhzcmd0Si9yNWhDQURiZjVOVlJu?=
 =?utf-8?B?ai9BYW5xeEJJSFF6NjRtOEpjWG50dDBPdy94MkdaV0ZuaG5BL3E0SEZWd0xt?=
 =?utf-8?B?U09mYk1vbC9KWmJENUR5TXBtOEZ3dFlaclN2eEJVMVQvVEpNWlk2MFcwVDN4?=
 =?utf-8?B?bHZXMGs5dFZnVno4MFF2ZkovNUsxN01FYVluRFVlYlphZ1YzVDNNMm02QzNn?=
 =?utf-8?B?TmZTUHdRL0RqRGlQRWw4NFRQQ0JYMi9SVWhGNmppdDduNTIyc0xwVmRqVUJI?=
 =?utf-8?B?Q2EybzV6L3V0S0xUY3VveWJwZlJBeWJzZ2lMU1Y0Zms0NzdnN1NOUzZpNUV0?=
 =?utf-8?B?YXJtV05SSDRjd1BIb3YrVlV4NGlKWDZCa1ZHK0QvbWZHODlxNHo5QTREUnRV?=
 =?utf-8?B?Z2RWcUt6WmwyYTFIMzZPb3R4ZlZvRVo3NzhxaEV0REhQdDZjVWNQaythc2ls?=
 =?utf-8?B?YTRaS3hnZXJ4dEhPaG1vUEpSazFEN0ZHaXpheklsWm5aWG5yNnNBUGhYMVNB?=
 =?utf-8?B?UEErUkFNME9YR0F6THN6UnhuUmhSMHJiWFUrMGlTL0pRNEhRYjdkWEdDR3Uy?=
 =?utf-8?B?QlBoZS96U0NSeVJ1dEZuYm1vREIrcXFDeUZXNWFGZEZoam83bFVhODd5YjNs?=
 =?utf-8?B?UzNnMkQ2aGlVT01RRE0zdEFKc3Q3MkN0UVVnTzdha0JxZWpOQXM5VEFmZlhK?=
 =?utf-8?B?L1lqaXRzMEZVeXpUY0YrR2pVRVFWNnJERFV5K0FXb1JSck42MEJiMi94VC85?=
 =?utf-8?B?RmlLclJ6MTViZ0k0OVBNYzRqUmtCRkhXTk5GNTRoV205bEp3UjBuQzBzdS9I?=
 =?utf-8?B?MTBYR2x5Z1Bwa1BmVklTQXV3T3o2U2NEenk3M2QyRGJrbHpSb05mcVhNSzJq?=
 =?utf-8?Q?VRvoMMkgtwJCFHra5hfTrKFH4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d72899e-08b4-43d7-4cc7-08dcc89cae48
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 02:37:24.7008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X5ClBUqdfLxOsimUj+9L0gNJCilC2x7RNXgdTHLzoPrx3YwOCSMrkI//36feD/mJiKBRifufg0/ojlpB4Q6dpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9190



On 8/15/2024 11:07 PM, Michael S. Tsirkin wrote:
> On Thu, Aug 15, 2024 at 10:59:45AM +0000, Parav Pandit wrote:
>>
>>> From: Michael S. Tsirkin <mst@redhat.com>
>>> Sent: Thursday, August 15, 2024 4:23 PM
>>>
>>> On Tue, Aug 13, 2024 at 06:55:04AM +0000, Parav Pandit wrote:
>>>> That means, PCI HW needs to return suspend=0, until the device is not
>>> suspended.
>>>> In this example, the device cannot build special circuitry to answer
>>> suspend=true within 50nsec, or in other words building special circuitry to
>>> return suspend=false is too complex for the slow operation.
>>>> If this understanding of burden is clear,
>>>>
>>>> The proposal is, can you please extend the interface such that,
>>>>
>>>> 1. driver writes suspend command.
>>>> 2. driver reads suspend_status, and receives not_completed=(false). This is
>>> the default value.
>>>> 3. When the device completes suspend, it changes the polarity of
>>> suspend_status=true.
>>>> This has two main benefits:
>>>> [A] This will enable software-based devices to write data to slow files and
>>> does not have to force VM_EXITs.
>>>> [B] It also enables hw based devices to not build special circuitry to answer
>>> within 50nsec, which can get very complicated for tens or hundreds of PCI
>>> PFs.
>>>
>>> I read this several times, and I don't understand what is proposed.
>>> A special register for suspend/resume? Is this the difference?
>>>
>> Yes, a command register for suspend/resume operation.
>> And device_status new bit that Lingshan defined returns the status of this operation.
>
>
> Ugh, it's all quite messy IMHO.
> We have 4 states:
> - operational (resumed)
> - suspend in progress
> - suspended
> - resume in progress
>
> What I'd do then is a two bit register.
> To suspend: 
> - write suspend in progress
> - re-read, waiting until suspended
> To resume
> - write resume in progress
> - re-read, waiting until operational (resumed)
>
> How does this sound?
This can work for sure. but is it a must?
I mean, the driver has its own knowledge of how it operate the device.
When device presents SUSPEND == 0, It know whether the device is in normal operational state or in the progress of SUSPENDING.

But if you think we should add a new register which applying for all device_status transitions, NOT only for SUSPEND. we can surely do that.

Thanks
>

