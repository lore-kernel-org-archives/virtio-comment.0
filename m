Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F8F2E62A7
	for <virtio-comment@lists.linux.dev>; Thu, 26 Jun 2025 13:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944354; cv=fail; b=S/QPIUYizGmhHM44QeWseuuJHLFfBclwtLNKVko3Q9Pv65iar3pR4SZ2BBfYSBv+22ewN/5vScKfWEDeFbIgAPclsSqWO30ndVl/hinlA2YrPAP1pWvyrL0InDUv2a19zzsZeSpct6vGhj74mfiC3kPTBhxVS/Ejwqo2htTgnl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944354; c=relaxed/simple;
	bh=RPDU1jM5mmlWI1BVLhGt6jlfNt5e3t1FdSWSP1+OQgw=;
	h=Content-Type:Message-ID:Date:Subject:To:Cc:References:From:
	 In-Reply-To:MIME-Version; b=aNV/7qEVASSe2y/Qe9bs6LmWDg6aOfKMddLn0HqshgzWmUjoKlKQFDbhIsv7whknE74vUB5cQBadYgd21iJLFnn9OAazTsOPJMVaxUtEE/x+ArPjv9fSqhLS+mMSJKkMZS8h1xqScxU/hTNZ4zA4enEwT5Rfm6Bg47SX+mjPI50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Aob1ZeW2; arc=fail smtp.client-ip=40.107.92.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Aob1ZeW2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eIXuqQH89T7JOtBYiA4U7OFBs6452S37PuVVm2xIuuL2aLw8laERy2HVfXjFyJglFFlRUigCSmoKewxDWmdLYC9tpUpDn6GTh76YRcrfWBLrwAVUbX+z0VNxUvb3XmCfydCFueOzde+CYlkG2fUuMJb7fbRdW4tiO97ay76GDa3BU+MuH79AEVyJz0t+6nKD7r/wLLJkgdcSbRc+jCDglReW79jVzvkpg/SNXCLHW9TL/TVinoC9beHjqUd3Gwk6mccUENXnLjnEnZuefikkgkj/zwBa/s9iReVGYNX1Bx/sERt/mPda9brmiNxoeBqfUZ4fV5it4gvc5bedrx0U1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQWsxRkuaNhN19knT/zpIHwRdP81sJnzlsnDVdG9wvw=;
 b=USMEXKogGBiAccaNteLEofT/qvycHd8fwsimmlmtLw5kCM+Wx4d0mF4wsH9Kw3v5lckbwVPf2r5jbtt0Q06Njg0AMZhjyEgA+wIY2dSIpPgpPuBSzi2njmvuMtp2Z3XQiFCvUrbe82QCkFkVFeFv/zglwhIJGOjONJ5Vsr7CyfI2FTp0lf4iWr+qRSlInY60GMDBikiG050WEheNLYub3rZYKG1jXdNiQQuCdIKZQQ8GiG971S8VtQkKs/f71PjlYAVidHC/PVJjHBEp11NtTYH/TCxbblTa3XDZTCVJeTuDHv+J8yyuqDWWYEWwM1q55GT4sV5kGDnnDzzInnWfyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQWsxRkuaNhN19knT/zpIHwRdP81sJnzlsnDVdG9wvw=;
 b=Aob1ZeW23djELiBw1JpCD3K3lLqyzEGVvt6xg54+kiJW7rU5r6EzPFekoaAHHt9I0yIvhFVGCKjZu1Q7/gfHrxVkuT7a3d71mPALxK6t/k6WUY5ND5m6IlD/jE3zoJfCJlMNCpS2WQHI/fctz35fHU9gj6aKVQKTsFpgKLtFb5A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by CY1PR12MB9557.namprd12.prod.outlook.com (2603:10b6:930:fe::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 26 Jun
 2025 13:25:49 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%6]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 13:25:49 +0000
Content-Type: multipart/alternative;
 boundary="------------RHDjBNu0S73FHP26jO9EIxSi"
Message-ID: <092e01c6-1756-4293-8183-8efea6720548@amd.com>
Date: Thu, 26 Jun 2025 21:25:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] virtio: introduce SUSPEND and RESUME feature
To: Parav Pandit <parav@nvidia.com>, "mst@redhat.com" <mst@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "Ray.Huang@amd.com" <Ray.Huang@amd.com>
References: <20250623083637.296041-1-lingshan.zhu@amd.com>
 <20250623083637.296041-4-lingshan.zhu@amd.com>
 <CY8PR12MB71959BD1BFE6319F6E05A7FDDC7AA@CY8PR12MB7195.namprd12.prod.outlook.com>
