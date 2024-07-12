Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2050.outbound.protection.outlook.com [40.107.101.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204CB143732
	for <virtio-comment@lists.linux.dev>; Fri, 12 Jul 2024 09:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720775104; cv=fail; b=lrGoey8uIxL5D202o0YWJY0DoW1XHqZCD/RVGd5U9Y6skEHqSSwYAxYmcvJycTPulCrUcqe7FpAgo8c4js2LjiJt9OU8Tr5ie4xluJ3z4WZeNmLYPYnpf2FFzAv84S3xGHNhIQCdtDfE4F9EYPrISAKlVW4fd7X2rcWBiZ9hzqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720775104; c=relaxed/simple;
	bh=dVr6KazrjibYK+JqjCjlwmI2hafmvNnaN/P04MWrrqA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iwSSnZZyxfA5uDyuXcTf5D1YFv5OUPB9b4CcAlyJ0lB82cBPCT8NU4pgGqSv6ACgXzxBUPcezv103mx/pFyZh3RgCCfk8g9OHA/STCqTnrrGora1qpzJ2udrKhNnmnihPMWXHpBWkzyLcQVaR30Dhiu/U52tFBa37Wm5+TjVuNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QqRH4x4c; arc=fail smtp.client-ip=40.107.101.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QqRH4x4c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0oq3RD8oTCJNTydBLXcRQgtBsWme5PdEMy0T1/Kb351UcQoToRKzmQzJylskuOufitNSa6Dhv/d0yaUDxzPTWxbZZcncv3AYgbAHqSS0LahNz0yWey+NqOhVLyAqj/0g1kNqz7WgqX6uE73oH4fTNzf2gXw9wMHoFXYwKgVHfQ+tjXJ17Mi9vNu+VvUsI7iD1uMC9PC2rFv1pimiKtEs+CIreWmrkfDzw+eXiVDqCzLBOqFfWX8RZINhtBORDKYtVJDu0xg7Q6FzUJcDEEg6Qn1lBL6321+lQQ8otnTI8O3dgC4rUj9fzKbVL3Bm069rASIPF2p9r9lbuXbxROUnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXOj6BMWWzZxnWBkjs9m696B1M5MOASC5ygf9iIQ3QM=;
 b=ywFeiS7FvMT/FQC5x61RdKC+qLK6XMN1Qs12OV+DvF+l1U7ojpYfrSJXfJsAH881QKEl5KBKG3vLx0nDQ5HWVi8MZHdCcY7GCDbX5NFmz/o0HpGaaX6b8a6o7QJQsgCwV5KTPpjWjeGCCm+XMp6RzMLBbh7RqdamIMfAGLrzwmYBkOISYyXGrjCsOfXkM7jkEs+tnxUJdnTVDV03F3vfEP65OE4N9nN7tre8ZmsokEsOv0e6srnqCIw5wHv8gTVa9ZktceeIABMPc0iKgbx6RjzYeo5x/+iB2GAAC/+AAQCCm3zxG/GNS/MDOWusQxfOvx1Ob7UIxUvBEZAxyQXF5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXOj6BMWWzZxnWBkjs9m696B1M5MOASC5ygf9iIQ3QM=;
 b=QqRH4x4cS5k3hvjMuyMJZu53sTick2M5XYWkB+w+nFlgNofv9oPfuY5EdqlO7vZ+dCaJ2Sxv+8BAHHOYqz6yGlBqQceHHBzOj603rUwlScDLW32ftzkaBnt+trsapCOxAfpHlHITGlA5b/pF/gUcb7qJsblTuriObKXCjsrrT4w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by SA1PR12MB7248.namprd12.prod.outlook.com (2603:10b6:806:2be::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Fri, 12 Jul
 2024 09:04:58 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%3]) with mapi id 15.20.7741.027; Fri, 12 Jul 2024
 09:04:58 +0000
Message-ID: <c1fd18ac-a677-45b6-b643-9fd42ef14722@amd.com>
Date: Fri, 12 Jul 2024 17:04:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v6] virtio: introduce SUSPEND bit in device status
To: "Michael S. Tsirkin" <mst@redhat.com>,
 David Stevens <stevensd@chromium.org>
Cc: Cornelia Huck <cohuck@redhat.com>, jasowang@redhat.com,
 virtio-comment@lists.linux.dev, Zhu Lingshan <lingshan.zhu@intel.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
