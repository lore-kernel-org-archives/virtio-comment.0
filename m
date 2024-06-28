Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A76405E6
	for <virtio-comment@lists.linux.dev>; Fri, 28 Jun 2024 09:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719566914; cv=fail; b=OmJeTaT3FRMqA7EkVXT4qASFyqTnl6BsOKZdSScRdkp4a6YW39/vTDcfyJzY/KLV73W5cIDQg72l+M6sWmsYaR5O84uhhi5SGKEQgshsMUHTwVlc/f8JJaxyeH2DUNd0gvwCN2vMmtq1rFXArh3O78VYWU2Jk5rl33csTSn7TQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719566914; c=relaxed/simple;
	bh=sletq1DHyQzUa5l0FHVwU1WQKs69f5RHAytaVr2PE4Y=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=J90DI+ksISu7JRBL/LqIhDKyQzuG1hZLq23N6I+OWUfzUQLg7snkVljnsW28Ni3S0aN824EDdYIQppJL3/K/nQVTZW5euQCYv94pk39JNOe49AU7uhWucwbJ00meofcXGvsczXWvO4Eq4Ym37dji+yiA4d9+E5nViBdlHpaq+xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DBLX65mD; arc=fail smtp.client-ip=40.107.220.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DBLX65mD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvpIMlK3Unf6WkhHGZmvBP03OmyS8i4yvsUW4gZbFroijcvAxUZvTiIEoiLPKfuyL7UtTX1bk/9CUZAMToeyCk/TavWXvg17eT8PdHHARTZCNVtJQOeN/duWcSb1yit7HnHA/1ajUeRwJ+uC232O+zHTOJBQAzeVML9gQsYS8C1xn8j767DOGtSxVr6FRQgChNIjiL/EP3U9TKTsrTP6/xVhT+GNrJmd1rftolgzXhXa1vbmOI+tzrqdxB4AxS69MZ0XbQZzEGgmsm+AqRMMtSOPZTSWnh74y7l2qETlHAGZ8zkFCj0OqsuG0zR3BewnFNUaOPEpRAruRbV+ex/+9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sletq1DHyQzUa5l0FHVwU1WQKs69f5RHAytaVr2PE4Y=;
 b=fK4PT95z+0IeSSvY8eX2AghPdU9MPZX0bFgYo4yErNtq7kLSgN2Hp6XAFxZf28H7uXYkeNN3UBz8ZrgiEL3AZkMZ62FXp49PEp2EJvvMVlsSwMBsHN0b11/VpPepuDx7lkHKcZQcrwABV38GjzJzQ//t2yGR4Ad5zlGSPceLNxXlPyHnDH7Gir7DeKHv6UI3qlVreNucX5/oKzBz1FkAfD6Wp0WfXX8lh6qGnckcRxg7VAphTdlv0znWKlQ75kH+yJgvU8scF9AhM7LkTEOwsjIPGYNqIVFrdaNYnhfRSTIKyoX/LoYY4XtrC/qAGkDZG/WDHOI4YHjMS+GSBHhUwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sletq1DHyQzUa5l0FHVwU1WQKs69f5RHAytaVr2PE4Y=;
 b=DBLX65mDTWm2Wdfw6jdNuKeZQKxU3E9g6sDlkg7KJRa1GJkjKDB/Y/IkB6G6ddby2KzZzrFTWMhj9wkipRSEzBEHtSlSFKolPHZv+j06PHfiS0cgrEPCSX2jbX6ntb6RQis8eXQKIW0GwdjyBMpJiGzREp4vK5EeQvmdQZWdT00=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by SA1PR12MB8946.namprd12.prod.outlook.com (2603:10b6:806:375::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Fri, 28 Jun
 2024 09:28:30 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%3]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 09:28:30 +0000
