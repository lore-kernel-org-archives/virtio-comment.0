Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2066.outbound.protection.outlook.com [40.107.236.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B5D26868E
	for <virtio-comment@lists.linux.dev>; Fri,  6 Jun 2025 10:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749205856; cv=fail; b=hc9jqz4Uj75ZcLGdc+Jx2PFtkLnLkgyZ7NrHgFfdajHiJkCI3puyaslpeBc16JjVfDxk9R/y/9NeouQw/mpE87Ijdv7862K7bhtShz3f8uMnEZTLrQhnoRsMlWGXb35KitXZa0l2F4wMb7JfWBx7SyK+2uTVWN5ARcQXFsnV3SA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749205856; c=relaxed/simple;
	bh=ZxycklH/GJk+If7KoolJPpddmTN7GAMcbk1CS/1J8RQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fGkG69i9n1JwhBgExoRtN6JkXcIt6RKdXmxBax9x2KjMx3s4K8I0PmKcbRZWP0pKrcBw6PRUxmnWWshIxame/g3tS/HJXfhsGl9Lais1WUGbGXlX46sPOOHDMhjMrnkiD16sAHQCDAlCVBx+qq9ubABelz1mssKtyUBha3saFAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yc91g3tn; arc=fail smtp.client-ip=40.107.236.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yc91g3tn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Txe9Bv8uxBMhccCefOiLslFxzIIe7htUG/iePh5IGsWUu55SnqWwjAefvoegvVj9/C9zQV5M579zUQ5zctg7j6mGRshgEndXfqY7/peVbDFm4V0bXg6BHb7ehsTj50NBF/IITDqqVBp523kGLji1YkrWpo4CVg3Eh4ho3zSC3a+Ik1H+xxM74LQy/0sDxn4KqJyk/RpRJKOG3DW4BsD1Im8oQ6Q+/fjYezauoqzB4p8d/i8XdrGikClJ+HFwxlks54E5YRHKzSgocn8KIzxEGdkSpLaByD9PXy5ExTkEo5idlvr9qDyJGnZpbGVSfrtvcpZoM/ZPg87+ee/jZY8AjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bPog1+NSqdiGSdvjgNdgguXCov03qC00Jgq6pXBE8Vc=;
 b=Vv4A0UxAUbY33kw/ib5dmBWx3sJx2nGvSwMTRJf/fBKK78sz34OF4v+bJcHmkoLVb0T6Wd3dyMM5ifV9h2hc/QOP0bGxqcE16Yu/DQmy594J3eBEFK+YwtFQaCKqWJYwNcSM4a9qHNx7BYN2GMy9rOXhlNFcxGnVCIwat5KpzmzgNthFQ53iwc8Gb/qRT7VBF8bnY5edBEksxyTP5xDWQfY3C6tVQAxqDS3yTO4FypHnu1s1Ih5F2yGtBe3qAKZSpvajN8OSih4WKbm8kzLO1Y9rlKA7HXVbrJ9l/7ZnIU1FLBqB9oB3OpI5TFFIezf+zSQ4uVTH2Gws0199/casvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bPog1+NSqdiGSdvjgNdgguXCov03qC00Jgq6pXBE8Vc=;
 b=yc91g3tn66ZcgHXYDZWoR9W1l4A24dB/EBPD71iS0xJY9G1RciYJ9pYpKukGowWu/2iAcvIx6zt0ITWrWbgXdVrSwgQu/GhlLlLJVm6vABQqHRy2+IkuQc60Wke1wDbYazZ4mhvVyN/Oc+hahRe9OPGTcljrRNs1bzbj6xgxzPY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by IA1PR12MB8408.namprd12.prod.outlook.com (2603:10b6:208:3db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.37; Fri, 6 Jun
 2025 10:30:50 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%6]) with mapi id 15.20.8792.035; Fri, 6 Jun 2025
 10:30:49 +0000