References: <20240703031057.37565-1-lingshan.zhu@amd.com>
 <20240703044005-mutt-send-email-mst@kernel.org>
 <CAD=HUj6uxtq2WobmAaOeOk4UR-TeZ0nHL8SeE9MnuDaap5uY+A@mail.gmail.com>
 <20240704044403-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <20240704044403-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1PR01CA0117.apcprd01.prod.exchangelabs.com
 (2603:1096:820:3::33) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|SA1PR12MB7248:EE_
X-MS-Office365-Filtering-Correlation-Id: 48ce6190-3d6e-4f86-660d-08dca251b414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGRtM0pQWGt1WCtZM2IwOFVkRWtORlFGRUE3RnZqdk9tK213YWN4VnlRQ0ND?=
 =?utf-8?B?c3JDYkg2QW5EaVczY1dNRXB2bFFvOG5HMkk5VEhVNHdzKzhPWVUvOUkvZUVO?=
 =?utf-8?B?a1dYSW9SQmhqQ2VVMWIwcnNyQVUwVG1kNWRZV2E0K1l2RVhEbG9panp4UkpK?=
 =?utf-8?B?VFJzbGpqVTRHQi9uUEMweUVZOVZyc3JCMGZFOTRuc1A5Qi90b0FFaENSVEp0?=
 =?utf-8?B?Y2hQTjQzMHd6cHJZUE1zNk1ackJrQVFscm1Dd2c1U2MySElrR2pycXlLeHRL?=
 =?utf-8?B?SXpabFQ0cG44WXk4V0ptbFRkaHd6RlZ3MXpxeUtKUnNFU04zQTZuemR1b0Na?=
 =?utf-8?B?MXdvWlB2czRxYmh0VHgwbTNzcUFLajZqdDJjY3hKbVlaYURmWDlSd2Qrd3Bl?=
 =?utf-8?B?RXl2WEViY01OZ0RHdnFDdWx3MWV4WnVLaEtBWWtWZ0hJMDlQdDVCbEF2UGZu?=
 =?utf-8?B?aEVaT2VTTnJWSVd2R214OWhkMVpYemdLWG5yWnVRbzI2bFdWZ1hzVVo5WERS?=
 =?utf-8?B?eHllV1VwemxvYjUxN01Jekx0SHlEZU5GaVBqK3ZrLy9ZUnV5emhvdGxtbHFz?=
 =?utf-8?B?ZWZCNGpLYUhCaUtNMGFEaUR6UGtiMW8rNVI5U2dyWkhnZ1BYdmMxNFpyNUhP?=
 =?utf-8?B?RUJNb1VOenBtdXVDelllMEYzdXNvWVYvek5KakRXUUF2c3gxd2RrMndFZzZv?=
 =?utf-8?B?akJ6eUxrNnBWdE9BNHFqSHBNdnBnVVdQaVFrNFp2aUdESjJwTDlBQzlrV2xM?=
 =?utf-8?B?OXAvc2JqQzRRMk9mc050NXB5VlZJVCtHY0hzWkp5NVNoVTVXZS9CMk4zKzhx?=
 =?utf-8?B?cE9UZCsra3dzbHFlczJ0b0c2Q2FjWm93TXE1Zk9McVdldGI5VVNISUplMkd1?=
 =?utf-8?B?WWo3OHVKbE54NjBuencvRlZhKzZoRXdhUkhsUzNzeE9Jb2NiQ3dQZHBzcEF6?=
 =?utf-8?B?ZXlEWEFxTjZkb0pjT0doMHV0MG5ZVUljK1lkbmtoZGpSZmpCWjdPNlBLcWpa?=
 =?utf-8?B?YXlIWVVTYVFobUJRUkk5cXdKajcyeWIzVm5zSkpCZVR3eCtqaGU2c1daQTFQ?=
 =?utf-8?B?NVFEM3ovWVkrZ2ozSk0zYXZiVmhjaFc2VkV6eG5GNU44Q0tXQ3B1YTEvWTdO?=
 =?utf-8?B?cHdKQXpwUjFmVW5nK3BhM2YrZ2RsZXZnR0JjaGo4cmdpb2lzQUxzRGZYaUdm?=
 =?utf-8?B?Rjh1aUJvSHdmbS9BQVA0VUMzVEkvZVpjeUdkUENzME1OTWI4YWlVNTVTK3RS?=
 =?utf-8?B?aHVBTTZ3TFJFQzNmWmw4NVJHNURvUTRUcXJSMzJXcGcvc2Q4dXdsVlJWVTlH?=
 =?utf-8?B?QW41Sk10YUpEalE1YWZjd0R1ZVJJNXZEdzZzUXUvS3JuYktmRFFaT3M1ZEJ5?=
 =?utf-8?B?Z0piU0hUdGVva2MvSWF1K2JDdjVadEx4UHhyS3JJZlhxbk9aakZwUHVxcndU?=
 =?utf-8?B?YzJmL0dEaitiZ2NBYUFhTnp5WllJellqUUV1blY4cm03ZFA4Yis3SG0rZjJB?=
 =?utf-8?B?bnFmdFJzdU8rZDduYkNIK0pFcG1laGJLR3NtbjBKWUlXYXFxRDBCamphdktl?=
 =?utf-8?B?TFlJZC8ySklHZzVEQThEOG02cmlieHJyK3Vmc2xpWGVxTi9zbE5TeTl1Z2pz?=
 =?utf-8?B?NXBVaklEQWRNaExhM0RxR1QvMFpBcngwbWlISzhobGI0WXo0Y2pIbjZvd0VM?=
 =?utf-8?B?aHZlNEh2TmN1TzNlYWpxQldBWGZYeHlONENMTXo5UVNFbUt5OGpQb1puaktC?=
 =?utf-8?Q?UryeDTmYd8G/cUbIJY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVVOZ3oxbjV3SFFyUzhaU0c1Q1laRGI3QUFBdnczdDlaVFZvWUpGemt2amRY?=
 =?utf-8?B?cXRDdGR1ak1Vd3dvZDFZZDY5R1dVcWdQOXhTSUdzdTc2ZUI5VFIwUWNsallD?=
 =?utf-8?B?VGpQKzlaR3lHN01OWTFqNDlaN0hYM1VjdlhqTlBBSGpoQmdtQVJpM2prMndL?=
 =?utf-8?B?TXRWSS9tSmZrOEcwT1pCTkdIeG5GdjZxS2xuL2lPVWg3REFWK1lwRUlVQjRG?=
 =?utf-8?B?MVIvUnorbTBGbm5WYmYrRWlaQ1JSbmZ5T0NwL3JnUzFJTWdWTEt5aVo4Z2lM?=
 =?utf-8?B?aGo2UzUyNnhoOTB6NmJZRDd0bmRockNYZlNPQ0RNMmJuazdiZk54RkZ3bjE5?=
 =?utf-8?B?Y0l1SE9zMGNWY3RoOUJ1WjRvNjh5M1dWNUh2TmI1RmxYbUMySW5hbDN5b2VD?=
 =?utf-8?B?YkZwRElETmVKR0Q5WVpDVWVUUWNqTnROYkNITXowVlIra2d4S3BubVJJLzlo?=
 =?utf-8?B?NzY0cWFmMEJJVGdZZ0MvakdLeEFFTkNJbFIwMSt1dFFBU2orTmFucjU5RVd0?=
 =?utf-8?B?ZitHcnNSWkxpSVQvOUllUTJSNmd0cDhhUmFaV203K2JnbzQrMmFIUnVJMFFS?=
 =?utf-8?B?WjRKb0svdzl5eTJTT2NkVHB1cU4xNXhsOFZFQ2hOc2tyaVA4dVNkRTJ5Sk1n?=
 =?utf-8?B?NFV1d3RLQzRnZmNJNHRiaGFRd2Q3b2RtaXlYaG8vcHJHbjczbWFxZzBldjhJ?=
 =?utf-8?B?bzFzK1hsMzhmd1lGSTZYYW5WUWJNNjdOcnZNNVZKZzVZQktnMk0wS1JWSXpO?=
 =?utf-8?B?cXV0ODVla0JtcGtRUlRtVUZUOTFaV1BMQ1lsT0twVW5TVWpEOUZoVU1hZXRm?=
 =?utf-8?B?Y0tKWkVldjltOXh3QnVmSFFjM0lOSU1Kem5WV1VZbElHY25JbXdxSCt1Q0Vo?=
 =?utf-8?B?TWhpN0VSU0RUdXhydzN4SFhjcEVtUlErdVAzc0tMdzZoVXA0SkZ1czQ2bkhx?=
 =?utf-8?B?cVkwSWhJZnNVb3NzQ295REFvUzQ3SjFrYW1QNTM5cE5rdExkS282L3Z3VWIz?=
 =?utf-8?B?a2IxQThpUW9zakhGY3pCNitvTXRJdVZnSmJ4NkxHNWNPa3owbkExYXVQaWht?=
 =?utf-8?B?bXRTcnpyUDB4ZHNiY2NPVXlLWjZMckhSbEl6NFExdjVLNS9nQW1RTXZ5TjlR?=
 =?utf-8?B?dzk2S2M4ZlI2L0FxQ29XdFo3VDV5L0g5akVwZU1tUUFtYmpHWEkzK2VWMzZW?=
 =?utf-8?B?K2hvKytDWFJRTTRob1NTNjk4TmxVZ05Qd1U5ZVFYajdzZlZRNjZOR1VMME1K?=
 =?utf-8?B?cTIxdkJaK0VEeWRoVHp3NlNzQ2FBalF6cEFNRTlsR3l3eEFDdjh2aWpvdHF5?=
 =?utf-8?B?MURXK2VrZEdWVjNWdllVcVBTUXRkc01BeTZqTUgrYXkrMytHbjEySWlqZWxn?=
 =?utf-8?B?a3BXbE5LaDVpWUlVNmZHcHpUak5oSUxsMmNRVzgreGxRSUFIZ3o2RWtFaUp1?=
 =?utf-8?B?eVF1Z1Jwa01ydSthYWdQL1V3N1dmWFJJeUNCS1lQalM5Ujc0eEF5ejJkTjQ4?=
 =?utf-8?B?NXJPVTNpSHRvLzNKREVMTmszYzdvTGFHNU1qdm9PMW40ZUMyZ3pGUFMycXY0?=
 =?utf-8?B?UDBjMW9sSDZCdWNRRkdUV09mUitwWkpvWnJUbm9HQllGbnI0UVhRWEJPRVVr?=
 =?utf-8?B?bkRZWUlwY2pvazVFSmRMeHNqNTVxMVFFb25wMDdUOTFSSElJeXc0ZWhTZDNL?=
 =?utf-8?B?SVphMVVRRlJxWVlGRitBakZDenU0cm8zcGdxUVhCRWQ2WFlyQzQ3SWFuNnpO?=
 =?utf-8?B?anJPWXZpcDhKa0s0V1YweURtV2JhY240WDlHTGtyaEdjb21sd2t3MHJ1YnBj?=
 =?utf-8?B?S1Qwd2haSnlOdm5pQ2JuQkFORFIxc1BRZ3VicTVYL3pDWmF2NzFBZVBYdUVk?=
 =?utf-8?B?YUVBSzh5TGxLQm9wYlFaTE1wZkxJdWZnTWRjL05DM0xyOGgxWUwwUm4wa2tU?=
 =?utf-8?B?R2JMK2Q1d2N4dkJCOEMwckJaQXlPK1B3cmNrNlpkMVVKaWJqbjRzOUVSUUdu?=
 =?utf-8?B?Uk9qTmxHWXBGclRnT0FaaEVyR20vYnU5V3J4VnNZZWpyRjF6ME93WlVlYVcy?=
 =?utf-8?B?ZTQwd0V3c0VaUUc0Q25ORFJXVDAyblVWY2tBRmtwU3NraDNjREtKTXM3a1RO?=
 =?utf-8?Q?yOMkXykPg3FeiNBFB5YvsgxpP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ce6190-3d6e-4f86-660d-08dca251b414
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 09:04:58.0149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/+BlXQfUF90lous8i0J0RIlLkIWfnqahjbLq28s9i1lvK4ykDEftzCSOgHjoSjNKDRSCLUTc13c8705U94/ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7248