Message-ID: <aa5e581b-a8a5-4196-b274-79887242734b@amd.com>
Date: Fri, 28 Jun 2024 17:28:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: Request voting rights
From: Zhu Lingshan <lingshan.zhu@amd.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, cohuck@redhat.com
Cc: virtio-comment@lists.linux.dev
References: <1f4e0199-ba54-44b1-a060-91acb002bb62@amd.com>
Content-Language: en-US
In-Reply-To: <1f4e0199-ba54-44b1-a060-91acb002bb62@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::7) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|SA1PR12MB8946:EE_
X-MS-Office365-Filtering-Correlation-Id: c61b1b83-8418-47c9-43ec-08dc9754abe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UkJaVC8wVkpHVk03RW9UdTJVZDZPUXEyZFlySjB5ajlvN0R0WGorVTVrVEJ4?=
 =?utf-8?B?RE11NDNhMytCS095UUJYdFhOUTRFSWc1U25TWkZYWDV3UmF1ZDdoS2t4Rkc4?=
 =?utf-8?B?OGJYcFl1RzRNRHhBTkdTUWNxR3h0YXlkZXhSYVlOOTN2UVg5QlptWU5yTUp5?=
 =?utf-8?B?MzhXTVlzazdpR3VJcXNOZmVBTzliYk5KM01kY0crcTFXWWtKNUZrbUEwQUFX?=
 =?utf-8?B?eTlwMnEwT3NkLy8zMDVRaHdSRUVNMHlNUXQrMFh3SXA0clA3NDEwZDVRdUpw?=
 =?utf-8?B?U2pZcVhDYVgzYUR0L29MdXlTV1pIbW1uZTUvVDBhdEM2N2k2N3dtTFNXaWRK?=
 =?utf-8?B?UTFXK2xzUWE2Y2kwTGticXprYWxLT09QcCtEdjBNSCs0UnNHZmhpMVpKdG4z?=
 =?utf-8?B?YnUwT0pQdlBpUmd4NktqdElnY3cyNXVTUnJRVkNSM3lOd1M2WU0wMnc5amRN?=
 =?utf-8?B?ZU96OWs0VG9yVFc1UVZXSDFoUnYvQm1Cb05NWDdHRUZPbHN0dVI3T0ZyRllq?=
 =?utf-8?B?Ym5CdmR2TzVJRjFkeXZscXF3Z2ZhbXc5elVPNUtUa3F5MG42RnU2dHZHSUg0?=
 =?utf-8?B?TWcrdE9UUVhZV05NdzNpNUNQY09iS3NOTzhuZ2ZKaDloK0pSZlhreEdJNCtN?=
 =?utf-8?B?SVFIWDFnSmtvN1lHT1RXeXYyWGFRYkNGYVVVS3NlRU16LzRyaHhGdUZ1aHZS?=
 =?utf-8?B?OUxjK1RqS1ptZnBPZ2g2R3MxSDNqOVhKdkRUUHg0VHlZTTVWYUV5Y0NCMWJi?=
 =?utf-8?B?ZnlRenJZengyZjU4Mmh5T29ZL3VGK0J2a0xPTDYxMVRmQ25KNUgvd3R4aS9w?=
 =?utf-8?B?d2UyNkF3WllBNUU4MllrSUtndlU1SnNRaFBNT3ZlV1lTWXJQdmtmN2pORnJB?=
 =?utf-8?B?VnBRaDVOY1pmaUM4YkZQb1VuQkFIY2dhcDlZUnpNbXk4cWthazJFS1ZmMWhq?=
 =?utf-8?B?eE0yT3NHaW50TEVqQnc5N0JmaVpoVE5Hd0RRT2NvNW54dyswYmRoSkFXa3py?=
 =?utf-8?B?eWVNVVVqQ2c1aEhUYTZ0L3ordk5nSmtJR3gwREZNNnQ5NTIwTGVJZVRybS9M?=
 =?utf-8?B?T2U4aGUyVUZyeWcyMG9GZGMyUndtdUtZT0NxVGtxaU00ZnlJT1dMektoVWFk?=
 =?utf-8?B?TmlZdERoNkw5bWFmcG5MS2kzWjFveXNEWWZiZ29YZVBya3V3WnA1MThOdGhs?=
 =?utf-8?B?YzVnOFc2N1JvZ2NFSzc2blpjdWdqOUY4ZG1qMHBwQVJzYnJrRUhyVGN4a2kr?=
 =?utf-8?B?WUxmREpQY0U2RTFzRXdaSWNDQ0VicGIyMURKMlNUQU5Wb1RyNmFQSEVXaWJo?=
 =?utf-8?B?TUcveFVlcVVKV29QQWlxV0dERzlxNFdMaVpqNEQwby9FbmZkWms4ektaTllY?=
 =?utf-8?B?NnRTSDBja3ZkRFpXUUd3TE5oaUwvTVlNUk5vMUhFd2twVWhiMUhuaUYrUy9n?=
 =?utf-8?B?Q09ZNnFvdFV5T2UwYjAwa0hTam8rZ2dzVWhNdkhDL0RHVUJYcEVmT1llM21m?=
 =?utf-8?B?NHJ0TmJHZnRzdGgyNm5CYzhtcDdwUFBMSWt0blk1MmRPVUNWMDltZUxSQWJR?=
 =?utf-8?B?SFlWQ3dubWhYQkZQSXVIUUpkeW1zNUZCSjRXNS8rVXdpV3JxWTNtYjQxM2Zx?=
 =?utf-8?B?bElOODFkYkVIWE9JcnhzK0NnV1liOWlOZHZHL0ZJV0lGczdpUXV2K0QwSUhw?=
 =?utf-8?B?djlMTitwa1M5R3VOOHl6Mm1yVGZaOEVVNWJyK2J1d1JKL1RSTmZWbmxONGVh?=
 =?utf-8?B?bjNpOGJLM1FKTkFaRm1laU5QYStWNzMxc2NIYTU0UFd4U0pGYzFVYUtuZHFp?=
 =?utf-8?B?VjExQnBYMEZmaTk4Y0ZDdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3NVUS9rbitRdTU2SS95R3dQWnlOYWNMVXJOeEUwRlIvYjNBanpObWk0T1hB?=
 =?utf-8?B?S01pbllrbmpzd1Bjck1uUXQvMUJWc3hTRmdaTU1OdVJqWitQNWlRVG9mT29w?=
 =?utf-8?B?NnlkWU5helJNWXJ0T3M1bDdrQzc0STZIcGVoLzcyYVFLUU9jZjRjTU0wZDdV?=
 =?utf-8?B?U0NDV015S2NXZmFRL01rdEpsQWJMZThCejVXNEJ3enExOC9Kd0Vyc2xla0NX?=
 =?utf-8?B?UjFDeTVjN3lwbjJtaC9sWWNFVk9WMC80RmpJRXNLRzBUZDgxek9MM25qbEJL?=
 =?utf-8?B?ZjVEbGxqQ2V0R1dvQUJFdmRiMFUxTzl2clpnK2tBd2QzVTJtU1o0SjZ2amFl?=
 =?utf-8?B?alcyZzdJT1pwUUxwblhUQlJhbEcyZjV1RWV3aER2bXdBRExham9DYnVqa0dT?=
 =?utf-8?B?ZXQyOE1LTTcrbFVSRFRmQzJxZUNDNXB1MSthNTRkdDlENUNsRFlmcGZtakJT?=
 =?utf-8?B?eXlCWVJDTmhId2ZxWENiUG1OTElobTBkV3BGT0tEa2l0OVBkWXA4L0FWUG9o?=
 =?utf-8?B?QnNoR1IzVFhJUFc1eHljU3IwUjdPT05ieXdDdHRqZm1sU3RPa0Y1a0J0TGN4?=
 =?utf-8?B?TitaQnYzamlDK2dRMkVrenR3dXY5dUdoOVhQUHhpOCszRjFCbm1wNFJDY0pn?=
 =?utf-8?B?WlRqWmJGRFFXM1BDYnlEendsb2lhUTdmVkthbjlrZENGWS9iL04vMlp2SWZj?=
 =?utf-8?B?ZzdWOStJRXNUbTBjY3RUOFFRVTJKM09OL1BERTgyWVcrSHNmOGtFUndmOHhO?=
 =?utf-8?B?ck9kTVhIU0ZibjJzenN5cEpXWXkyc0ZJMmgwK21ScTFPVGd0MUl6dSszWDFq?=
 =?utf-8?B?RFV1OVNqSlhJY3h3dEpvVWVTQkFUR3NJcFdiOUhoRW9OVUZtMTA0ZVNmTGN1?=
 =?utf-8?B?VW40YkoxNlN2RzFFVFovV2N3UWJmTEUzaGE4bHFWN3VxdGFCY3YyQkl4c0gz?=
 =?utf-8?B?NG9ReU5YVWl5L2dOS0U4bHVobUFlMXFrL0RZOEV3QVZUc1Q4SEVJKy9abGc2?=
 =?utf-8?B?WVpCbjNpZnZoZVp5VzdLcmlVRmRlbDdOZ2tROUxQN3Z5SW9FK2dBVHNOVktR?=
 =?utf-8?B?SmQ2bjJ5Znovbjc0RU8xcUxCNi8wMjhXYmxUY29nTVNKSkZxeEhKWlpkS3g1?=
 =?utf-8?B?MHRacFZZcjZJUEthUWxWaVgyMEh2V2RJQU0wczkwa3I0aW5zMVpWVmUvMi9R?=
 =?utf-8?B?MExCVllYT2VSUUVSTFZxSkZCSk44T3VmWE9kMzAvRW1tWldJcjdkZ3g3UUNF?=
 =?utf-8?B?emI0VDBEb0ZUZW1nblVjbDFqa09xQk1tU3QxaUtjZ0diUExabXplcHR5Z0lE?=
 =?utf-8?B?amUxRDlrYkpxTUN5eTZMSWQzcnJWUUFDWGU0c1laR09Hc1dVdGJVckRUQktM?=
 =?utf-8?B?Vm5aZHJvaWxDZEJ4THZZMmRZNHJwajZMbTJUcnRXc3M0K1N0MmszRUtVaTRy?=
 =?utf-8?B?TDlKNUlBZ2NYd1JkdlpLNWNUYlVYSXNhMDlLU3pHR3dnaGdkS2ZZWGVZQ3lS?=
 =?utf-8?B?ckNCalAwbDlKQXhPK3hIUWEyMERQaFh1a0ljV2hvc2x1VytqbU1WL0tmSk13?=
 =?utf-8?B?TU5sQ2FUa2JKRzlBRGdhLzB1NnMvdzZNTDJvNFJwa1NOS0llUWZmYXljRVEz?=
 =?utf-8?B?cXpGQjRJYVovN3prdGRuSU5wOVBZay9yNjZDNEl1OGhQNmhUNnhmVjFaNEJn?=
 =?utf-8?B?SXBLQ3ZiRGIydXdtRkhmYkZGa3dzTG1MNXM0aldaS2VMVEZFUTM0MG9EOVNh?=
 =?utf-8?B?RHUxY2doZzlSckdGeXdSMUd3ZFdRcVloRHVqTjFoNGxSMHF0cUVIN2MzaDg1?=
 =?utf-8?B?UHc4TE5sWnFJVzhONE5Qc041Y2MwcFBROTN2ZDJzVjRwQmY5T1ppTGd0N21v?=
 =?utf-8?B?U1d5Rko4TmlWc1hlV3I1dlJleS85RnJUWXUrbTNQNHZ2a0lFcDgrTjZwVW1U?=
 =?utf-8?B?RkRaOHAvRTZBcjV1TE9MVDV6SHNHWFUralIxYng1QWkwamMwampZblFxY2JM?=
 =?utf-8?B?S3AzQ3NkbE1JTGk1VzZqRWpmT2RISVplcWR4SnZLUHVveHBFK2dmd3Z4U3Q3?=
 =?utf-8?B?QWtLaFpORzF2RXgycDdzc3R3Ky9rYWxEOUhweGt5K3FuanB6cExBQXZYamVD?=
 =?utf-8?Q?ftD/5f0bK4mkkk1DCUJrNCgJR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c61b1b83-8418-47c9-43ec-08dc9754abe2
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 09:28:29.9944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Psq62Wdn9HmoGxB9sRBnvFHraLjc8CvTfbP/1D8tLNy2n0KJqk0ryKThY191N9lNvl8re8IRPIOyL9kusNqPiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8946

Hello Chairs

Gentle Ping

On 6/7/2024 9:48 AM, Zhu Lingshan wrote:
> Hello Chairs
>
> This is Lingshan who re-joined virtio TC last month.
> Prior to AMD, I was a voting member on behalf of Intel (lingshan.zhu@intel.com) for two years.
> I humbly request to be a voting member, please kindly help grant voting rights for me.
>
> Thanks
> Zhu Lingshan
>