Content-Language: en-US
From: "Zhu, Lingshan" <lingshan.zhu@amd.com>
In-Reply-To: <CY8PR12MB71959BD1BFE6319F6E05A7FDDC7AA@CY8PR12MB7195.namprd12.prod.outlook.com>
X-ClientProxiedBy: SG2PR01CA0142.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::22) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|CY1PR12MB9557:EE_
X-MS-Office365-Filtering-Correlation-Id: 5028e9e4-4931-4279-8483-08ddb4b4f717
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cEsrWlN3STI3MDVWUkNkMkNVM1VTZ0VqL2grTHA2b3JLemtXTHAzV3RNT0Vk?=
 =?utf-8?B?UHh5R045RUVYTVhya25HeTI4SjUrbXhzKzNHRFRJQUV3Z0cwZTFpdDlLRnR6?=
 =?utf-8?B?ZnBFd0gzTk1tRFJ3M3ZmaHJmbXBMbjU2Z3g5V3JhcmV3WGhIQUZZOXEzblV2?=
 =?utf-8?B?M2hJZ1NrTk5hK0hQSDkvcTFwQlZPcDNLZEorMURNUC9McVNSY21IeTc5eE1H?=
 =?utf-8?B?LzNIb3dIQ1g1RkU3bkszY3k1SC9RSEZQd0JjbXNnL25FRmtBSGZhMlR4UTVh?=
 =?utf-8?B?YWRUUkdLZTBJcGNsOWhGWTJOcFhvZTVyK013d1NnVHF0N2daN3NiMzRxdWhH?=
 =?utf-8?B?Y3cvcGMzR0h0QndQcWZzNzh5RGhCcXI3L2RBbThLZHlMU3p1dHhRU0ZZVGFB?=
 =?utf-8?B?Z3hqbzhDOUtUemJrWEZBM3Z0MlNRM2t5UWN3TFQwTE5ZYzdKRFFMNjhRRW85?=
 =?utf-8?B?R21lWUZHa3kwWTVUOUp1L1VwWjFiRnltSTZ3WlJLN3h6Y2IvWTJTS20wVlYr?=
 =?utf-8?B?QUxTVmVvZjBodkpxeXloVDhpaWZuSFd1c3dwazNsTkxXNmROZVQ2MlFldUVh?=
 =?utf-8?B?UzZIK2EvQWhGZmNWVFFBSzZ6dlkybnI1M1dWR1RJZ1p0aVVNdmlFaVl0WXhE?=
 =?utf-8?B?M29NR3lRZzFmL0ViV01SdkJnaExpU01XelVuSHRWNUxLdGZjSUdxMVhJZ2d6?=
 =?utf-8?B?UFVvM3paQ2dkdjB3eUNWQ1B3SklaSTZ6VTNyUjhjd0VtbGpsWGF0VHpoUzRv?=
 =?utf-8?B?dmxuSFowa2FSdXJwZWEzTjlMcktMZElYdVgrMFBlTmRYREtmSkR4QXlkM2dU?=
 =?utf-8?B?WnN5bmxrVThONmxiRUxIK0ZXa2FWM2FDTEZVMWlQcVgrMlF3Q05vbER6U25O?=
 =?utf-8?B?bDVVMnpRMFoxU0ZPVGFmcXdvVVZ2alM1TVFHMVBQRXpEaHQvTFJJckJxWVo4?=
 =?utf-8?B?c2pnYUNNTDhZbVFzMW1wWGhpeC8yZGlSRXdaczQ0UWltMWljRVF6NGNFZDV5?=
 =?utf-8?B?enNMYjN1NmVxcDAxWWF5Q1RGZjVzMytZQ0hsNmkwSDJjTEJQTEJXczhCaSs0?=
 =?utf-8?B?QXNOSFZ0OVlKdTIzblJFeFNDUFZaNkg2Mm1ESkdLVEZDNnFZZ1JmbGltZXNB?=
 =?utf-8?B?VDRTRTkwQmloVjh4UUN6VDlFQ0tUU2I0Z3UwUEpUU0lBK3AvR2k0SjkraFVq?=
 =?utf-8?B?MHdCWHV4SG8rbHZULzM2TW90RGptRDVwL05wbnpBSHlhTmZ6bStidWIvQ0pj?=
 =?utf-8?B?bzdDOTlwVExkN1BnU1BGTDNRQ2RnNzlENVFSUHNMRCtKNlowK0pzSWZjMFgy?=
 =?utf-8?B?RDdKeTVnQ3JkdnlqN29MMGlqUUhIRnViZHNYQzBVZzhtc1ZJR3lOaXBYeEkz?=
 =?utf-8?B?Q002REduZ2ozTjhzTHRPTmw0TklRbC96aUdTUEl5dzR1SUJ1dTlyKzlQcWl2?=
 =?utf-8?B?NWllZmpwZ2FGUmZiRUVSUkY1dU9GanVSTHdlN2U3NVlDanNoeTRtN01DVDFq?=
 =?utf-8?B?RmlLd29ka3h2cSsrRmt0NFVqQlpGZ0ZZeVRKS1pGT2tYSW1PeEtOampWb3JD?=
 =?utf-8?B?MFlaSmFVSFlHbnZqZXlLQjA4b2NXNlNqRm44UzhZa1VHVE5LdHRGQTZVTWl4?=
 =?utf-8?B?dWppeGF6aW5wM0YvNGlHV3lsOGdPSXhFcWI0VXhDUytTeVJab0Q3ZGpJZ2h6?=
 =?utf-8?B?MnlXQ1VncGdVK1Nrd0VGU1laMGc4Z3pIOEpEYXcyQ09rVXdmVWNyZG5tZyth?=
 =?utf-8?B?b3k1WkdnVHkwdkJQSEFFTmJLbTFUTjN3VW43UjlLenZYTDJ2SXJFVGp0OWox?=
 =?utf-8?B?dGlMRTVDT1Z0ekM1cmtMQVlzeVBvTlFla0N0cXNJSDcrQytSRkNKYWJnaWp4?=
 =?utf-8?B?b0U5Qkc0K3E5ZkdjaUVyY2FTdGJKSkxwMVJsdEwydEpXRW5zU0lMUkNWaDY4?=
 =?utf-8?Q?8BtvOZYty+Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0psNEtiUVlLMi82eTA5SVEyTklGZ2IxZkUzYWRJM08zTWgyUmdGOUsvTUlI?=
 =?utf-8?B?YnF4ZWZDdU1pQkVvTUNqV3V0WDd4Mk56OXZaMFRvK0tHMWRNb2tLRks0WjY5?=
 =?utf-8?B?UVZLSDA0eStDandnVEF0YTlUZ2RKOXN4ZzNaQ1lxKzhMVVJHd1hLc0hSY1lN?=
 =?utf-8?B?T0lYZ1doc2JXckQ3YVNXMWN2ejFsc0FQVTVERithY1c5MjhpV2NjQmlJZTU1?=
 =?utf-8?B?Zlp2ZEZGdDNOKzJzdHBwa0plZlQwbktFY2ZScGdpYkUrSTdZdU5kckEyM0xW?=
 =?utf-8?B?bzRna3RpZi9iSEE1N2JLdVpnb29GaWdEVjBhUndNQXpIN3RqMFJlNnVlZ2pa?=
 =?utf-8?B?VHlzM0NWK0x1aEN4WmVmaGt4dUcxcHFGTWxqTFhkTnhSZkpXclBXWXRhQUw0?=
 =?utf-8?B?YnFweGxKZmIrd09hZFV2eHRTVVYxWVlNZUI1VThCek0xMTZzc1M0ZzRLRll4?=
 =?utf-8?B?K1hxeDVCV3owV1QzNDBRZjJaOS90NDh6TVhkU2loKzRjYlp6K3d4b0VTZWZQ?=
 =?utf-8?B?TW9FTGp6MWJaaFNZdHNMTzRNWnJyNHo1Ry9rU2NFQ3hDVlN5b1VjeWV3S25h?=
 =?utf-8?B?Tll3RVBJb3BvcTlZS2VYNnR0QjRRaE1lNUNIZHJPZGJXdnpNdmo3QzJhRVd1?=
 =?utf-8?B?V1MwZkFZd0g2a3JhY2c5emZwTk02OTV4UWQvMkkzRldzRjlyNzdUOFJCbnV6?=
 =?utf-8?B?emJqMzhBeDh4U2pJcWpjTzI0cEMwdEtMUGxTN0s0RXZ4MVV5c0krbmJDbTVt?=
 =?utf-8?B?Nmlvb0FzWXB5U3VmQldPeWt4SDEvMkNDNGd5NURGZlRGSXpYR1BKRDRKRDVN?=
 =?utf-8?B?VDNTajZiS1VzYjdlNFZmOEl3NUprWkppSGZxbmNSV3FNamdjNnkwdUczWDFT?=
 =?utf-8?B?Z2NDTC9vaVNISlRJbldOMU1YbnlkM0FvRTNGdDh4eDhuZWJEOEg5cmlrZGJL?=
 =?utf-8?B?WGIzU1MwUjBSWUJkR1J5SnA0TUI4VDFlNmxhckdHelFCWFFiL09qaUVvc2tr?=
 =?utf-8?B?M2p5Y1RiZTFHUjhOOCtUTU1zeGd5aUQ2eFVFVUplSFhmYlQ5aFJsVjhUTnZm?=
 =?utf-8?B?d243TnBjK2t6VDYzT3hCbmFaVWZBNkVvMTVpbjNNbngyTTR5ZE9PQitBNFM2?=
 =?utf-8?B?Z2tDR3AreDNTK1p1czJYYXV0bVRxNDRNODhXQ3BXdmxyMUZ6b3cwb0hYWU9Q?=
 =?utf-8?B?M2pIMitWc0YzMEhOc1hBZW0wS1c3QUl1Rm5tb1AyUzhKZXFGSTB6MFVwK3Mx?=
 =?utf-8?B?OWtISzduNkNsMWtFTjJPOFFueVQ0UEpGWEVONWZZZEtXSUx2K04wNjRFYUwx?=
 =?utf-8?B?cm1aYmJVUUloVlpZRUk5S2xkdURWRkgydFBNOE40anllQmRQQWdCeDVSZW9k?=
 =?utf-8?B?OXJjdTJqODhoWlVOQmlXVHRjNUFKVEZkaHJkWXRWTStYOGRRc1lJTGNQU1d6?=
 =?utf-8?B?Q1dGT2FzWmFMOHNVeWk5RW90MGgwOTU5R3dUT01hKy9mUXpnNWl4N3hRL1ly?=
 =?utf-8?B?dUJuMTNHOXNMTTZvY29NbUxkRzlPUlh3TUNBWm1BeE5aM0hKVUthbUh2Q2Y5?=
 =?utf-8?B?WUNkRDR5cFZpOG5tcXdaWHU1bFRKeXlGZ2JPaUh1TWhpYkFwNnNwWTFQcW1L?=
 =?utf-8?B?SE5qL2lOSjJQU1FlcThPVExyT0c4Skc3WkRRS0wzenZhSVprVnV0N2tRZGgv?=
 =?utf-8?B?Mnl6ek56czBIdXB5MW9FRWg2V0RjcndmSnhyNHVDUHFlMnVjdS96eWhRRS9O?=
 =?utf-8?B?SXdyZ0hQLzAwRTJ3Z0tYTnovRFZWL0VnZmNmR2YzMEphKzluejlldyt3amQz?=
 =?utf-8?B?Tno5Um04ZUo4S3hPMnJQbU51OXAzc2dEaXdUQUk1VDhDYlRRL2RneGNmOXpV?=
 =?utf-8?B?b1NpV0Ria25UQzBIeVVXZnpJZ2c0dlV3cEpGOEc3MUxKR1llSUU4UlVlRHp1?=
 =?utf-8?B?cWU1VlVTZXUwRW1TZFRwYk1uclF4UnNnbkhpbnVYaWNsdFhmSVg2aU9BZzFR?=
 =?utf-8?B?VFoyVDJiRzlIUE1YeTEzUkp2RHlTcDZhYUZIb0NRblFvUHVJTVVSNGNUKzNB?=
 =?utf-8?B?cGZ5ZHZieGY3MnZCRmIvbC9RUHBVK3BlYUdGeWVPREFJa0ljQUE1Y1I2dFNQ?=
 =?utf-8?Q?2EunebgrbZ9nxbao8QFIsSNqQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5028e9e4-4931-4279-8483-08ddb4b4f717
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 13:25:49.1065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nxFwigBM9UsCvup3s57c60+gNr5TUxLzg28cnMvXxTqisuOSjqdlXp7pgJ+AW81mO5hVxzN6evVqAlymKnrI2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9557