On 7/4/2024 4:55 PM, Michael S. Tsirkin wrote:

> On Thu, Jul 04, 2024 at 05:39:32PM +0900, David Stevens wrote:
>> On Wed, Jul 3, 2024 at 6:01 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>> On Wed, Jul 03, 2024 at 11:10:57AM +0800, Zhu Lingshan wrote:
>>>> This commit allows the driver to suspend the device by
>>>> introducing a new status bit SUSPEND in device_status.
>>>>
>>>> This commit also introduce a new feature bit VIRTIO_F_SUSPEND
>>>> which indicating whether the device support SUSPEND.
>>>>
>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
>>>> Signed-off-by: David Stevens <stevensd@chromium.org>
>>> Your signature would normally be last.
>>>
>>>
>>>> ---
>>>>  content.tex | 71 +++++++++++++++++++++++++++++++++++++++++++++--------
>>>>  1 file changed, 61 insertions(+), 10 deletions(-)
>>> At a high level, I think this is somewhat overspecified.
>>> Generally e.g. if driver is forbidden from accessing
>>> a field, then we do not also add specific requirements for
>>> devices - with no driver doing this, such functionality will
>>> remain untested and unused, and when we finally decide we need
>>> it it's not going to be there.
>>> Similarly for when device is not touching a field - no
>>> reason for driver not to touch it.
>>>
>>>
>>>> diff --git a/content.tex b/content.tex
>>>> index 0a62dce..8c974d3 100644
>>>> --- a/content.tex
>>>> +++ b/content.tex
>>>> @@ -36,19 +36,22 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>>>>      this bit.  For example, under Linux, drivers can be loadable modules.
>>>>    \end{note}
>>>>
>>>> -\item[FAILED (128)] Indicates that something went wrong in the guest,
>>>> -  and it has given up on the device. This could be an internal
>>>> -  error, or the driver didn't like the device for some reason, or
>>>> -  even a fatal error during device operation.
>>>> +\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
>>>> +  drive the device.
>>>>
>>>>  \item[FEATURES_OK (8)] Indicates that the driver has acknowledged all the
>>>>    features it understands, and feature negotiation is complete.
>>>>
>>>> -\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
>>>> -  drive the device.
>>>> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that the
>>>> +  device has been suspended by the driver.
>>>>
>>>>  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
>>>>    an error from which it can't recover.
>>>> +
>>>> +\item[FAILED (128)] Indicates that something went wrong in the guest,
>>>> +  and it has given up on the device. This could be an internal
>>>> +  error, or the driver didn't like the device for some reason, or
>>>> +  even a fatal error during device operation.
>>>>  \end{description}
>>>>
>>>>  The \field{device status} field starts out as 0, and is reinitialized to 0 by
>>>> @@ -60,8 +63,9 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>>>>  initialization sequence specified in
>>>>  \ref{sec:General Initialization And Device Operation / Device
>>>>  Initialization}.
>>>> -The driver MUST NOT clear a
>>>> -\field{device status} bit.  If the driver sets the FAILED bit,
>>>> +The driver MUST NOT clear a \field{device status} bit other than SUSPEND
>>>> +except when setting \field{device status} to 0 as a transport-specific way to
>>>> +initiate a reset. If the driver sets the FAILED bit,
>>>>  the driver MUST later reset the device before attempting to re-initialize.
>>>>
>>>>  The driver SHOULD NOT rely on completion of operations of a
>>>> @@ -99,10 +103,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
>>>>  \begin{description}
>>>>  \item[0 to 23, and 50 to 127] Feature bits for the specific device type
>>>>
>>>> -\item[24 to 41] Feature bits reserved for extensions to the queue and
>>>> +\item[24 to 42] Feature bits reserved for extensions to the queue and
>>>>    feature negotiation mechanisms
>>>>
>>>> -\item[42 to 49, and 128 and above] Feature bits reserved for future extensions.
>>>> +\item[43 to 49, and 128 and above] Feature bits reserved for future extensions.
>>>>  \end{description}
>>>>
>>>>  \begin{note}
>>>> @@ -629,6 +633,49 @@ \section{Device Cleanup}\label{sec:General Initialization And Device Operation /
>>>>
>>>>  Thus a driver MUST ensure a virtqueue isn't live (by device reset) before removing exposed buffers.
>>>>
>>>> +\section{Device Suspend}\label{sec:General Initialization And Device Operation / Device Suspend}
>>>> +
>>>> +When VIRTIO_F_SUSPEND is negotiated, the driver can set the
>>>> +SUSPEND bit in \field{device status} to suspend a device, and can
>>>> +clear the SUSPEND bit to resume a suspended device.
>>>> +
>>>> +\drivernormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
>>>> +
>>>> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
>>>> +
>>>> +Once the driver sets SUSPEND to \field{device status} of the device:
>>>> +\begin{itemize}
>>>> +\item The driver MUST re-read \field{device status} to verify whether the SUSPEND bit is set.
>>> If it's not set, then what? Device error, have to reset?
>>>
>>>
>>>> +\item The driver MUST NOT make any more buffers available to the device.
>>>> +\item The driver MUST NOT access any fields of any virtqueues or send notifications for any virtqueues.
>>> what are these "fields"? the area in memory where the vq lives? why is
>>> doing that a problem - you want device to be able to write something
>>> there?
>>>
>>>> +\item The driver MUST NOT access Device Configuration Space except for the field \field {device status},
>>>> +if it is implemented in the Config Space.
>>> what is "the Config Space"? device status is never in
>>> a device configuration space, it is part of the common configuration.
>>> so what exactly are you forbidding here?
>> IIUC, referring to the common configuration here wouldn't make sense.
>> The common configuration is part of the PCI transport specification,
>> so in this part of the specification it should only be referred to via
>> the "transport specific" phrasing.
> Good point.  We can easily fix this for MMIO though.
>
>  
> MMIO virtio devices provide a set of memory mapped control
> registers followed by a device-specific configuration space,
> described in the table~\ref{tab:Virtio Transport Options / Virtio Over MMIO / MMIO Device Register Layout}.
>
> ->
>
> MMIO virtio devices provide memory mapped control
> including a set of common configuration
> registers followed by a device-specific configuration space,
> described in the table~\ref{tab:Virtio Transport Options / Virtio Over MMIO / MMIO Device Register Layout}.
IMHO this may be a bit vague, PCI as a section about common configuration and a struct "struct virtio_pci_common_cfg "
listed all contents. But what does CCW/MMIO common configuration contains? Shall we add new sections for them?
>
>
>
> Less sure about CCW.
> Maybe:
>
> In addition to the basic channel commands, virtio-ccw defines a
> set of channel commands related to configuration and operation of
> virtio:
>
> \begin{lstlisting}
> #define CCW_CMD_SET_VQ 0x13
> #define CCW_CMD_VDEV_RESET 0x33
> #define CCW_CMD_SET_IND 0x43
> #define CCW_CMD_SET_CONF_IND 0x53
> #define CCW_CMD_SET_IND_ADAPTER 0x73
> #define CCW_CMD_READ_FEAT 0x12
> #define CCW_CMD_WRITE_FEAT 0x11
> #define CCW_CMD_READ_CONF 0x22
> #define CCW_CMD_WRITE_CONF 0x21
> #define CCW_CMD_WRITE_STATUS 0x31
> #define CCW_CMD_READ_VQ_CONF 0x32
> #define CCW_CMD_SET_VIRTIO_REV 0x83
> #define CCW_CMD_READ_STATUS 0x72
> \end{lstlisting}
>
> ->
>
>
> In addition to the basic channel commands, virtio-ccw defines
> channel commands related to configuration and operation of
> virtio - a set of commands to access common configuration of
> the device:
>
> \begin{lstlisting}
> #define CCW_CMD_SET_VQ 0x13
> #define CCW_CMD_VDEV_RESET 0x33
> #define CCW_CMD_SET_IND 0x43
> #define CCW_CMD_SET_CONF_IND 0x53
> #define CCW_CMD_SET_IND_ADAPTER 0x73
> #define CCW_CMD_READ_FEAT 0x12
> #define CCW_CMD_WRITE_FEAT 0x11
> #define CCW_CMD_WRITE_STATUS 0x31
> #define CCW_CMD_READ_VQ_CONF 0x32
> #define CCW_CMD_SET_VIRTIO_REV 0x83
> #define CCW_CMD_READ_STATUS 0x72
> \end{lstlisting}
>
> and additionally, two commands to access the device
> specification configuration space:
>
> \begin{lstlisting}
> #define CCW_CMD_READ_CONF 0x22
> #define CCW_CMD_WRITE_CONF 0x21
> \end{lstlisting}
>
>
> And now we have common configuration defined for all transports.
> Cornelia, WDYT?
>
>
>> This wording appears to be taken
>> from Cornelia's feedback on v5. Specifically:
>>
>>>> +\item The driver MUST NOT access Device Configuration Space.
>>> ...except for the status field, if it is part of the config space?
>> I asked for clarification [1], because Cornelia's feedback seems to
>> contradict your feedback here and on the (unfortunately unarchived) v3
>> patch. What is the definitive statement agreed upon by both editors of
>> the virtio specification as to whether or not the device status field
>> is part of the device configuration space?
>>
>> [1] https://lore.kernel.org/all/CAD=HUj4RBeLS4L=ehyPGtejeu+sGZ5j8PRtrK8AvxjEgEBd5ZA@mail.gmail.com/
>>
>> -David
> I don't know what did Cornelia mean. Cornelia?
>