Message-ID: <45bd7572-9672-49ad-b09e-f57ed6d5480b@amd.com>
Date: Fri, 6 Jun 2025 18:30:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] virtio: introduce SUSPEND and RESUME feature
To: Parav Pandit <parav@nvidia.com>, "mst@redhat.com" <mst@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "Ray.Huang@amd.com" <Ray.Huang@amd.com>
References: <20250529082355.86884-1-lingshan.zhu@amd.com>
 <CY8PR12MB7195A87D14C87D52B8A03C79DC6EA@CY8PR12MB7195.namprd12.prod.outlook.com>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <CY8PR12MB7195A87D14C87D52B8A03C79DC6EA@CY8PR12MB7195.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY2PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:404:56::32) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|IA1PR12MB8408:EE_
X-MS-Office365-Filtering-Correlation-Id: b08c72f9-84c1-40a1-65ad-08dda4e53433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Yk15V3RoUWlMSW43TkNUUCtKVSs0TFRoa3o2Sncxdkgra3J1cUpBRS8xWVJH?=
 =?utf-8?B?bHFodk9CUWNWeXBuemZSOEpJYWRNYWYvWEpIc1VmRG9tRVBuSG1ZK3h1SnZx?=
 =?utf-8?B?eWlzUm5taHN4RFhSQlpXeTd3TDJHeWdNd1UwTXZrczZIelNORWc1Z1JxYXhP?=
 =?utf-8?B?b0w1cWdGSmtuVGFYRFJTZkNNZ2NmUUZCeHo0dHpjQUlXVWhZcEkyRytPMFgw?=
 =?utf-8?B?eWNSY1NyMmZaN1hWZHVyODBYaGJJWEhvQlVmdU1xMFdVV3N4OHhoTFBKZEZ1?=
 =?utf-8?B?TlBNTzg4MmVOZnpMZW9mT04yakprWjVCK1hCaitkMTBkdWUxR21hWHJWR2V3?=
 =?utf-8?B?Z2IxR2haS3kvQWRFRXBKMjdreVdCS3dQV2Fwc0VGWHI0R0xXVXBTcUlmV2Rs?=
 =?utf-8?B?eUsyWHQ3VzBCRFVJN282S2ZFTTZRK2dEaXl6R2dYVmgrNlZLRVQyS3ErSEl2?=
 =?utf-8?B?L05EcUx2azByWFk4ZVhaSjJmNDRCWlhSVWxEK0Q5S3RNV3I0RnA1cTQ4NGRu?=
 =?utf-8?B?bk43Y1pGcWJPMlpoc2FIdjFvZVhLYzJzcVdEM2lHUlFtM3FWUGlDVkREcTN2?=
 =?utf-8?B?K1J0NlpRWDl6Wm4zQlpCM0JBRjBFS2E5d1dUOTJYZitDcnViZGR6eko3Qklv?=
 =?utf-8?B?ZXExdDdsWnpXMzRrczF6MGNXcEdrckhnMThHRnNObUdxV3VwNjh1Vy96blUx?=
 =?utf-8?B?NURUa2dleUNoR2N5aStvMTVLb1dPMWg3ZVlhdURkWVQyUitIQ09oNWNLeE9N?=
 =?utf-8?B?QmwvNjNuZmNDaDFMcDBSa1lBc25NTnBRUjJFc0pld3dUSkp2ZFBvaVh6UWdZ?=
 =?utf-8?B?VVlwQ2dxZmZ0V3hhN2RVVVVHVWJ6Q3lIRGN3bkE0akxIQmE0TncyY1ZJV0wz?=
 =?utf-8?B?Z0xWOCtETXlVTGVQa3UzUzJmb3FqRmNoanBIZXdzbFk0QzIrRzJHL2ZFYWFM?=
 =?utf-8?B?OUFmcDRINzN0NUVLZUdSd3V5LzlaMTJ1V0JrNkVWdVQzUE1kU29pNzFnY3FO?=
 =?utf-8?B?eWt3b1BTaktzLy9RUmkzSEdDNzhFRjBxTmZ6cytLK2hJaUpydXQzeVVzTm9x?=
 =?utf-8?B?VXdGQXYxbVZuazY2VWdLclgwNUplcWFRb05KYVJZNDNrKzJacEpMU2hVR2pQ?=
 =?utf-8?B?MnNJdStUTTFRdXIrODhJMWJYUUwzZnN5ak9GdUh1cUsxZ0UzNW8xaGtZTTcw?=
 =?utf-8?B?Z2NtOGUwR3JZck5GeFphUnVxN0trUTBuamdGWHNMZGhLbDMwM3U3d1QrQ2Jv?=
 =?utf-8?B?bFdScGRKNUIyS1BiZFlraVhCL0l2WC9PWGk2VDF1V3lRRUZManpxamowbmVV?=
 =?utf-8?B?d2ZaL2xSenlDMlpvcnZ2c1phclVES2VSQXhIc3M0U2dvclJya05qQkpVQUNS?=
 =?utf-8?B?SXk5L1ZLSjNiZFJqTzhTQTVxY2JNcFFBR3dVTnlVbjFTZmFsZzQwQlBSRUxO?=
 =?utf-8?B?UWlPUkdDYUlMRWNpK1RGU1kxVnZlMUljWmFFSCtLU0luVk93TWgwYi9UbTRZ?=
 =?utf-8?B?WCt4b05VSHdHcDR5TXZFVVFQSllvU3RNdXAyVXFya24xZ2dLcDBzQytxYlpF?=
 =?utf-8?B?K29DR2lGM3p2eGxNSFZINktrcXdBamJmQ0NyenVRdlJzcEtxdGV3WmJkUFNI?=
 =?utf-8?B?ZTVXdGhkVlZzS0hjY0IveGJORjlrVGZENWpIRVQzb2xWM2RrUjh4TnlaK204?=
 =?utf-8?B?am1kNjViS2g1NS8wMGs3UkQwRVZPTW9qWU54c29BS3pWOGNNRVRiSWpWUC9j?=
 =?utf-8?B?b1VYQmhtYmJKT3pYQUpIQ29XVXVEa1JJazAzck5yb2xVUldNcE9BRVNxbFEx?=
 =?utf-8?B?S3hOb0RZU1h4QnExTHp4S2F6WFlKZ0JsL1pWZmpyOFAvRE5vWVQzV3ZXNWdE?=
 =?utf-8?B?WWY5YUhxRDZjQVFPckFuMEtOdFZHNFJjUm9saFV4Rk1BSXg0MTR0eTFkT3hQ?=
 =?utf-8?Q?hhpjULXVsmQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHB6T2pSZmo5YnZEZ3BlZGY4QXJPTlVnWEt4UjVlKzlpYWZnT2FXWkpaYVgr?=
 =?utf-8?B?T0VTZmFVUkpEVHNCV04xZTR0Q1FSNDNXWUNiZ0tsMURJM2RYb2JGbFBZRnZx?=
 =?utf-8?B?N2Y1MmVYSWVtRjQyR1BpeCtyMUNWbW1Wd2RYVVU0ckVIN1JWUjh3UkNVVzdn?=
 =?utf-8?B?cjluSGFnOGVuY3dueHJCQ05EaFZ5aUhZUkFUTUsyVVNLY3c4MGVnNlM5SDRs?=
 =?utf-8?B?WlA2bVNlTWNCL0RRQXpmbURaZHMxTHhnUm80MDJ2SzdPc2MvK3ErTjVJc2ox?=
 =?utf-8?B?cm1EQmNRODg1K1ZOdktUQmt4d2pmRjlVS1RFdlAyb1lCYVZWd1ZTMmw0bUhH?=
 =?utf-8?B?bmhTc2FHZkJmd0hoRll2VnEzU1N4YXk2MXAvb2ZOMHppMmRMTXN3aFFaUWlx?=
 =?utf-8?B?cmZSOE1oaHdkZ3pTZEFFVjJkMEVwenpLcHhPWDRidnZoSWkwWENlTU9Jd0JR?=
 =?utf-8?B?L1BlaURRRGRDNkx1SFAvUlM2REIwKy9pejAxeTIxU1M5U2U1Nkxqb0s1Z29H?=
 =?utf-8?B?RmVENXhoYVhWUDNXMUF4MDVSWmZjb1dLRG4vQzk2Y2hwRzAvZitHdEJhdFlW?=
 =?utf-8?B?VnRTUkRGSEh3WGNwdTRxMFdOeEtlWjlRZ09tVDNmbHhteVVGZ1g1S0VibUR5?=
 =?utf-8?B?RkNNaWdxdDV4QzJUYkx3ajJJS3g4THUwNjNzWmZqZzlaVmNCTjhhMjBjZU9i?=
 =?utf-8?B?U2pPVTZXNFFSKzFiR1BuUFNOZTRlTUxhYnVPLy80U3FYK0VMeXlpelJqampD?=
 =?utf-8?B?Q0o1SnJVUUl6VDBUeGJCaGp5TkFVdk1YZGRodkVORWo1b0w0bE91MGR3U2p3?=
 =?utf-8?B?K0lLemFQeXBqK3NRTDBHc1VGWjIvWXd2ajJ5NlNTU1NoTGw2dlFjTlBPWmw5?=
 =?utf-8?B?Vm95dTBZZDhlZ1c0K0lTa2RLMHBJY3hXNUczUmFEQm9mbmJCSFF4RDdHZEtF?=
 =?utf-8?B?dmZ1NDZaVXFwZVlVd2xQWUI1RVprcXlvUE9id3ErNm1NTlVvQjcrT1hvUUZT?=
 =?utf-8?B?RTBFcDE4MlAvaUVNNWY2ZUU4dVovUTU3MWtqY2VVTFptUmg1T3JiaDZCOWR4?=
 =?utf-8?B?MUFtUzg5SHpCaG5Qbk1UZlozbWhlV0dBTXhGcVBCRkZEcFZFSmJJZmxZR1dY?=
 =?utf-8?B?aWxjR0l3aVp0Z0dBT1lwMFVoeWtITjl3N1pUWWJzdGw3dDg5S24wWkVCb2M4?=
 =?utf-8?B?MzdHWVY0dkxtWTh2MSs5c0JUb0c5ZmJtZzRLUTNmb3lLUGQvWmk2ajBUVFZU?=
 =?utf-8?B?N3VUbE1lWHVxd3c3UUxSbmZkVFdkaWZDYnMzQU52K1UzTU5UcWt0VGcxYTd6?=
 =?utf-8?B?MWthU0UvTkNuVnRJRkU5MW80dFBXVXZWVTVuVWF6NE1ialA4VXc5eVVxT0tz?=
 =?utf-8?B?UWtTTkU3bytGQ1NvbmVWVG9pVWY0dDVabi9QaTJiTXJBV0dUNWtnQkF4QTBG?=
 =?utf-8?B?TG50WnNBWHNzamVtcjlCc3EwcVo2RG43Y2pUbjN4ekhWclRxcXBsVGY3eGZo?=
 =?utf-8?B?aHdQdmRIMDZvWmM5cTcvQjcxUy9Vbnc5V21GOWhvelhoNFhaME9RbEJUZVJT?=
 =?utf-8?B?RG41YkZVQVErNkdzc0FWcFBwQUMrTVpIN2RFOGZxNE1ZZlU4TzUzTk5qbFlO?=
 =?utf-8?B?c0J5NXU2Y1lwZ2w0cGJKanNTQjJxYmttdk1aWTZVRGY3M3ovMUhHbmw3QUxm?=
 =?utf-8?B?YWdVWStCYnpmYVJ1YlhJZnVkYW5rV2VlY2tiNnJoV2VSNDJjZWlncWFRakpT?=
 =?utf-8?B?TVFZT2dkam40NkJrdllpUXZUaEhoejAzUXlPcVRJenZtVFFzcUtraDBTYWFH?=
 =?utf-8?B?QUtaSkh6ZGpxdUJXbzVnWGY1dnRNSW1WU240bzkwUW13dXZ5emJGZitWSkNF?=
 =?utf-8?B?V1NVZXBYRUZJNzExQk5KWCtGWkQweTBxVTU4d3RaOUNVdjExYmFZY29HZWlS?=
 =?utf-8?B?OEY2aW1IUGR6amV0YWZCM2ZQTWdubkR0aWdzRENwbk42MERhYnJVRXdQY1N6?=
 =?utf-8?B?NUFYemhYQWJuWGpxMzhoZDI2Nnk1WU53d1JkLzYwVWlxQ1ovSERQKzZ5cVV0?=
 =?utf-8?B?aHJnakcrZWFIaTlKQXZJY2p2OEZHUkFGd1dGN1lUb3NweS9jbXhpWmVLeEtk?=
 =?utf-8?Q?E8mkoJh6fRdc0nHq+4kuw34VD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b08c72f9-84c1-40a1-65ad-08dda4e53433
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 10:30:48.9642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5mK7os2GzIHnvrb1KnjvO/HFkEXCJy05VZWrk203H2yhkY73HApwZkdeKcT5yOcS6r+6QFj89/H3095XLDtZKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8408

