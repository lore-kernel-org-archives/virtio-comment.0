Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BCC78C76
	for <virtio-comment@lists.linux.dev>; Fri, 19 Jul 2024 08:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721378960; cv=fail; b=JnnioIDrR+OHwW1Eyj50OP64l/kGLcMLj//jSgYF/XXgly5/drsc+MiqrIo6C07Gp79lUeQoovkX0FRiPoiOdaa5LN3/QTtIUGYhnmt9ZBByG16sUyrBySmktm9RjU82/4XUd7zuoJLF2Pq/il87/q9gsice6gmAusxnX6Eqox8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721378960; c=relaxed/simple;
	bh=A5HNsBqqr8e2vvZD1DKlJC1zCidmC9rJx2WjPanc/Tw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UX8XVWoyCkPLpq7ue4mI9dV45sCuu/f45sW8ZorsUz4kzbrWDMPERv0G/TI4MgxnLfAV84OsHwtsBuS19MaeKl2HeRi+607b+j7tqIrA7nK40DxDqc9kwrr594UbrXnl+aGHryAMXiwJRWYJegaHH1s1mGPi82R2YaafRzW8flg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=x67W87FE; arc=fail smtp.client-ip=40.107.244.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="x67W87FE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mPvUu4415YJ2+ws2xpwRKYgIaqoLWP666u0LFkAMyuldUBn+o4w9quIf37tQTXRGzyNYpekdWcA0zcvC8c8mMFJ2EM0nPMDwXUgu8MuIZ5ncYCaZgZgIH1DfphBbxCvfFg0Yl7WnNmINOMp4wzIXNwr2k2BDvZg504dLE3iWMmMNLvKrfN3DkPRBS8ebeRmcTIvKBRfF/onHYbLdv926GNSQ1LWh1i8cvhr1dlg64nuRvKfMWHZ80vrlpS4p3wdSk0I/rFIPTrY8oJtOF9c7DEX3yo6wQEzKhJI7EAdeglXM1e7Wp9mKBbOw3zos5+sonYxPC+H5IoTJnvCdnH5gzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6D8gIdkjRrytzxQKwLq8t0Nxx61jGV66IIHTVQDBNw=;
 b=O6JdXaNn4GVv3UQBgzgpiwQpXifcSwza/yp6iSj5E9+9AK6ZVkMY4lvrGS3ys68TPHlBsDrGOV5DGXTkuqMA1m2xQ8NR+PmTMjxte6sMxU5HhYtcNNwCWHP4SYQv4nY3B8sItbVIGFOU5Tm7hyxXdZQUgM7Ldib2Z15bJ3z+pavf75yZXUotK3ufYz3U4slK8cvXK4iiESsZKHoWttusktzVWZwaAkV9GX0f3DDjEXlIMCxxBYKgnUubRVXgpYUzdg8zxRG6bsXUPtUcswNkXTXhrcENGSg930IwUiVEoCPwRDOYUb+IZuCHzIFS2dBkxNqrQCp2tKmT0d/RlBb/sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6D8gIdkjRrytzxQKwLq8t0Nxx61jGV66IIHTVQDBNw=;
 b=x67W87FEYcZduft9gpo8gZzxmoJYVsMC4dR5l5P8CdCtOWF54myuMbSTTGvjvs6n9D+cFqDdlCdjXkbySr5s/7XaTzqhAwhN3gbzQh7WpEAtCHfqrlux2VanICUmMQqAewM9Qfi6hqlfxEA3KqWDp7x9NZdbO7fKzWPukPqsLkA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by MN0PR12MB6053.namprd12.prod.outlook.com (2603:10b6:208:3cf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Fri, 19 Jul
 2024 08:49:14 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%4]) with mapi id 15.20.7784.016; Fri, 19 Jul 2024
 08:49:13 +0000
