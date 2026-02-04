Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013064.outbound.protection.outlook.com [40.107.162.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03A8277C86
	for <virtio-comment@lists.linux.dev>; Wed,  4 Feb 2026 13:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770213068; cv=fail; b=oMBS7HDQa2AIOA6mmRUfmWbuLTb1nw5kNFL5s/OTJj/TbdYAqlHfdTxizJJBxbrRKlmS0b2tE4i8OO2SZWWhYhihhwzUjZiaMP00Lvl6R3rIYwxE/q1i1sFAlgPE25E+rl9QxhMRNVfHSKdTWSjKSGTfdJS4JGtY6zKJZIQ9vbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770213068; c=relaxed/simple;
	bh=rnr2z/CtxPJm9rXYNCx5rp+dKj9HE4c9MksM3I7/itA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Z5YMC94J5dVFEhI10Ms5aNkVMk420ScdxKDc+fUH+QvmW+j6JdPtwn7sEnPvBYXwmXMRUf/nXXDYASLn7JbMWB6Il/WAgYmE4MUjgXtmRDjZu/zy8UmFIicQE4+wy3zaxNi21ol5qtznIBP4aguSs1ykbS6ZboBBcnSWX2oZUcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=JrXyfO56; arc=fail smtp.client-ip=40.107.162.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="JrXyfO56"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vsc9frc84wwyMgpJ7ThJzLClBO8iatnwqJXeVuprTrPq5PWM2P7KWzxcr9qtitXueF3dPGhkGG3bhgpqDjwqkOUQjnjrxHSvjx+MkxI8cPLZ2/r9Rr7Ac0sywUt09epoESPslHOPWjZ0Tse4mF4In3BuNcQbNhPfLKY8vOtSvorSJDoYsLRZ84H2IVIiQxriTYqS+8wjMRyItauvu6yyNnAo595JS0e///VM42vFfQJ0/UjX2u1/tFXQDZICXPsU3OyxdrJWcatZ0kcnV1hhZKkZyqnOiP4DeLX5bke2TwOTEl8/nfTQL7Ra2ykES5Tx5RgEVRzXhOP/vqcpoQc57Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Uvgl/C1jSU9/eOyBDyYqk06uDuioOPd7L9rZtLb6ho=;
 b=hQqGXyXlySPWnnxBvT2OTq7Wa4yUU+dPHR+6a9e+NfTUB+1mLuClCv4tzjGHCR7w6z9VwEmbpYmPdMOJG2qQ+fRvTy85/0aFVy9uGlBkjh9jo0JLgW5Hj5DNnTX+iJZ4/tg7tOdTIMnC5tLu0vRl/w4ZZf+fYIw5ezD2yBB3dqmXELkQLFCQQDQS/lQgmgOnkl9w8BV1rqHKE+/8t2/X2b7Z0msO9IgeqHb6zF0uTzTFBF2V6WDB4wiOi0TWsjedVRfYyRp7ytAMxiCDkwzMMu2esbAykgIwhDJsFeZEY+U0YBXKr+tjQKF6OrckccuXLOLZra7IvjnxcZrP71M2WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=redhat.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Uvgl/C1jSU9/eOyBDyYqk06uDuioOPd7L9rZtLb6ho=;
 b=JrXyfO56Wk9YMIE4scl6dnu9R6BHJjALeEfhmQJJBcrPFG31FwKjzFDudXdbET67UKGov6YJ3VuFR6dCKoAv+ssZxerAnQgJZvjOUNzFUuZwFDac1HOn3225Ca5m+gaFNdlrBSvHOCDPdSZAXgcZkWwHPxS06EuHLTonnXt4heDrSXUfzEMipo67WpGlPqNMwgBCuGFqHPtxhQOenp8Ll3HNJLG25sC+t5k2O0hbd5qfggXyTRY6Stx23iUZzgDzWvwAt+MK53mv5BaXpuuLmdiiadhW+/F+bgQzbhGuAl1RlWDj4ol2hjPxbPFqOhWGh656sAMofKQPQdFqbjhPcw==
Received: from DB9PR06CA0014.eurprd06.prod.outlook.com (2603:10a6:10:1db::19)
 by PA1PR10MB9460.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:4f8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.14; Wed, 4 Feb
 2026 13:51:01 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:10:1db:cafe::e9) by DB9PR06CA0014.outlook.office365.com
 (2603:10a6:10:1db::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Wed,
 4 Feb 2026 13:50:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 13:51:00 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 14:52:47 +0100
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 14:50:59 +0100
Message-ID: <fea224bd-39e3-41b4-ab24-dfc7ebe00b3d@foss.st.com>
Date: Wed, 4 Feb 2026 14:50:58 +0100
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
To: "Michael S. Tsirkin" <mst@redhat.com>, Bill Mills <bill.mills@linaro.org>
CC: <virtio-comment@lists.linux.dev>, Bertrand Marquis
	<bertrand.marquis@arm.com>, "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <20260203081952-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <20260203081952-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885A:EE_|PA1PR10MB9460:EE_
X-MS-Office365-Filtering-Correlation-Id: b7c67f47-2f36-4631-44c1-08de63f46e17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|13003099007|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dDkya0NWaWQwVml2UUQrRDFrWk5OUWdWMVU5aUdFMFJhelNSQmVRRnNqVTV4?=
 =?utf-8?B?NktKc05RLzVqUm13WDZpZHU4UzRWckFFckxESlN5WGdXK0lNZDNUd2FTQUFv?=
 =?utf-8?B?WnFhZFd5RGpHMC9YZHZ1eC9id0dHSDB4WSszTGJVQlRXMk16K0Q2NDY1SERI?=
 =?utf-8?B?VFp6clhNekltVU4veWxrNWdqbTNjVFFoekJwaW9LOVV4aDhSeFczd1ZNbHJP?=
 =?utf-8?B?RTI3ZjdMMnV4eVhOcjJTVGc0cnVUYmdKc29YUExJSk9HRnR1SllKYU1HZjd3?=
 =?utf-8?B?K2J3TWx4Wk4wdnNSSVFjbzM4WkFkL082WCttZ2R6b2FFbm5ONlZ6V2hrTFFZ?=
 =?utf-8?B?aFBQdHRiUTJ0MlFUNUtuSFIxUG1sdlduQUFxSG5OZ0JNY0hIdENZMHJiRFFL?=
 =?utf-8?B?M3p3dWVwS2NMUithMlFLcUVEWFNZSGRVaC94YmRJN0dTakpDcy9jcEg2NGhu?=
 =?utf-8?B?WXFRdXF6YlBYSUdYM3NpdDBsckdFYmtZWnJFQUFQUk4rQ3duT0Q0TW1KSDBY?=
 =?utf-8?B?YzNXTnMvY2FkaUtxcDc3bU9HV1RrUHBFSnFuTVJQcWR4T2wyZGZKaUx2Q0po?=
 =?utf-8?B?eXdnL1FOMXg0WloxcSs2NjRQSUhhcmk3c0pwSG1xeFhsUlBBd3JnWWJxL3p4?=
 =?utf-8?B?aUxPcjJXYzlETmN3UGtVOHA5cGVKWk0vb0JCYVlNM2NsRVBTSGxhSzg2M1ZE?=
 =?utf-8?B?ZGJ2b2F4VmJwZ05yc1JZNGRpcXdTNHU1Q0NzNUZLdkZEQjJCSlFCZk43TENl?=
 =?utf-8?B?aEVYWEhMSnZLWXhwd1piTVRpR2dyN0RNWlZ5V2IxVTg1bjd5dHdiSG50R2ZL?=
 =?utf-8?B?WWhqazU3anRHeEIwa3lLV2NIRjl6R2RMK0p5R2IwWnF0aTRIYmpwUGY4dTJ2?=
 =?utf-8?B?Q2h5bkY3aTBRWTVvWWRNOTJoOCs1b05pdEdRUHBYQkJtN0ltUjJ2OVQ2Wktw?=
 =?utf-8?B?QTlJTVc3VjFvdzIxdXc3UHR1WnNYNC9lVndDVVNSQmUrMzNCdnBMblRBb0h2?=
 =?utf-8?B?THBkeTlIUWFEMm9aYnlJNzNCZ1FNVUtMb0hza0tma0Z4Mzh0cDMrc1ZKQ0Z1?=
 =?utf-8?B?WnlSbWFXaklSeUQ4andGRWlRSzdGS2liRDlWVDRRaTZZRmoxQ005OWlxTWVH?=
 =?utf-8?B?cW44dE1CS1U1Wk9EOE1VV2FkUHN5TkZmcjhmR0RtNjQ1SmRiVDMrUUR2U0Mz?=
 =?utf-8?B?Um0yQk1sRTlrakRVelRkQ05kNmNSbTZTdmJkSk82ZHhxbW1PWFo5NndVVnhZ?=
 =?utf-8?B?S0tPSlBwcFdoWXBHV253b3lTbGI2QWtEd2FaSitVQ20ycGJTcks2Vy9qOGJO?=
 =?utf-8?B?WTNhVlpTUWI0dFNkZEpqNUtZOWlEamZoMm5lMldTdHNSQ0R4Zi9vRWI0TXFH?=
 =?utf-8?B?WUJFa3puamNWelhMT3Q3Zll1S256WVRpcko4U3E1dHU4TWhEdFRyd3JlTUE4?=
 =?utf-8?B?R3dBcE5ueWdxeTFuMXZjaDlpUWdMaDRvOUd3OGxhVi84VmQrMkR6aDF6NXlV?=
 =?utf-8?B?K2J5ZFlwelA2V2x5RC9zUURnbkRudnQ4WGQ3NDBvWGx3SDRHQ1NHUld4Q1Rk?=
 =?utf-8?B?Q0hHeGZaZCtRTjVjTU1LK3B0STRKUWM0a2IxUE1odHp5MERQYWk4bnNTbkVR?=
 =?utf-8?B?WUJpVkc2Y3lVMU9LZzZXZ0xGOVpOMmdFMmR0MHFUK3JvMGdRK2IydTRZUEtO?=
 =?utf-8?B?QUMvUERzc3FQbjlMK2szZXBwbHFid1dQbjc5cC9QeG85cUdpOGRvSWlTd1Bj?=
 =?utf-8?B?eUlHckZ2Ukp1VkU2Y2s3NmxiSkZkTjRQelpSSzYxTGtxRjdRcFM2bkZiWDlx?=
 =?utf-8?B?KzV4TnE0SldrUzdQLzFBL25LUHFVT1ZVTzB0T05Sek5LMVVhRW1pSTd4UXlk?=
 =?utf-8?B?ZGVKa1o2R29kT3N5T1BpNjNTekVHY0ZjaURuVHArOFZlVGVJWnhBeFYxQ3gv?=
 =?utf-8?B?WUF6MCtUYTZUei8zeXlvV1lUSG1CMmM0L3NjcnA1cVZReFpiRkpqWmlYd0lY?=
 =?utf-8?B?NTMxSGJMUFFUQkRSNHl5QWlpbXV3MlprcFhlak9RRy81NHk0ZTFtZkZOU2to?=
 =?utf-8?B?Mmo2WnpSRjhBUnppelYvUHJnclJBdTNYU2o5bnNuUlBUSWtKR0FxalhzSEZX?=
 =?utf-8?B?TVRvY3dwL3NydHdSWURGK3U5KzdQYUxxMTNMb0ZQcmllc1lRVmZFNE5KV3N5?=
 =?utf-8?B?OUErem1USytUbGRVQzUraDl1U05rM0p5VWVEd05Nb29HS1I4YUJLUm15N2lp?=
 =?utf-8?B?WEFSNC94LzBLdFdERXlrVHVHNE9nPT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(13003099007)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yGGgIYYx1eoLxhahvccEuTmlby4MW+GYgg49qsg2eTNqgOex45iPRStoBwmFHJaevRd/get7Aj4/SlqqQwjmBY8iIekzVGqdNaYnVe7SeDBJGXqI/UJMUCpo+fv2iklgEJmkYJ4+zV+Exjk2KlVKtHwZjsfvmf6/lziDAC6k6sDGhrhGjR0EWPDr1o5/rwnkT2GF7FtnXn8jIj7QNfEKXspDfsLmMF3olEJCTtuIJWK9Tjvl3nu6NsQPAIeAxceGvs7mTgNhl8MNN2ul8IIf8x5j7/nkelNTbvGBCL7BaSXF3HJxNyCqIx29IvXLvxetRO/wCh4CADCw95KvIUwecoWty4OOFxNA1uAMVI0ykWML7PtdHrXn6ckSjOYxa+IKKwAUUX+jAA1YEyDofBmbE/25TLEc2a5HKcug5w7qb8ENa5VyB5kF9Q+z0MOaNv7V
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 13:51:00.2291
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7c67f47-2f36-4631-44c1-08de63f46e17
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB9460

Hello,


On 2/3/26 14:21, Michael S. Tsirkin wrote:
> On Mon, Jan 26, 2026 at 11:32:26AM -0500, Bill Mills wrote:
>> This series adds the virtio-msg transport layer.
>>
>> The individuals and organizations involved in this effort have had difficulty in
>> using the existing virtio-transports in various situations and desire to add one
>> more transport that performs its transport layer operations by sending and
>> receiving messages.
> 
> Is it arm and linaro, or more?
> If more, could we get some acks on list from the people involved?


STMicroelectronics is also interested in this transport.

I have already my signed off on patch 2/4. For the rest of the series:

Acked-by: Arnaud Pouliquen arnaud.pouliquen@foss.st.com

Thanks,
Arnaud

> 
> 
>> Implementations of virtio-msg will normally be done in multiple layers:
>> * common / device level
>> * bus level
>>
>> The common / device level defines the messages exchanged between the driver
>> and a device. This common part should lead to a common driver holding most
>> of the virtio specifics and can be shared by all virtio-msg bus implementations.
>> The kernel implementation in [3] shows this separation. As with other transport
>> layers, virtio-msg should not require modifications to existing virtio device
>> implementations (virtio-net, virtio-blk etc). The common / device level is the
>> main focus of this version of the patch series.
>>
>> The virtio-msg bus level implements the normal things a bus defines
>> (enumeration, dma operations, etc) but also implements the message send and
>> receive operations. A number of bus implementations are envisioned,
>> some of which will be reusable and general purpose. Other bus implementations
>> might be unique to a given situation, for example only used by a PCIe card
>> and its driver.
>>
>> The standard bus messages are an effort to avoid different bus implementations
>> doing the same thing in different ways for no good reason. However the
>> different environments will require different things. Instead of trying to
>> anticipate all needs and provide something very abstract, we think
>> implementation specific messages will be needed at the bus level. Over time,
>> if we see similar messages across multiple bus implementations, we will move to
>> standardize a bus level message for that.
>>
>> We are working on a few reusable bus implementations:
>>
>> * virtio-msg-ffa based on Arm FF-A interface for use between:
>>    * normal world and secure world
>>    * host and VM or VM to VM
>>    * Can be used w/ or with out a hypervisor
>>    * Any Hypervisor that implements FF-A can be used
>>    * We have this working with pKVM and Xen
>>    * We have this working with Trusty and OP-TEE
>>
>> * virtio-msg-amp for use between heterogenous systems
>>    * The main processors and its co-processors on an AMP SOC
>>    * Two or more systems connected via PCIe
>>    * Minimal requirements: bi-directional interrupts and
>>      at least one shared memory area
>>    * hvac-demo has 2 demos of this
>>    * This is working on two hardware platforms
>>
>> * virtio-msg-loopback for userspace implemented devices
>>    * Allows user space to provide devices to its own kernel
>>    * This is similar to fuse, cuse or loopback block devices but for virtio
>>    * hvac-demo has a demo
>>
>> We also anticipate a few more:
>>
>> * virtio-msg-xen specific to Xen
>>    * Usable on any Xen system (including x86 where FF-A does not exist)
>>    * Using Xen events and page grants
>>
>> * virtio-msg over admin virtqueues
>>    * This allows any virtio-pci device that supports admin virtqueues to also
>>      support a virtio-msg bus that supports sub devices
>>    * [We are looking for collaborators for this work]
>>
>> Changes since RFC2:
>>
>> Spec Functional:
>> * Made the common message header 8 bytes and added a token for optional use
>>    when parallel outstanding requests are possible
>> * Made the 8 byte fields align to 8 byte offsets.
>>    This effects the {SET,GET}_VQUEUE messages
>> * Many conformance cases have been tightened.
>>
>> Spec Editorial:
>> * Major restructure to better align with virtio spec
>>    * Conformance model now matches other transports
>>    * Use C structures to define messages instead of tables
>> * Added a section to describe how responses are matched to requests
>>    This includes the use of the new token field
>> * Redefined / better described error handling between transport and bus
>>    layers to eliminate the need for the bus to generate fake response messages
>> * Included editorial feedback from RFC2
>>
>> Eco-system:
>> * Added virtio-msg-loopback demo
>> * Arm has published the first draft of the virtio-msg over FFA spec [6]
>> * virtio-msg over FFA has been demonstrated with both Trusty and OP-TEE
>>    secure world
>> * LKML RFC has been sent [7]
>> * QEMU RFC has been sent [8]
>>
>> This is the first non-RFC patch series. The known short comings have been
>> addressed. We ask for review in earnest on this series and thank you for
>> any feedback you can provide.
>>
>> Background info and work in progress implementations:
>> * HVAC project page with intro slides [1]
>> * HVAC demo repo w/ instructions in README.md [2]
>> * Kernel w/ virtio-msg common level and ffa support [3]
>> * QEMU w/ support for one form of virtio-msg-amp [4]
>> * Portable RTOS library w/ one form of virtio-msg-amp [5]
>>
>> In addition to the QEMU system based demos in the hvac-demo repo, we also have
>> two hardware systems running:
>> * AMD x86 + AMD Arm Versal connected via PCIe
>> * ST STM32MP157 A7 Linux using virtio-i2c provided by M4 Zephyr
>>
>> Please note that although the demos work, a few have not been aligned
>> with this version of the spec.
>>
>> [1] https://linaro.atlassian.net/wiki/spaces/HVAC/overview
>> [2] https://github.com/wmamills/hvac-demo
>> [3] https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git/log/?h=virtio/msg
>> [4] https://github.com/edgarigl/qemu/commits/edgar/virtio-msg-rfc/
>> [5] https://github.com/arnopo/open-amp/commits/virtio-msg/
>> [6] https://documentation-service.arm.com/static/68f647791134f773ab3f0a7c
>> [7] https://lore.kernel.org/all/cover.1753865268.git.viresh.kumar@linaro.org/
>> [8] https://mail.gnu.org/archive/html/qemu-devel/2025-10/msg07438.html
>>
>> Bertrand Marquis (2):
>>    virtio-msg: add new command for bus normative
>>    virtio-msg: add conformance entries in conformance chapter
>>
>> Bill Mills (2):
>>    virtio-msg: Add virtio-msg, a message based virtio transport layer
>>    virtio-msg: link virtio-msg content
>>
>>   commands.tex      |    3 +-
>>   conformance.tex   |  105 ++-
>>   content.tex       |    1 +
>>   transport-msg.tex | 1640 +++++++++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 1746 insertions(+), 3 deletions(-)
>>   create mode 100644 transport-msg.tex
>>
>> -- 
>> 2.34.1
>>
> 