On 6/6/2025 1:52 PM, Parav Pandit wrote:
> Hi,
>
>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>> Sent: Thursday, May 29, 2025 1:54 PM
>>
>> This commit allows the driver to suspend the device through a new device
>> status bit SUSPEND and resume the device running by re-setting DRIVER_OK
>> bit in device status.
>>
>> This commit re-orders the device status bits.
>>
> I overall like this proposal. Few small comments to fix more below.
> It is lot cleaner as it eliminates the previous bit flipping complexities.
>
> Can you please add one or two line on a use case/motivation,
>
> For example, 
>
> Presently when an OS is suspended, the driver must fully stop and reset the device, and on resume the driver must re-initialize the device.
> This can be time consuming task to recreate large number of VQs.
>
> Instead, extend the specification to allow drivers to suspend and resume the device, without recreating all the resources.
> ...

Hello Parav

Here I think the spec provides mechanisms, not a policy. The user may employ this feature for other tasks
other than live migration which requires OS suspending. 

>
>  
>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>> ---
>>  content.tex | 74 ++++++++++++++++++++++++++++++++++++++++++++++-----
>> --
>>  1 file changed, 65 insertions(+), 9 deletions(-)
>>
>> diff --git a/content.tex b/content.tex
>> index d3fc6a4..caef5d0 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -36,19 +36,22 @@ \section{\field{Device Status} Field}\label{sec:Basic
>> Facilities of a Virtio Dev
>>      this bit.  For example, under Linux, drivers can be loadable modules.
>>    \end{note}
>>
>> -\item[FAILED (128)] Indicates that something went wrong in the guest,
>> -  and it has given up on the device. This could be an internal
>> -  error, or the driver didn't like the device for some reason, or
>> -  even a fatal error during device operation.
>> +\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
>> +  drive the device.
>> +
>> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that
>> +the
>> +  device has been suspended by the driver.
>>
>>  \item[FEATURES_OK (8)] Indicates that the driver has acknowledged all the
>>    features it understands, and feature negotiation is complete.
>>
>> -\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
>> -  drive the device.
>> -
>>  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
>>    an error from which it can't recover.
>> +
>> +\item[FAILED (128)] Indicates that something went wrong in the guest,
>> +  and it has given up on the device. This could be an internal
>> +  error, or the driver didn't like the device for some reason, or
>> +  even a fatal error during device operation.
>>  \end{description}
>>
> A new bit SUSPEND introduction should be done at the end without re-organizing rest of the bits.
> Please add at the end.
>
> Is the intention to rearrange the fields in ascending order of the bit number?
> If yes, its good change too but than it missed re-arranging FEATURE_OK.

oh yes, good catch, will fix

>
> If you want to re-arrange, please have the pre-patch in this series.
>
> Either way is ok to me,
> 1. Either as pre-patch for re-arrangement + addition of SUSPEND in middle.
> Or
> 2. adding SUSPEND bit definition at the end 
>
> #1 is better to see in ascending order.
I was required to re-arrange these status bits, but this is a trivial change,
so lets keep them in a single patch for easier review
>
>>  The \field{device status} field starts out as 0, and is reinitialized to 0 by @@ -
>> 99,10 +102,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio
>> Device / Feature B  \begin{description}
>>  \item[0 to 23, and 50 to 127] Feature bits for the specific device type
>>
>> -\item[24 to 41] Feature bits reserved for extensions to the queue and
>> +\item[24 to 43] Feature bits reserved for extensions to the queue and
>>    feature negotiation mechanisms, see \ref{sec:Reserved Feature Bits}
>>
> Only one feature bit is used by this proposal.
> So it should be 24 to 42 and use bit 42.
>
> Did you use bit 43 due to existence of VIRTIO_NET_F_GUEST_RSC6?

Yes, bit 42 is taken for VIRTIO_NET_F_GUEST_RSC6.

>
>> -\item[42 to 49, and 128 and above] Feature bits reserved for future
>> extensions.
>> +\item[44 to 49, and 128 and above] Feature bits reserved for future
>> extensions.
>>  \end{description}
>>
>>  \begin{note}
>> @@ -629,6 +632,54 @@ \section{Device Cleanup}\label{sec:General
>> Initialization And Device Operation /
>>
>>  Thus a driver MUST ensure a virtqueue isn't live (by device reset) before
>> removing exposed buffers.
>>
>> +\section{Device Suspend}\label{sec:General Initialization And Device
>> +Operation / Device Suspend}
>> +
>> +If VIRTIO_F_SUSPEND is negotiated, the driver is eligible to suspend the
>> device by setting the SUSPEND bit in \field{device status} to 1, and the device
>> SHOULD set the DRIVER_OK bit to 0 once it has been suspended.
>> +
> This is not a normative section so please avoid using SHOULD.
> Better to word it as informative theory of operation text.
> Such as,

why "SHOULD" can only be used in normative sections?

>
> If X is not negotiated, the....
> And the device sets the DRIVER_OK bit to 0 once it has been suspend.
>
>> +If the device has been suspended, the driver can resume the device running
>> by setting the DRIVER_OK bit in \field{device status} to 1, and the device
>> should set the SUSPEND bit to 0 once it resumes running.
>> +
> The device sets the SUSPEND bit to 0 once the device is running.

What is the difference in semantic?

>> +\drivernormative{\subsection}{Device Suspend}{General Initialization
>> +And Device Operation / Device Suspend}
>> +
>> +The driver SHOULD NOT set SUSPEND bit if DRIVER_OK is not set or
>> VIRTIO_F_SUSPEND is not negotiated.
>> +
>> +Once the driver sets SUSPEND bit in \field{device status} to 1:
>> +\begin{itemize}
>> +\item The driver MUST verify whether the device has been suspended by
>> re-reading \field{device status}, examining whether the SUSPEND bit is set to
>> 1 and the DRIVER_OK bit is set to 0.
>> +\item The driver MUST NOT make any more buffers available to the device.
>> +\item The driver MUST NOT send notifications for any virtqueues.
>> +\item The driver MUST NOT make any changes to Device Configuration
>> Space except for \field{device status} if it is part of the Configuration Space.
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
> Even though you have the driver normative, it is good to have device normative for suspend and resume operation:
>
> Something like,
>
> When the suspend operation completes in the device, the device MUST set
> SUSPEND bit to 1 and DRIVERK_OK to 0.
>
> When the suspended device is resumed, the device MUST set SUSPEND bit to 0 and DRIVER_OK to 1.

I think we already have similar descriptions in the beginning of this section

>
>
>> +If the device has been suspended and the driver resumes the device
>> +running by setting the DRIVER_OK bit in \field{device status} to 1, the
>> device MUST either resume normal operation or set the
>> DEVICE_NEEDS_RESET bit in \field{device status} to 1 when it fails to resume.
>> +
>> +When the driver sets the SUSPEND bit to 1, the device SHOULD perform
> It should be MUST.
> Otherwise it can crash the system accessing memory that may not be any more accessible.

Not sure how this can crash system memory, but "MUST" is OK

>
>> +the following actions before presenting the SUSPEND bit as 1 and
>> DRIVER_OK bit as 0 in the \field{device status}:
>> +
>> +\begin{itemize}
>> +\item Stop consuming more buffers of any virtqueues.
>> +\item Wait until all buffers that are being processed have been used.
>> +\item Send used buffer notifications to the driver.
>> +\end{itemize}
>
>> +
>>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
>>
>>  Virtio can use various different buses, thus the standard is split @@ -872,6
>> +923,11 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature
>> Bits}
>>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits}
>> for
>>  	handling features reserved for future use.
>>
>> +  \item[VIRTIO_F_SUSPEND(43)] This feature indicates that the driver can
>> +   suspend the device by set the SUSPEND bit to 1.
>> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
>> +
>> +
>>  \end{description}
>>
>>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
>> --
>> 2.49.0
>>
> Apart from these small comments, please add the line in v3 commit log:
>
> https://github.com/oasis-tcs/virtio-spec/issues/<issue_number>
>
> This will help to link the two sides.

sure


