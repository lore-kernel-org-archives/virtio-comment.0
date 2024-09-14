Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9491758E
	for <virtio-comment@lists.linux.dev>; Sat, 14 Sep 2024 05:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726292288; cv=fail; b=Rjmmy+5cZisUzyF9vCZ1kI3YnnxwY9M/MnI3fNL5Uf4upJEg22kJiR6RrnUwzX+4C54gsNv85afN938mkeFcl8TT8uPETcK0IXnfdpYrZqvS/zMV5TyI/lm3P5eSpOa7QWOqYGdzywLb/hWZerWFu2e8w6xlrH3wOtuMvuZ59o4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726292288; c=relaxed/simple;
	bh=smrrN88HtJBDHBHYusMGj0MjXpmlVL2yY1HYRwU9l44=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tLVSWdN2G0ryS2ApG8bcoZV+g8SlUdv1Y7mMGphNtuRisnLxMhht2b/vd2IpssV2VUK/lWzccXl0COLx1XzJXKu7YPwBPtFJ8akfaHJ6FbVENhqJ1UBwOPWIdO5DvFFlUtWFdsEylY9FedCtNGLCx/M/pTJ6ECj00e8FmOEskYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zNcc+uRI; arc=fail smtp.client-ip=40.107.94.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zNcc+uRI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vUOEBja2ffDeKCJspWCPxMceJexztJS2LhiCU8JQwOuVOgCDx+S7P3e8VIsYE24Iy57HJl5Zb0l6Je0+ShHdx1r+4qNNU61j9qeMJ7VmiXRbr8uTKivFzW55xFxsaQFrgomZfGiOH40J0qAjMizyGgwB2aYoj3yDgMSKm55jbd1hUxwAmsRyD+gmZ35w7Yz7Yb4OvWyXVf6vXwPc99ZFV+eYrvav5IpR4MkIkLzi2/0JZQCmjxVGfx5mBJRxPqG2A6bOI6sEo/nT7A/tExdyvNqqlFfIXorQF6nZq4mOTlIZIBJuuuX7A2qET5nb61ZFNirq97pHqqvdzEEgsHFmWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smrrN88HtJBDHBHYusMGj0MjXpmlVL2yY1HYRwU9l44=;
 b=pPoWQWAPDODK1qontXyeBGDoRgxkdPdbgJ1i7EseSxrTvmKVvgSrVbtwEfEhUVp3sdZcOBH1avk8IDOGRxGQt84g+ReleRWnC/hKPqKqEWVRSrhkIx9mbqCq/vYYJ69QqFpXNasFY+jxKRqJitjlO8y2jHRwdm5rspUCAnVEFrtM99kVywFThhDt94TQGQ5uCH15a3kSjXaNhjdvydlOfqYGm9p4b8DRhlnSoddXzVTUT8tDO6Avm7JdUTDlW4SGPJdssIb+C/ZePqZZosqJaBzqLrbWH1Cqf8yH36JnvGrBcirCtkfYpQftzmAqvJaSgkRN59mu766nyiCVEnFlfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smrrN88HtJBDHBHYusMGj0MjXpmlVL2yY1HYRwU9l44=;
 b=zNcc+uRIiQdyUorsxEOyXxAmJranYBbnPBPJb5xIQ8dxj/1m2xskfB4eTyFCIjfyFPMHikNV+MLYXAUSuRjpw1NjcEuqG09BSPVlqUWqq6bpWKIGcXfoKRT4VlcgFdGs/siOO/sMaIxbltrMI5LozqTZ2YbRJduWxaZvVZauYCg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by SN7PR12MB7836.namprd12.prod.outlook.com (2603:10b6:806:34e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Sat, 14 Sep
 2024 05:38:04 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%4]) with mapi id 15.20.7918.024; Sat, 14 Sep 2024
 05:38:03 +0000
Message-ID: <1a7606c6-c801-46b7-8ca0-ab66e14ec0fe@amd.com>
Date: Sat, 14 Sep 2024 13:37:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] admin: Enable driver to send admin commands before
 DRIVER_OK
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, Parav Pandit <parav@nvidia.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "cohuck@redhat.com" <cohuck@redhat.com>, Shahaf Shuler <shahafs@nvidia.com>
References: <20240910170723.44537-1-parav@nvidia.com>
 <20240910142850-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87136FC9671ABFF7123A82CADC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240910162247-mutt-send-email-mst@kernel.org>
 <IA0PR12MB8713AC1D273671DF459FA254DC9B2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <8a42e214-59b1-4085-aec0-0f31be885525@amd.com>
 <IA0PR12MB871350EE73BFB2B8B60B7E97DC9B2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <CACGkMEtUvJhAq9Y-hZ8NroupJgarYhB8qz-cLXNQYrvnoGKgbQ@mail.gmail.com>
 <5d0cf855-ead0-46a4-8221-d41c0a3be15f@amd.com>
 <20240913150033-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <20240913150033-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP301CA0064.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::16) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|SN7PR12MB7836:EE_