Message-ID: <eab00b43-28f7-4949-bc05-31c0ba65e3a7@amd.com>
Date: Fri, 19 Jul 2024 16:49:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v6] virtio: introduce SUSPEND bit in device status
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: David Stevens <stevensd@chromium.org>, Cornelia Huck <cohuck@redhat.com>,
 jasowang@redhat.com, virtio-comment@lists.linux.dev,
 Zhu Lingshan <lingshan.zhu@intel.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>
References: <20240703031057.37565-1-lingshan.zhu@amd.com>
 <20240703044005-mutt-send-email-mst@kernel.org>
 <CAD=HUj6uxtq2WobmAaOeOk4UR-TeZ0nHL8SeE9MnuDaap5uY+A@mail.gmail.com>
 <20240704044403-mutt-send-email-mst@kernel.org>
 <c1fd18ac-a677-45b6-b643-9fd42ef14722@amd.com>
 <20240712071534-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <20240712071534-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0181.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::19) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|MN0PR12MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: ba996478-fdf3-4634-4c06-08dca7cfaa26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2V2WmVoQjloV3NGZGEvMU85bUxkR3E0RFozc1JOaDYrOVpMQTlqc1JmVUpH?=
 =?utf-8?B?d0tHMlY2RFgzWTFJTVFYeTJpWjdQWDdIb3d4NDJzVnkrR0p4VFNLY1h6QmYy?=
 =?utf-8?B?OGZpOWJmTExpTzFjTXFFOHVNdVhJYXNKcVJENHZzVlYwTW1ZOG5jN0t3Z0VR?=
 =?utf-8?B?ZkdHRkNTeFVwTExVeHpWb3BrNnV4ZUt0Sjk1Q3NTbUNDVE9WSHFOaWdxajJG?=
 =?utf-8?B?QzBrUTN3R0FYcUE1R2h3TjVCa1JEdnJCWXRkbkVlbks0RjJYcGIxVEpVeFBH?=
 =?utf-8?B?TFhXWFdWWkpVVVVmUHFMbjMzWmJHZTJVdHBnd05TY1hCUU1zcGFnMEtqdEdJ?=
 =?utf-8?B?cUZTZDlpUkVsZjloYkdyc2Q3ejdIYzZpN0hKdHlVSG56a3dtVU5jWUxLQ1Br?=
 =?utf-8?B?MW1KZTNHS3hORlhTZ21sd0orNk1HRGVTTWRjMzQ1L1VYRUNBcHp0ZXEwR1JV?=
 =?utf-8?B?Mk9DOFlJNTZzcXNEZzlNQUFUZlZYQjlJVlpyWlQ0NFlwR1BJa2tZMnlOTlUy?=
 =?utf-8?B?cjBsMXExQVBqWXo1Z1ZvMUp1bktjWnFkVm9vN2pYWHhxNGtTTnZiZ0l3UW9X?=
 =?utf-8?B?b3FtTUVLWnE4V0JOMDBBQkROSkt4eXE1WEtVKzdheWIzbzRUOHlxaEQwWmZp?=
 =?utf-8?B?dkVOZnBtY2c5MURVRWFmayt3TDl2SzA5ZkxFWUpQaTJneVp3ajgyN3V5Zk1p?=
 =?utf-8?B?SGJkVXNCZDlyS3VzNnkyV0VIYWFxSm4ybENGVzkzTC9ZeU1HRTdFb3VFcUc4?=
 =?utf-8?B?SE5ySmhnRnNIVFV2S0QrZWdkS1libExIZ0pzT0doMzJkQ2hNdm44RTNLWElz?=
 =?utf-8?B?V2FWbVhUYnJtMldCdk1XZUxRTmR6VlBHcmNKZVk2MDQ4ZXhoYTh1blJsSldG?=
 =?utf-8?B?bkM4Z1NsckRCOUVyWnJzckVTMktUeDlrWnBDZ2xTSDdqSThVaHh5MDdXWUdW?=
 =?utf-8?B?eG41Vmg3dFU3VSs0dkdkdVlQSm56MGdhQlRoc3BtS2FTTGpvb0hSWWdnYVQv?=
 =?utf-8?B?NWhIbE8ydThIQnhFclYxZTlCTEVLNk8xUjZrZjdmNm8zV1pkcUtHRTZVUU1r?=
 =?utf-8?B?QUVBUFA5TjcxVmxJQUQ2ZzBwWjIyTUFnWXlVSlorZisyY3VOb1BSNUU4QytR?=
 =?utf-8?B?ck1sYzZFQ1FHSWdkTlpxQVZISDJET3JtNk12anNnVFk0R1JORklLQzhaeTJC?=
 =?utf-8?B?eFB6T1BmQ1JRM0lYMU0zcTN0N3ZFNndFVXg1Sk1lOFFiSEgzUk5UU0tXNmZB?=
 =?utf-8?B?dUQzcGwycTRLd0MwSWhnbGRBNW8zdDZFREZvMCtQYzJCR0tYcjIybkFSRytQ?=
 =?utf-8?B?R1o2MjRFakF1c0ppNGtsWVZmOE94d3F5QUQyaXBHVkMwVjA5aElyd1IrcFdE?=
 =?utf-8?B?S0QvSzVLbGc3S1FuVmNMeHc3SFJRSXBNVmllcmFjUVV1aTdLTkYyTmd2aHM5?=
 =?utf-8?B?dU9kS0liWG5MVlF3bDNVMWFHb08wL3dHSkEwdmtSZk1iRUY2MzNKYkUvN3M3?=
 =?utf-8?B?RzRrMVVlMnQ1VUQzNWZlZ2l2RWkwb2xhLzJwbUE3YjloY3JrazBzdlkzN0o5?=
 =?utf-8?B?OXBGMUY1SUVDUjg5Mko3NnIzZDlZWEgycjFSV3NjdngrcGRZQTVJOEZyZ0dr?=
 =?utf-8?B?eHQ2UmFMWkY3S2hQNmRZdG9BakNNSmZtYnhHZGl1cHJKZEdpT1JQOEx2RFN2?=
 =?utf-8?B?ejh3Q3BDSFhkdVI3elovOENSUWpJNEZWV2xaRUdsUVU3bG5pM0IxU2x0NTVN?=
 =?utf-8?Q?ngGptGyNancN4GEe+U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlBRSy85MVVHYmZIMEpFNldUYnZuNlgydGEyelppa3VRMFlrMlhKY3ZiVmxE?=
 =?utf-8?B?U1lzK3lrU1VuNHZpRUdXVFhsblgwZ0RscEtQb2Z3UVo4NnovYTlZbXVNUEdQ?=
 =?utf-8?B?aUs0M2Q2YXZBcGR0Q2IrVGMxNTJkcC94ZktoVVE4SytScVUvVytyMUJuSDYv?=
 =?utf-8?B?d1k1ZjFGb1UrY1lmOTB4eHAxdUwvM0ZHd0xJOHhJQnBMN3hRaldmSHhKbXRN?=
 =?utf-8?B?MmlZdVJXTVdDclkyTDU2UkRybFdYSzlTVkZkankrK3RtTVpPWHBna0pWc1Zo?=
 =?utf-8?B?WVRxckJhWkZCM2RwRnhnVWtEaUVDVHE5Q05IVkxJUXhoWTlRaFJHMWNBU3pj?=
 =?utf-8?B?WUQwRTlxeVZHMEtsalJHVDhaSjZDdnlSTFFSckdyMUpqL1lUVkVyd2ViMUF4?=
 =?utf-8?B?eU52NXNmM3pwRjA2L2pkM3FyYmlSYzBCSUNJNjBJMDc2ZFFLZUtyWWtRU3o5?=
 =?utf-8?B?U0N0eVlROVhUZ3djRGt5OTFBT0JQcFVmamFPdUJmaGw4Y2RnVDlSb2F5S1JY?=
 =?utf-8?B?bStMR2VOczJBZHl6OVZKelY2U0lNc1JZbS9PbWp2c2FDakRKUjdmQXVzSDJr?=
 =?utf-8?B?aHZzdU5aSDNlRkI2bVoxejlQOEtqa2VJY1RHeTBLaDhJOVdWWnNQZVZ1TWVy?=
 =?utf-8?B?NHg0V0JzWVlwYmdFcFdBMll6SGtFZ0hYMXQvRTh0ZUgxTUV4QVlXRU91T3Rh?=
 =?utf-8?B?RmhGUGx0eEZvVDhrRU1xZDZIdHdHYVhXT24rZUdFWXZLbldYeWhOZzRJZXZ0?=
 =?utf-8?B?cGQyZVhmeXZYL3FDN1JRcy96aWEzeVA0TzhreldWUEtQTVFwdERNY2FoaExP?=
 =?utf-8?B?alVBRDF1dkdDUXhMRkNmcG5TWG5YbkQzd1c0MytPYys1eHJKV0VuM01Sbmpn?=
 =?utf-8?B?dmFDYVorTjdPd2phTDRKay80UFg5Ym5FUElIRHEzcDVwYVNMVVJ1TWJxZ2tB?=
 =?utf-8?B?Um44VDQ2U2pNek5pV0N0cDhYLytkQ2Q2S0ZlaEc2aHQzVWlNaXliS1JaVDJ2?=
 =?utf-8?B?UUtqQUR5MndYanpqQXdDbm5OTzBLckJDVTJpQTQvMmJvQ202ODlLWFViZXZu?=
 =?utf-8?B?NWwxWW5XZTlGZmdlTlR5aFBaa3JPSmNvSlNGWVRBamJVQjlEdWRYZzdQck1n?=
 =?utf-8?B?M0FrTjJJOVpqV0ZVd2FOYmNncy9xdnJFM1dMTUhrRDJHSWRQZlZKTUl1S0pn?=
 =?utf-8?B?MlFpck5BbXQ3RktEUHJWemFLRGZOR0xBMmRITkU5SkhEWkRjMnZ6WW1zZDc3?=
 =?utf-8?B?M3hHYk9jbCtsRm03ZFJob3NSQXN1RGoxS2VtYnlKWnVDQXFjK243SFJtSGNB?=
 =?utf-8?B?aG5uTmVwVVp3eGRUdmN2aVo1YUorb3pIYU1JV01qQmhIdFNhS0JkWFU0UUZL?=
 =?utf-8?B?bW81OVRvSDhXcG5rcWR2K0g1elRKTHNxdXNZT3I0M3B1aExhV2tSeUFGTU44?=
 =?utf-8?B?RUwweWFPaThBdlROV3RiOG9oU0RGbldPRDdiaVQyYlNtcXNCRzFGSVhtZWQ2?=
 =?utf-8?B?SlJxM1E4ZHE1dVhkQUwzU0diVDVqeE1SbzNnY1RCdXppOGcrVEszODFKVG52?=
 =?utf-8?B?T2NZSFJaTnJPTFIxYTVKRTVHRURyQWkxS2Q1c3RUOExxTjZ2QTM2SUgrRnp3?=
 =?utf-8?B?K2toejZvcHg0Z3o4aXFqVW1XR2xPUG53UmRqZSs2WG1xek83VkloSXp6cjBr?=
 =?utf-8?B?Y3A2aERhbTUzNjVrZWtGQjdiR2dSNE42eWprZk5NT3FnSExXZ2hjTXg2a0c2?=
 =?utf-8?B?d3pIRTFyc2VYKzhhNWxrL1VJVFlmdXJYZVJHVWtoaFBkN1crZUdleHRIL2Rx?=
 =?utf-8?B?UmFqMkFBQ0J1VXBRNU9iV2tKUm9MaEJSVytJdTJpVmhqditTVFczWlo1T3Zi?=
 =?utf-8?B?VUI5R3dzVmhUdlU5WW5HUWhnaWpEK2lPdk5qR1VxR2dIKzYrMXRNYU5WbFBX?=
 =?utf-8?B?VC8ydEcwbXExNUZ5RWJ1dkNiWVFlUXM3V0lEY0FNNnBWWGFDZjFqSUd4T1RY?=
 =?utf-8?B?N0dSbXNZdU5lSVhCaHBVNDZBTEJ3ZDNEeVhuMkZYSXJnZ2xZcHRIOVhlV3lZ?=
 =?utf-8?B?eFZkRktzSmpLWm1WSGI0MDlqbWEvVE1QckgyMVBmSHBFTEwwcnl6TUw0QVY2?=
 =?utf-8?Q?FE5USAqVd2zYctapzvj27Bawe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba996478-fdf3-4634-4c06-08dca7cfaa26
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 08:49:13.6589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6FLBFXBZCCE7ZahJTHvV8M+5qSxPGUMaJGiKoRIs/ZzvEPQU1nxCPrVfygcf7yF7oCfId/fYGYc1MVAJCmL96g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6053