--------------RHDjBNu0S73FHP26jO9EIxSi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/26/2025 7:59 PM, Parav Pandit wrote:

>> From: Zhu Lingshan<lingshan.zhu@amd.com>
>> Sent: 23 June 2025 02:07 PM
>>
>> This commit allows the driver to suspend the device through a new device
>> status bit SUSPEND and resume the device running by re-setting DRIVER_OK
>> bit in device status.
>>
>> Signed-off-by: Zhu Lingshan<lingshan.zhu@amd.com>
>> Signed-off-by: Jason Wang<jasowang@redhat.com>
>> Fixes:
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgith
>> ub.com%2Foasis-tcs%2Fvirtio-
>> spec%2Fissues%2F229&data=05%7C02%7Cparav%40nvidia.com%7C3085ab
>> 378f264b5c845808ddb2313478%7C43083d15727340c1b7db39efd9ccc17
>> a%7C0%7C0%7C638862646595099882%7CUnknown%7CTWFpbGZsb3d8e
>> yJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIj
>> oiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=Pf2ub%2FwVzdmf
>> A1JjScOJ7D%2B%2BNea9XgVFYdvvDQxym40%3D&reserved=0
>> ---
>>   content.tex | 59
>> +++++++++++++++++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 57 insertions(+), 2 deletions(-)
>>
>> diff --git a/content.tex b/content.tex
>> index 2e8da46..c987334c 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -42,6 +42,9 @@ \section{\field{Device Status} Field}\label{sec:Basic
>> Facilities of a Virtio Dev  \item[FEATURES_OK (8)] Indicates that the driver has
>> acknowledged all the
>>     features it understands, and feature negotiation is complete.
>>
>> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that
>> +the
>> +  device has been suspended by the driver.
>> +
>>   \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
>>     an error from which it can't recover.
>>
>> @@ -99,10 +102,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a
>> Virtio Device / Feature B  \begin{description}
>>   \item[0 to 23, and 50 to 127] Feature bits for the specific device type
>>
>> -\item[24 to 42] Feature bits reserved for extensions to the queue and
>> +\item[24 to 43] Feature bits reserved for extensions to the queue and
>>     feature negotiation mechanisms, see \ref{sec:Reserved Feature Bits}
>>
> Ignoring this delta as the fix of patch-2 will change this.
>
>> -\item[43 to 49, and 128 and above] Feature bits reserved for future
>> extensions.
>> +\item[44 to 49, and 128 and above] Feature bits reserved for future
>> extensions.
>>   \end{description}
>>
>>   \begin{note}
>> @@ -629,6 +632,54 @@ \section{Device Cleanup}\label{sec:General
>> Initialization And Device Operation /
>>
>>   Thus a driver MUST ensure a virtqueue isn't live (by device reset) before
>> removing exposed buffers.
>>
>> +\section{Device Suspend}\label{sec:General Initialization And Device
>> +Operation / Device Suspend}
>> +
>> +If VIRTIO_F_SUSPEND is negotiated, the driver is eligible to suspend the
>> device by setting the SUSPEND bit in \field{device status} to 1, and the device
>> SHOULD set the DRIVER_OK bit to 0 once it has been suspended.
>> +
> You ignored the inputs.
> I do not agree to add the "SHOULD" normative wording in the general description area.
> The reasoning is explained already.
> Please adapt to the existing style of this spec to keep the normative in requirements section.
>
> If VIRTIO_F_SUSPEND is negotiated, the driver is eligible to suspend the
> device by setting the SUSPEND bit in \field{device status} to 1, and the device
> sets the DRIVER_OK bit to 0 once it has been suspended.
>
> Is this really that hard to write above way?

I believe you totally ignored my replies in the last thread.
There are no rules forbid using "SHOULD" in any non-normative sections.
Now here I copy the reply here again:

In the spec section 1.3 Terminology, it says:

The key words “MUST”, “MUST NOT”, “REQUIRED”, “SHALL”, “SHALL NOT”, “SHOULD”, “SHOULD NOT”, “RECOMMENDED”, “NOT RECOMMENDED”, “MAY”, and “OPTIONAL” in this document are to be interpreted as described in [RFC2119] and [RFC8174] when, and only when, they appear in all capitals, as shown here.

RFC 2119 says:

SHOULD This word, or the adjective "RECOMMENDED", mean that there
    may exist valid reasons in particular circumstances to ignore a
    particular item, but the full implications must be understood and
    carefully weighed before choosing a different course.


Here this "SHOULD" exactly conforms to the definition.

"SHOULD" has already been used in non-normative sections, for example:
2.5.4 Legacy Interfaces: when using the legacy interface, drivers SHOULD read these fields multiple times until two reads generate a consistent result.

The spec does not say: “SHOULD” can only be used in driver or device requirements section.

@MST, we need your input

>
>> +If the device has been suspended, the driver can resume the device running
>> by setting the DRIVER_OK bit in \field{device status} to 1, and the device
>> should set the SUSPEND bit to 0 once it resumes running.
>> +
> Similarly,
>
> If the device has been suspended, the driver can resume the device running
> by setting the DRIVER_OK bit in \field{device status} to 1, and the device
> sets the SUSPEND bit to 0 once it resumes running.
same as above
>
>
>> +\drivernormative{\subsection}{Device Suspend}{General Initialization
>> +And Device Operation / Device Suspend}
>> +
>> +The driver SHOULD NOT set SUSPEND bit if DRIVER_OK is not set or
>> VIRTIO_F_SUSPEND is not negotiated.
>> +
>> +Once the driver sets SUSPEND bit in \field{device status} to 1:
>> +\begin{itemize}
>> +\item The driver MUST verify whether the device has been suspended by re-
>> reading \field{device status}, examining whether the SUSPEND bit is set to 1
>> and the DRIVER_OK bit is set to 0.
>> +\item The driver MUST NOT make any more buffers available to the device.
>> +\item The driver MUST NOT send notifications for any virtqueues.
>> +\item The driver MUST NOT make any changes to Device Configuration Space
>> except for \field{device status} if it is part of the Configuration Space.
>> +\end{itemize}
>> +
>> +\devicenormative{\subsection}{Device Suspend}{General Initialization
>> +And Device Operation / Device Suspend}
>> +
>> +The device MUST ignore any operations on the SUSPEND bit from the
>> +driver if the device has not been completely initialized by the
>> +procedures in \ref{sec:General Initialization And Device Operation /
>> +Device Initialization}
>> +
>> +The device SHOULD ignore any write access to its Configuration Space
>> +while suspended, except for \field{device status} if it is part of the
>> Configuration Space.
>> +
>> +A device MUST NOT send any notifications for any virtqueues, access any
>> +virtqueues, or modify any fields in its Configuration Space while
>> +suspended.
>> +
>> +If changes occur in the Configuration Space during suspended period,
>> +the device MUST NOT send any configuration change notifications.
>> +Instead, the device MUST send the notification when it resumes running.
>> +
>> +If the driver sets the SUSPEND bit in \field{device status} to 1, the
>> +device MUST either suspend itself or set the DEVICE_NEEDS_RESET bit in
>> \field{device status} to 1 when it fails to suspend.
>> +
>> +If the device has been suspended and the driver resumes the device
>> +running by setting the DRIVER_OK bit in \field{device status} to 1, the device
>> MUST either resume normal operation or set the DEVICE_NEEDS_RESET bit in
>> \field{device status} to 1 when it fails to resume.
>> +
>> +When the driver sets the SUSPEND bit to 1, the device SHOULD perform
>> +the following actions before presenting the SUSPEND bit as 1 and DRIVER_OK
>> bit as 0 in the \field{device status}:
>> +
>> +\begin{itemize}
>> +\item Stop consuming more buffers of any virtqueues.
>> +\item Wait until all buffers that are being processed have been used.
>> +\item Send used buffer notifications to the driver.
>> +\end{itemize}
>> +
>>   \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
>>
>>   Virtio can use various different buses, thus the standard is split @@ -872,6
>> +923,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>>   	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits}
>> for
>>   	handling features reserved for future use.
>>
>> +  \item[VIRTIO_F_SUSPEND(43)] This feature indicates that the driver can
>> +   suspend the device by set the SUSPEND bit to 1.
>> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
>> +
>>   \end{description}
>>
>>   \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
>> --
>> 2.49.0
>>
> Rest of the requirements and description looks good to me.
>
> Can you please fix these 2 small things in the general description and patch-2?

patch-2 can be fixed for sure

--------------RHDjBNu0S73FHP26jO9EIxSi
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><font face="monospace">On 6/26/2025 7:59 PM, Parav Pandit wrote:</font></p>
    <blockquote type="cite" cite="mid:CY8PR12MB71959BD1BFE6319F6E05A7FDDC7AA@CY8PR12MB7195.namprd12.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Zhu Lingshan <a class="moz-txt-link-rfc2396E" href="mailto:lingshan.zhu@amd.com">&lt;lingshan.zhu@amd.com&gt;</a>
Sent: 23 June 2025 02:07 PM

This commit allows the driver to suspend the device through a new device
status bit SUSPEND and resume the device running by re-setting DRIVER_OK
bit in device status.

Signed-off-by: Zhu Lingshan <a class="moz-txt-link-rfc2396E" href="mailto:lingshan.zhu@amd.com">&lt;lingshan.zhu@amd.com&gt;</a>
Signed-off-by: Jason Wang <a class="moz-txt-link-rfc2396E" href="mailto:jasowang@redhat.com">&lt;jasowang@redhat.com&gt;</a>
Fixes:
<a class="moz-txt-link-freetext" href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgith">https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgith</a>
ub.com%2Foasis-tcs%2Fvirtio-
spec%2Fissues%2F229&amp;data=05%7C02%7Cparav%40nvidia.com%7C3085ab
378f264b5c845808ddb2313478%7C43083d15727340c1b7db39efd9ccc17
a%7C0%7C0%7C638862646595099882%7CUnknown%7CTWFpbGZsb3d8e
yJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIj
oiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=Pf2ub%2FwVzdmf
A1JjScOJ7D%2B%2BNea9XgVFYdvvDQxym40%3D&amp;reserved=0
---
 content.tex | 59
+++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/content.tex b/content.tex
index 2e8da46..c987334c 100644
--- a/content.tex
+++ b/content.tex
@@ -42,6 +42,9 @@ \section{\field{Device Status} Field}\label{sec:Basic
Facilities of a Virtio Dev  \item[FEATURES_OK (8)] Indicates that the driver has
acknowledged all the
   features it understands, and feature negotiation is complete.

+\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that
+the
+  device has been suspended by the driver.
+
 \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
   an error from which it can't recover.

@@ -99,10 +102,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a
Virtio Device / Feature B  \begin{description}
 \item[0 to 23, and 50 to 127] Feature bits for the specific device type

-\item[24 to 42] Feature bits reserved for extensions to the queue and
+\item[24 to 43] Feature bits reserved for extensions to the queue and
   feature negotiation mechanisms, see \ref{sec:Reserved Feature Bits}

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Ignoring this delta as the fix of patch-2 will change this.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">-\item[43 to 49, and 128 and above] Feature bits reserved for future
extensions.
+\item[44 to 49, and 128 and above] Feature bits reserved for future
extensions.
 \end{description}

 \begin{note}
@@ -629,6 +632,54 @@ \section{Device Cleanup}\label{sec:General
Initialization And Device Operation /

 Thus a driver MUST ensure a virtqueue isn't live (by device reset) before
removing exposed buffers.

+\section{Device Suspend}\label{sec:General Initialization And Device
+Operation / Device Suspend}
+
+If VIRTIO_F_SUSPEND is negotiated, the driver is eligible to suspend the
device by setting the SUSPEND bit in \field{device status} to 1, and the device
SHOULD set the DRIVER_OK bit to 0 once it has been suspended.
+
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">You ignored the inputs.
I do not agree to add the &quot;SHOULD&quot; normative wording in the general description area.
The reasoning is explained already.
Please adapt to the existing style of this spec to keep the normative in requirements section.

If VIRTIO_F_SUSPEND is negotiated, the driver is eligible to suspend the
device by setting the SUSPEND bit in \field{device status} to 1, and the device
sets the DRIVER_OK bit to 0 once it has been suspended.

Is this really that hard to write above way?</pre>
    </blockquote>
    <pre>I believe you totally ignored my replies in the last thread. 
There are no rules forbid using &quot;SHOULD&quot; in any non-normative sections.
Now here I copy the reply here again:

In the spec section 1.3 Terminology, it says:

The key words “MUST”, “MUST NOT”, “REQUIRED”, “SHALL”, “SHALL NOT”, “SHOULD”, “SHOULD NOT”, “RECOMMENDED”, “NOT RECOMMENDED”, “MAY”, and “OPTIONAL” in this document are to be interpreted as described in [RFC2119] and [RFC8174] when, and only when, they appear in all capitals, as shown here. 

RFC 2119 says:

SHOULD This word, or the adjective &quot;RECOMMENDED&quot;, mean that there
   may exist valid reasons in particular circumstances to ignore a
   particular item, but the full implications must be understood and
   carefully weighed before choosing a different course.


Here this &quot;SHOULD&quot; exactly conforms to the definition.

&quot;SHOULD&quot; has already been used in non-normative sections, for example:
2.5.4 Legacy Interfaces: when using the legacy interface, drivers SHOULD read these fields multiple times until two reads generate a consistent result. 

The spec does not say: “SHOULD” can only be used in driver or device requirements section.

@MST, we need your input

</pre>
    <blockquote type="cite" cite="mid:CY8PR12MB71959BD1BFE6319F6E05A7FDDC7AA@CY8PR12MB7195.namprd12.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+If the device has been suspended, the driver can resume the device running
by setting the DRIVER_OK bit in \field{device status} to 1, and the device
should set the SUSPEND bit to 0 once it resumes running.
+
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Similarly,

If the device has been suspended, the driver can resume the device running
by setting the DRIVER_OK bit in \field{device status} to 1, and the device
sets the SUSPEND bit to 0 once it resumes running.</pre>
    </blockquote>
    <font face="monospace">same as above</font>
    <blockquote type="cite" cite="mid:CY8PR12MB71959BD1BFE6319F6E05A7FDDC7AA@CY8PR12MB7195.namprd12.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+\drivernormative{\subsection}{Device Suspend}{General Initialization
+And Device Operation / Device Suspend}
+
+The driver SHOULD NOT set SUSPEND bit if DRIVER_OK is not set or
VIRTIO_F_SUSPEND is not negotiated.
+
+Once the driver sets SUSPEND bit in \field{device status} to 1:
+\begin{itemize}
+\item The driver MUST verify whether the device has been suspended by re-
reading \field{device status}, examining whether the SUSPEND bit is set to 1
and the DRIVER_OK bit is set to 0.
+\item The driver MUST NOT make any more buffers available to the device.
+\item The driver MUST NOT send notifications for any virtqueues.
+\item The driver MUST NOT make any changes to Device Configuration Space
except for \field{device status} if it is part of the Configuration Space.
+\end{itemize}
+
+\devicenormative{\subsection}{Device Suspend}{General Initialization
+And Device Operation / Device Suspend}
+
+The device MUST ignore any operations on the SUSPEND bit from the
+driver if the device has not been completely initialized by the
+procedures in \ref{sec:General Initialization And Device Operation /
+Device Initialization}
+
+The device SHOULD ignore any write access to its Configuration Space
+while suspended, except for \field{device status} if it is part of the
Configuration Space.
+
+A device MUST NOT send any notifications for any virtqueues, access any
+virtqueues, or modify any fields in its Configuration Space while
+suspended.
+
+If changes occur in the Configuration Space during suspended period,
+the device MUST NOT send any configuration change notifications.
+Instead, the device MUST send the notification when it resumes running.
+
+If the driver sets the SUSPEND bit in \field{device status} to 1, the
+device MUST either suspend itself or set the DEVICE_NEEDS_RESET bit in
\field{device status} to 1 when it fails to suspend.
+
+If the device has been suspended and the driver resumes the device
+running by setting the DRIVER_OK bit in \field{device status} to 1, the device
MUST either resume normal operation or set the DEVICE_NEEDS_RESET bit in
\field{device status} to 1 when it fails to resume.
+
+When the driver sets the SUSPEND bit to 1, the device SHOULD perform
+the following actions before presenting the SUSPEND bit as 1 and DRIVER_OK
bit as 0 in the \field{device status}:
+
+\begin{itemize}
+\item Stop consuming more buffers of any virtqueues.
+\item Wait until all buffers that are being processed have been used.
+\item Send used buffer notifications to the driver.
+\end{itemize}
+
 \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}

 Virtio can use various different buses, thus the standard is split @@ -872,6
+923,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits}
for
 	handling features reserved for future use.

+  \item[VIRTIO_F_SUSPEND(43)] This feature indicates that the driver can
+   suspend the device by set the SUSPEND bit to 1.
+   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
+
 \end{description}

 \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
--
2.49.0

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Rest of the requirements and description looks good to me.

Can you please fix these 2 small things in the general description and patch-2?</pre>
    </blockquote>
    <pre>patch-2 can be fixed for sure</pre>
    <blockquote type="cite" cite="mid:CY8PR12MB71959BD1BFE6319F6E05A7FDDC7AA@CY8PR12MB7195.namprd12.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------RHDjBNu0S73FHP26jO9EIxSi--