X-MS-Office365-Filtering-Correlation-Id: 930ef572-8684-4ce9-6605-08dcd47f6702
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?eUJnajRhQ1hBMmk2Sll3WWlpRmNBbHdKTFBGaDR6Mm40VlZEUWZjQWJJaC9B?=
 =?utf-8?B?ZUU0NVhoV2tndGtuV08zTFE2dHZnTTg4eGdCdzZDOEN5OXVmTFRYV2hYdGlt?=
 =?utf-8?B?ZmxmR3pmMVYxSjdyZlZtaGNqOGMwQTlmeVBCTVBTb2xESU92N2F5dmpCd2p3?=
 =?utf-8?B?OWFidEtTZVJpRTdzcGVLM1JDNDBjMkJTd1RxQ3BnbHYwcW5YYTlNaFp3TVhM?=
 =?utf-8?B?dG1tWm1BdWFUaHdDVlRiMFRFOURpYWxwREthazVxZDI2YzRIR0M5aHpBQ0tQ?=
 =?utf-8?B?YjFySFZSR1FXZjFwTnRyWVordFBPYi9CR3ZHRE95R3pwUytMTzYrR2Fnazhp?=
 =?utf-8?B?dktxeFRKWjU4Ni96QktSdjFnV2VkaHZzaTVZTy9LVVpHS2pSelpPVUl0T3BK?=
 =?utf-8?B?K2NVemNwdDlsN0QyQWhtT3BPR2I0dmdnWFBGUjQzRTJtUCt2dHpma2JvTEJI?=
 =?utf-8?B?Zk1UdTZGa3p3S3h1VTI0am1QRFZrODNFTkY5dHFhMVdYa29wY0lRaDFRUlNs?=
 =?utf-8?B?L1Jna0VrazdVaTNxN3RmMk9RT3BiSzNlM0pMbHVyYUp1bGlhd1RMZG1VWmFx?=
 =?utf-8?B?WEp6WGVJVWw0YjVUcnVMdlhDeS9CNGZHR3Zub2FUNTRWa2FnMHgxOG1DQyt0?=
 =?utf-8?B?WlJzanJ1VGdSZ28vYWhLN25Cb1Q1d1lyd3RtYThMTFZUbERFVmlkdXUxZWEw?=
 =?utf-8?B?dFlwdXErRjYrM0U0NHhTOGVhQmVXSDB3a282blVsbFBud2F3T2lTbFQ1QlJp?=
 =?utf-8?B?SmpYS3V6ZmRmNzBsTHNaVWVTbmt1UFpxaEVWQmZxeThML2kvRCtvYkE4cGpt?=
 =?utf-8?B?RFBBOHVyRlpBSkZQR0xqSDhNVmxEc3p4eGJwdllUNWFzbVlURkhOS2JHSGNT?=
 =?utf-8?B?Q0V0N3BRVUs4S1Ewd1pId0xDOUhEMC9adXJmeSs4ZjFVZWsvNXZSVXFUbG5m?=
 =?utf-8?B?MzcyMGtUamFWZExuZ3gyRXBzS3JpbzRWTEJGeTVhMGFFYUs0bzFJa1AxVnRW?=
 =?utf-8?B?TStIQVBDVFF4a2p1WnBhUkdZamZGcEtKdlh2cHNTaEZmTHdCVGpHdGhxVldV?=
 =?utf-8?B?OGVGRXBqT0NTYmhNZG9ZSzRWMXZiUTVFWUJzSEE2eWNCRWphb3RUSWV5QjVS?=
 =?utf-8?B?YU9YWHNZcVhvUTlhV0cwaGdzbmdWZXBySm9UQ0cyRk5seWRKUzVEU1pUMmFL?=
 =?utf-8?B?c0dRNmhOcEdsSkRncDI4c1ZvcVVIZlI1bFVDcVZuNGlIU2piSkk4eFM2eWtt?=
 =?utf-8?B?dHUvUkhtVTRadUJlVTVnSDhFRGR1TDVuOUZMWWZjRFFjK3Nia0JCSXNVOUVY?=
 =?utf-8?B?NzVCVlMvekREdzZiVSs2VnZ3SXA2UUhnRGpZeWNKNXFvNVlTNDd2QnR4ZE1a?=
 =?utf-8?B?Y2VIc3NiUDlwQUlnMFFFOUxNUUJGR1dzU21Jc2hKOThRQ1VwKzh3elB3YTlE?=
 =?utf-8?B?bi9Eb28zRE1oNjFEUWRJMGlLcGI1alluS2pCaEVFem9CSU9Ub3RyTjB5NlJt?=
 =?utf-8?B?d1d1OVR0V21mNWkvREJ3UWtwQ3czcVFUNHRock1hcGUvZUczamI5aS9JV3RT?=
 =?utf-8?B?S1RMaHNTam5yWUFVWVYxdHU2WXgvU3AxdEFpSm9ZT0EzUkdwQTdQVW1SNjNj?=
 =?utf-8?B?ZTgySXgzQTNoT2xLdXNZNHlqQUdraCtNMGMwMG1sa1lqS2NWSWt5N0JBd3Vt?=
 =?utf-8?B?KzVSNUNlQTlnRTdLMWpmVThlZ3cyeC9RUWJ2N0ZIU25MUE56eWZIaFh3djhW?=
 =?utf-8?B?TVNvU3FhbjM1TGtuUFpUc2tuZ0Qwd3MrVHVoOG9HNVAzL2hWbU9XajRac1cv?=
 =?utf-8?B?VGV2eHY5WGtPMmd4SzFDUT09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NnVidXB5aWUvNjRVcVNPK2RDd3lScnI1clQybGpsaUNjSUVXd1JjSTc0Ujhn?=
 =?utf-8?B?Sm9zOFZBZGVHa0xoSEVHNWMyaHNreGxtK1Y4dVMzbERUdS9RTG56a3JmMXZ5?=
 =?utf-8?B?RG5Pczk3eVN0ZVJmQlFmeTNxbXVMQjdHN3YxeUFNdUlXbDVaemloaVpRbXRW?=
 =?utf-8?B?TVduQ090bDcrbDZxblJNUzlEQyticDVsbUVRRXRSaTJ5THRmYkx1Nnl3K2V6?=
 =?utf-8?B?T2VZWi9yRUYyWUZheFJNRjRZRFdySEhud1gyZWx0U0tmeEFJUmRrekp0eWZs?=
 =?utf-8?B?N21pc1ZqTXo5ZlhMZTBMdU9BNjMrcE5scVRZSlpiZkJlYzNJSUFBbWFSb252?=
 =?utf-8?B?RkUvZGVXV2Z1Q1VFUDVlS3Vyc0ZLbHh5MW5TTllQN3QwemlzeitEM0J0UHhO?=
 =?utf-8?B?N01zWEFqcW5qZFlocHVvUmNyWWprbWlUVjhGams4UHlzUWg4RDdITHJrUktp?=
 =?utf-8?B?bWFMdXRRMlJXbytVOVVHQ2FWMHNMZzJXL3F3dzlIcjZaVUNhbGhsWkE1V29S?=
 =?utf-8?B?eENMa25UQTBsb0lDV2piMUFJU1ZRczNGdnNlWnArdTNrK0xYSWxHL3ZvT2Zz?=
 =?utf-8?B?aGt0RFBUVkdZeGVPazNjV3VrSWhqNlU5MUtxWHFqWk9oL1ozdWY4bWRLZ2NZ?=
 =?utf-8?B?WTYvTFpEOFhnUnkydHptSEJDWjZZUjdpUytVYXJpVjZUUm9jN3MwMHowVXE1?=
 =?utf-8?B?MGg4RXllQ2pvOXNUNjZsa0M3a05ZeWNuZ2w2WjQvdDRLR3ZCUlJrWHk4VFJn?=
 =?utf-8?B?dDN6L3hJU2wxVGx4dkhkaDU1ZWlhUSt1Ym5YckNscFVQK0o4ekNPRUlmSjhu?=
 =?utf-8?B?ZmtZMmJ4emFESlFQU3R6czg2VlkvTnZmZzc0ZzcvTGRUZjVCNTFmNVhNSkRs?=
 =?utf-8?B?Y05LRmFTdno3U2QyRmJxTDBnaHduVFVrMlFrT01DU0QxT0llWHZXSzl1MXFp?=
 =?utf-8?B?bWlQTFhoMzhqVFVvTUdVVnR6QU1Nc1hvWG94eGx6MFV6MThIdHNUa1BJREtt?=
 =?utf-8?B?RWJiQmNKUFVHSE1NaTZKNzFOdWt3eXVOdDM0MkQ0VmlhZkIyZkNJOUVMMVU2?=
 =?utf-8?B?V0RmTWZoNE8yd3R1N2ZDcUVjVldIRXE3QURpT2diQ1FjbVhXSlZDVTVHTDB2?=
 =?utf-8?B?N2JYSWo0V0VZa1U0RnVmSTluV0F2S1FpL3FNR1NLQ3BuQTR0aTMrTjRFbVdu?=
 =?utf-8?B?ZFNTRGpQVkovOUNzLzl3SlMvbXE0djZwdnZQVTlIdXQxZHJkODlBTXAyZjRH?=
 =?utf-8?B?cDM1R24xL0NHdldEZTQwZ0o0SThFTkNTYlkrbnRhT2lFUTBGaTQySWFjTlRN?=
 =?utf-8?B?V0tTdFZtNmxTQnQ2RzJYWERHdWhqbHU3ZjJJWUZIWVlLVys5dkxuYWFTMVVz?=
 =?utf-8?B?Ri9SLzJwVTVWb01UN3p1MTViaEtORlE0amZFN3JqanYvNjE4b3g1SlBwaDQr?=
 =?utf-8?B?RlVTVG0vaG5ENXZBdnlsbmMvM0cwbHMwWURLLzN0K2ZIdWlxTVZlMUY3cE1o?=
 =?utf-8?B?NTdwZlZWU2kyeFdRaUpHcFFxYUVSbWF1MTducFlnamJrS3ZqR21jbGlqZXlE?=
 =?utf-8?B?ODRmNmdNTXZoTmp1Zm01SVJRRm53ekJ5S1lIVmx4d3NlSkd1ODgzeXpXM1RH?=
 =?utf-8?B?bzZjdys1ZmtDbWxTcmRqV285bW1TOFllNjlmNE94NnR4MmQvb21xRENhL1hI?=
 =?utf-8?B?UFErWUJSWTdGWXFCMGxEaURPYmhXMHZkNCsrWS9xRTVuaXUyY1oxZ1F3QTky?=
 =?utf-8?B?R2lsRVRqMVhxSVNyRm05aVJ1Ly91NUlyd0VLRzNWY2Jpem0rNGZrUkNvMnFU?=
 =?utf-8?B?T0NGTGxTWTRFU1UwK2xoUlhiNW5HemtyQU5WT0xyNy9NUW5XNDZlS09wb0Yr?=
 =?utf-8?B?SklaaWJkZHVKWStybThCWjlubmhES0o4cW1HQ0hKdHB2RE9zM3BxdWFCdk9w?=
 =?utf-8?B?TzN3ckswd3g3K0NFalpnQThpZG9iK1hoZnE3RCttaEt6bGYrQnlJc25lMUlU?=
 =?utf-8?B?bkVFNXpqQS9VUVMzWEFNOUJEc3NVUE50WS9CVGRUSzllUEVkRzdRVnR6R3hv?=
 =?utf-8?B?b1ZCNU1UdFdJM1dNdDhkNEpBa0Z6b05ob0tpUzc1ZkQzSW03R0F2UmhtWGlz?=
 =?utf-8?Q?5ZezEkVt/Vy6ud2K5Vu5+o9lM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 930ef572-8684-4ce9-6605-08dcd47f6702
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 05:38:03.6179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RgNWtZhm6K9GMDiaJPEu9zbsLyhtz2KUukudieaLav0sXHtejJUrQI3MgRHP73udCzP3OxZwLZ7bsnY3kF3G+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7836



On 9/14/2024 3:03 AM, Michael S. Tsirkin wrote:
>> So Maybe it is a good chance for me to continue the "transport vq" work?
> Transport over admin commands was envisioned more or less from day one.
> I think it's useful.
>
> But what Parav is asking for seems somewhat orthogonal.
Thanks! However, admin vq is a control plane, and we are implementing
a new transport, so IMHO an individual transport vq may make more sense.

Thanks
Zhu Lingshan
>
>
>