On 7/12/2024 7:18 PM, Michael S. Tsirkin wrote:
> On Fri, Jul 12, 2024 at 05:04:48PM +0800, Zhu Lingshan wrote:
>> On 7/4/2024 4:55 PM, Michael S. Tsirkin wrote:
>>
>>> On Thu, Jul 04, 2024 at 05:39:32PM +0900, David Stevens wrote:
>>>> On Wed, Jul 3, 2024 at 6:01 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>>>> On Wed, Jul 03, 2024 at 11:10:57AM +0800, Zhu Lingshan wrote:
>>>>>> This commit allows the driver to suspend the device by
>>>>>> introducing a new status bit SUSPEND in device_status.
>>>>>>
>>>>>> This commit also introduce a new feature bit VIRTIO_F_SUSPEND
>>>>>> which indicating whether the device support SUSPEND.
>>>>>>
>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
>>>>>> Signed-off-by: David Stevens <stevensd@chromium.org>
>>>>> Your signature would normally be last.
>>>>>
>>>>>
>>>>>> ---
>>>>>>  content.tex | 71 +++++++++++++++++++++++++++++++++++++++++++++--------
>>>>>>  1 file changed, 61 insertions(+), 10 deletions(-)
>>>>> At a high level, I think this is somewhat overspecified.
>>>>> Generally e.g. if driver is forbidden from accessing
>>>>> a field, then we do not also add specific requirements for
>>>>> devices - with no driver doing this, such functionality will
>>>>> remain untested and unused, and when we finally decide we need
>>>>> it it's not going to be there.
>>>>> Similarly for when device is not touching a field - no
>>>>> reason for driver not to touch it.
>>>>>
>>>>>
>>>>>> diff --git a/content.tex b/content.tex
>>>>>> index 0a62dce..8c974d3 100644
>>>>>> --- a/content.tex
>>>>>> +++ b/content.tex
>>>>>> @@ -36,19 +36,22 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>>>>>>      this bit.  For example, under Linux, drivers can be loadable modules.
>>>>>>    \end{note}
>>>>>>
>>>>>> -\item[FAILED (128)] Indicates that something went wrong in the guest,
>>>>>> -  and it has given up on the device. This could be an internal
>>>>>> -  error, or the driver didn't like the device for some reason, or
>>>>>> -  even a fatal error during device operation.
>>>>>> +\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
>>>>>> +  drive the device.
>>>>>>
>>>>>>  \item[FEATURES_OK (8)] Indicates that the driver has acknowledged all the
>>>>>>    features it understands, and feature negotiation is complete.
>>>>>>
>>>>>> -\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
>>>>>> -  drive the device.
>>>>>> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that the
>>>>>> +  device has been suspended by the driver.
>>>>>>
>>>>>>  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
>>>>>>    an error from which it can't recover.
>>>>>> +
>>>>>> +\item[FAILED (128)] Indicates that something went wrong in the guest,
>>>>>> +  and it has given up on the device. This could be an internal
>>>>>> +  error, or the driver didn't like the device for some reason, or
>>>>>> +  even a fatal error during device operation.
>>>>>>  \end{description}
>>>>>>
>>>>>>  The \field{device status} field starts out as 0, and is reinitialized to 0 by
>>>>>> @@ -60,8 +63,9 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>>>>>>  initialization sequence specified in
>>>>>>  \ref{sec:General Initialization And Device Operation / Device
>>>>>>  Initialization}.
>>>>>> -The driver MUST NOT clear a
>>>>>> -\field{device status} bit.  If the driver sets the FAILED bit,
>>>>>> +The driver MUST NOT clear a \field{device status} bit other than SUSPEND
>>>>>> +except when setting \field{device status} to 0 as a transport-specific way to
>>>>>> +initiate a reset. If the driver sets the FAILED bit,
>>>>>>  the driver MUST later reset the device before attempting to re-initialize.
>>>>>>
>>>>>>  The driver SHOULD NOT rely on completion of operations of a
>>>>>> @@ -99,10 +103,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
>>>>>>  \begin{description}
>>>>>>  \item[0 to 23, and 50 to 127] Feature bits for the specific device type
>>>>>>
>>>>>> -\item[24 to 41] Feature bits reserved for extensions to the queue and
>>>>>> +\item[24 to 42] Feature bits reserved for extensions to the queue and
>>>>>>    feature negotiation mechanisms
>>>>>>
>>>>>> -\item[42 to 49, and 128 and above] Feature bits reserved for future extensions.
>>>>>> +\item[43 to 49, and 128 and above] Feature bits reserved for future extensions.
>>>>>>  \end{description}
>>>>>>
>>>>>>  \begin{note}
>>>>>> @@ -629,6 +633,49 @@ \section{Device Cleanup}\label{sec:General Initialization And Device Operation /
>>>>>>
>>>>>>  Thus a driver MUST ensure a virtqueue isn't live (by device reset) before removing exposed buffers.
>>>>>>
>>>>>> +\section{Device Suspend}\label{sec:General Initialization And Device Operation / Device Suspend}
>>>>>> +
>>>>>> +When VIRTIO_F_SUSPEND is negotiated, the driver can set the
>>>>>> +SUSPEND bit in \field{device status} to suspend a device, and can
>>>>>> +clear the SUSPEND bit to resume a suspended device.
>>>>>> +
>>>>>> +\drivernormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
>>>>>> +
>>>>>> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
>>>>>> +
>>>>>> +Once the driver sets SUSPEND to \field{device status} of the device:
>>>>>> +\begin{itemize}
>>>>>> +\item The driver MUST re-read \field{device status} to verify whether the SUSPEND bit is set.
>>>>> If it's not set, then what? Device error, have to reset?
>>>>>
>>>>>
>>>>>> +\item The driver MUST NOT make any more buffers available to the device.
>>>>>> +\item The driver MUST NOT access any fields of any virtqueues or send notifications for any virtqueues.
>>>>> what are these "fields"? the area in memory where the vq lives? why is
>>>>> doing that a problem - you want device to be able to write something
>>>>> there?
>>>>>
>>>>>> +\item The driver MUST NOT access Device Configuration Space except for the field \field {device status},
>>>>>> +if it is implemented in the Config Space.
>>>>> what is "the Config Space"? device status is never in
>>>>> a device configuration space, it is part of the common configuration.
>>>>> so what exactly are you forbidding here?
>>>> IIUC, referring to the common configuration here wouldn't make sense.
>>>> The common configuration is part of the PCI transport specification,
>>>> so in this part of the specification it should only be referred to via
>>>> the "transport specific" phrasing.
>>> Good point.  We can easily fix this for MMIO though.
>>>
>>>  
>>> MMIO virtio devices provide a set of memory mapped control
>>> registers followed by a device-specific configuration space,
>>> described in the table~\ref{tab:Virtio Transport Options / Virtio Over MMIO / MMIO Device Register Layout}.
>>>
>>> ->
>>>
>>> MMIO virtio devices provide memory mapped control
>>> including a set of common configuration
>>> registers followed by a device-specific configuration space,
>>> described in the table~\ref{tab:Virtio Transport Options / Virtio Over MMIO / MMIO Device Register Layout}.
>> IMHO this may be a bit vague, PCI as a section about common configuration and a struct "struct virtio_pci_common_cfg "
>> listed all contents. But what does CCW/MMIO common configuration contains? Shall we add new sections for them?
> I think it's clear: everything that is not device-specific is common,
> and we have a table documenting that.
>
> And again CCW does not have registers, it has commands.
> And below I suggested listing the common configuration commands.
OK, so would you like to add this editorial change or shall I work on it?

Therefore, in V7 I will rephrase fallback to V5: "The driver MUST NOT access Device Configuration Space" Any comments? @Michael @Cornelia Thanks Zhu Lingshan
>
>>>
>>>
>>> Less sure about CCW.
>>> Maybe:
>>>
>>> In addition to the basic channel commands, virtio-ccw defines a
>>> set of channel commands related to configuration and operation of
>>> virtio:
>>>
>>> \begin{lstlisting}
>>> #define CCW_CMD_SET_VQ 0x13
>>> #define CCW_CMD_VDEV_RESET 0x33
>>> #define CCW_CMD_SET_IND 0x43
>>> #define CCW_CMD_SET_CONF_IND 0x53
>>> #define CCW_CMD_SET_IND_ADAPTER 0x73
>>> #define CCW_CMD_READ_FEAT 0x12
>>> #define CCW_CMD_WRITE_FEAT 0x11
>>> #define CCW_CMD_READ_CONF 0x22
>>> #define CCW_CMD_WRITE_CONF 0x21
>>> #define CCW_CMD_WRITE_STATUS 0x31
>>> #define CCW_CMD_READ_VQ_CONF 0x32
>>> #define CCW_CMD_SET_VIRTIO_REV 0x83
>>> #define CCW_CMD_READ_STATUS 0x72
>>> \end{lstlisting}
>>>
>>> ->
>>>
>>>
>>> In addition to the basic channel commands, virtio-ccw defines
>>> channel commands related to configuration and operation of
>>> virtio - a set of commands to access common configuration of
>>> the device:
>>>
>>> \begin{lstlisting}
>>> #define CCW_CMD_SET_VQ 0x13
>>> #define CCW_CMD_VDEV_RESET 0x33
>>> #define CCW_CMD_SET_IND 0x43
>>> #define CCW_CMD_SET_CONF_IND 0x53
>>> #define CCW_CMD_SET_IND_ADAPTER 0x73
>>> #define CCW_CMD_READ_FEAT 0x12
>>> #define CCW_CMD_WRITE_FEAT 0x11
>>> #define CCW_CMD_WRITE_STATUS 0x31
>>> #define CCW_CMD_READ_VQ_CONF 0x32
>>> #define CCW_CMD_SET_VIRTIO_REV 0x83
>>> #define CCW_CMD_READ_STATUS 0x72
>>> \end{lstlisting}
>>>
>>> and additionally, two commands to access the device
>>> specification configuration space:
>>>
>>> \begin{lstlisting}
>>> #define CCW_CMD_READ_CONF 0x22
>>> #define CCW_CMD_WRITE_CONF 0x21
>>> \end{lstlisting}
>>>
>>>
>>> And now we have common configuration defined for all transports.
>>> Cornelia, WDYT?
>>>
>>>
>>>> This wording appears to be taken
>>>> from Cornelia's feedback on v5. Specifically:
>>>>
>>>>>> +\item The driver MUST NOT access Device Configuration Space.
>>>>> ...except for the status field, if it is part of the config space?
>>>> I asked for clarification [1], because Cornelia's feedback seems to
>>>> contradict your feedback here and on the (unfortunately unarchived) v3
>>>> patch. What is the definitive statement agreed upon by both editors of
>>>> the virtio specification as to whether or not the device status field
>>>> is part of the device configuration space?
>>>>
>>>> [1] https://lore.kernel.org/all/CAD=HUj4RBeLS4L=ehyPGtejeu+sGZ5j8PRtrK8AvxjEgEBd5ZA@mail.gmail.com/
>>>>
>>>> -David
>>> I don't know what did Cornelia mean. Cornelia?
>>>

