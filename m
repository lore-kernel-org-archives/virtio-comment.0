Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011009.outbound.protection.outlook.com [52.101.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D994C9010
	for <virtio-comment@lists.linux.dev>; Thu, 27 Aug 2026 18:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787856671; cv=fail; b=VrUmrKOJnK354jDKp7uL7Gmua+NOtK9j9F2WcXvH8IUSVUrwjS76H1lcc4PRgD9hFgWdYmlKKCljpi03WF+GbNYF7OOmIm7tQMTb10qMfjBwEOLSRbmA5vfXVWbvruci0SjAE6sgdHlobEcm+nw4BKSFxuE+h9VjakQqdbg4Bw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787856671; c=relaxed/simple;
	bh=o249fRmdQyvrAHeRRW7esrXXZo07x4RXFJnEAd/BLLs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nHG8NKkB4FdLJ+DdPcm+JbPi4/f5m3zykZCv/OpZIkVV19wpT8gPKFtJQvPWHao8S2s/1Ohd4VZKWfviNrBZ0ufWEo5xko/i/euD00lrhyIehXSfhUOCiWksqX0TkV5v1vxMV/wrveRxShCYBnoPIhwn0DFylSplQgW8P2dFjJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=FWE78NmK; arc=fail smtp.client-ip=52.101.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="FWE78NmK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fhgq91WnfmA2oC+ynh31MisLpHLs0/An1FN7J6qyI1vxXG12MfndJPQMf4NOvALQ2P9AYHgO8pZ0e+xQrADmha3EGdHv/nNGGfR9n5KC87v2wSHlJYkUEjvCBs3gnQev0cyqBDk1bjdCahMlhoWXn0QsY1d7z2J7s7bkbwWykGsI+6eLehtpH9gk0zK+eioJqzacocsWohigNkFfV7tRCHTcHKA8PWozycR5HstFlhBPDzvR6QGr1y4hLhG5aj75pm30kwsp5QVPhKrbrnUJnBxOwIJEiW4ICKPOkJ1IORCCRjXJZBDrTz8ymiqzPvB8J8i86xXVwAqKjlnwL7LLpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHcTTVGqSlXT/LPhENZ5VNHYbcT6D5QWBUClmtJ80yE=;
 b=bTrsNPbxL3wDI3pkN2YX5wGEL5TrC28zD7o3RPsh0808dy1UTrHfj83QH5VIpkElWzP9koFGSEqxp9k+zakupM1DpI3jj1A46jAnDv/Q59M+IeSUbt3jmrDpLRKeOCBNqzj+sMEGuV4HkOI6zth8WBSLMbuz61JuSpWoUmqi+qC9bO0ftQL8klj5sh6OpT87tYGFycjPGHfqGLtY8DhxbpTLZxgeOkBQKgnJW4u6TShbKZc5Ssqdjx+/VO3X6Tw9S1BPqWeLXNRIKgi2Y7T7EDM/TJoCAq6GhS2xKYLV/nu1cPO1tsCHmzOfQbVocltgOzrRMaAnO5gjAfRuZ+gTTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHcTTVGqSlXT/LPhENZ5VNHYbcT6D5QWBUClmtJ80yE=;
 b=FWE78NmKsju35KT4A4sai1SXPuxmap+Ornd/XO9OmsCP/F77OP0eoIz1m+hwy7pmP1WhMMmNlw4moAQ2igQrwwrc02HLK76pAyVchAAUtcqZEayVAmeTsilc7oEqW1c5Ji++0Xw53mcsDXYAm4wHC2r/m1UdGe1UzSBgqjXi8Mjeo+qj1D4Kmuc418QR0ibXAHcsWk5cfZNJKh+p7l1oJMQV9OTUBfKp2QEioWXNsk7Pc8vkf/GH8NrcAp2YG0JgZbHOGA5aIPMrQDnkoJ0RtxhgqJsr13zp75aGTIinFkUGe3ZnmjTrl5CemTibaL3WA+rf7gzIzOtbWyZU3QQN3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by DB9PR10MB6377.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3df::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 18:51:06 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::be9f:e8ca:ee9:83e1]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::be9f:e8ca:ee9:83e1%2]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 18:51:06 +0000
Message-ID: <78ffb169-e9ce-44f2-b18c-6311354fab3c@siemens.com>
Date: Thu, 27 Aug 2026 20:51:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] content: Reserve ID 52 for Snapdragon device
To: Peter Hilber <peter.hilber@oss.qualcomm.com>
Cc: virtio-comment@lists.linux.dev, Trilok Soni <trilok.soni@oss.qualcomm.com>
References: <20260826115504.1955-1-peter.hilber@oss.qualcomm.com>
 <1982f2c0-9dad-43b2-94ce-31d03d6a36e5@siemens.com>
 <cptr5hczrpslq7wtrbd2pfbz247k2e3b6rvali2foaueeanymr@n6xtsyl4lq6m>
From: Jan Kiszka <jan.kiszka@siemens.com>
Content-Language: en-US
Autocrypt: addr=jan.kiszka@siemens.com; keydata=
 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
In-Reply-To: <cptr5hczrpslq7wtrbd2pfbz247k2e3b6rvali2foaueeanymr@n6xtsyl4lq6m>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0327.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::11) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|DB9PR10MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: 2501e710-20de-4e98-fc6a-08df046c26d0
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|55112099003|22082099003|18002099003|11063799006|56012099006|4143699003|3023799007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	fsxLYttosUZmnfR0xMNHhHOOG1ENu5kE8+dOp0ecrwxYDgqr/n9gSUmL0UZXPcyOey/tImm8ERLS8MNQuOHIvJC0I1OGoOKIk0CPk9XYybRJV2/b5KRSh+B6uMQ+PYm7GQFJ7p3z8yIlybHKu7yY+xcDrA8VPq8DFwMLFqePcYGNyG0zIbJWy74VSA5Pazu5qhoyVJYldZynl81M70M8R2wTQHG/HMt/TNhT24cpAC3EzwQqQ+iInubdUA1C+FzJvQZpRHQj0wavHtim4afG7Sms+2nvyaywMrJv+UiTNLGNGi5OToCxJoUQrF0HP+cRjQS9yFrxL+1lbSQBa5tkT+OXa23gwTJCIqIa5Rpd+OOfoshKr8jJo6Iz1X0oOn6e+djtCw3d8EOTMiY+QQfu6uQATvqWFSnv4jUU1NoAL8sdV88Av1DnuxkGhlUNeq0NvD7Ehvj+K6Q1OsgBb3A9X/F7DoZlEBVBYLzetXIJhlUhgiBy9Y3mZ+Jjpn5yigoHXpV6x78t06RTFd+NDCjgmdl1SiBC9P8XZ2WHg0fuyQ/fkLY7yXB6FP3bxnAH/SZBjsQlGiObVe8eZgm/kyqhPF26DVZvgs08eK3JwIe3bTz4+6CPMoekUvnTHbyQMThPwOOLQpNqM3U7wGFONboRRWuujGzH+VessMx+NM1MKyM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(55112099003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(3023799007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFFWLzU4cVNjNmNDRDNOaTloK3BPNFNFKzNuUldjT2N1NFgyaFFrUFVVa2Er?=
 =?utf-8?B?cUhSTTJ5allSUjhkcFNQaGNpRFhEMDVsN1FFZjZMRDdEbFEwdWlPcEwwVFB6?=
 =?utf-8?B?NXRaOFhvanlMZ082KzZtd0lFMC8rL29Jd0pPRU9QMkJZd1licEpMMzRBVVZR?=
 =?utf-8?B?VFNCdW1hZVJ3Z2xTbkFGeHRQRjFFL0p0bWd0czcrL0ljQTZ5MkxPTVFidWhm?=
 =?utf-8?B?ditjT1UvVlBpV3NmZ0lTMHB1N1Z0SjRhMVZyd0NMc0krNU14REFqWTRVcnlE?=
 =?utf-8?B?eVlNMmxFdEpZUUZWRG5McXBlQkwwN1lvQVFPNFdXeFZyZlJoV1FvRzhxN0Yw?=
 =?utf-8?B?WDFiTE95S21QcUZYWnJVOU8zNUREaUdmNzdZMTVBL0U0M2c0NGpZcXNuZlc0?=
 =?utf-8?B?UC9uaG9WQjRDd1hXK3JFdVEvSnFFR3ZOVlVuSnJPVkJyVWhQeFBkalF1Yjg1?=
 =?utf-8?B?bWp6RkhQd2l4YURkY04rUjhQOVpDRHBlTWJxTlZscjBhSG1UUlpFRkhPTjRF?=
 =?utf-8?B?Nm1sK0dOQ1JodHNPc082MmJYUEtTVnUxN0lsbHM0V2FuRVoveTl0V0JKTVFI?=
 =?utf-8?B?SGUvZTZSQVVnZnNLaFdVblE3bjliYVhVVUNGa2VYcWRBbm5wb3lPV3UzYWFv?=
 =?utf-8?B?aUJsZ1grM0Ftd1VPYUN0TjdXQ2NNaXNJZENybml5ajNUTVp5K2t1cGphaEY0?=
 =?utf-8?B?YWJ3aENodFBVYTdNYUlIOU13cHJYalFhK2JwUW1jMzFXY1BzQXl4dzRPVWtC?=
 =?utf-8?B?QmJXN01jYWppSGNqZVlZZnA1ODkwSzRkT2F1Q0VPYTl2L25BTFNsWmlhQjQy?=
 =?utf-8?B?L0RBSWFkaEJjTFZxV01leVgyc3o1RWZGVXBqTjM1TkltNUNXVkw0Yll1UkMw?=
 =?utf-8?B?M3hPNHNEbDNpcnBJTXR1WU9oRzRGNFgvOCtvQUErYUc4NGplQkYzMXJib2tu?=
 =?utf-8?B?bEU4b001R1l3NUxQWjdWZWxwOE1GNGZvQisyZ3h2OUhXWEsvZUhGbENhZWtT?=
 =?utf-8?B?R1pscHp4YVg5ZXNPZlNvL3I3a05iRUMzemNKdGJUUTNmb1BYa1QreUVaR3dt?=
 =?utf-8?B?RlAyZjVibm42SXdSa3pCNjZGOE50NkM3ekJESFNQazV2bDhFaEowYnhpOW94?=
 =?utf-8?B?TXlwNUUwNTM2NTViQzF6NjZ6M3JBVUpLcjN2bm44djJhTFdJZ0tnNTBuMGx1?=
 =?utf-8?B?V056dExrdG03RnlSd1l5aTlnd3ZPS0VvRklZZVA4d0xiNks0Vk0wV2dHeHF4?=
 =?utf-8?B?QmRGbWJGWEE1eVY4dkw2V2pwWTA0Zkgyb1ZTOG4wTDE0cVAzaWVHWTBLL0t1?=
 =?utf-8?B?RHVjdU1oWVo4WmZuMWxXcDhzTHhmRHhzbDNMZSt2eEZRamxTeFVPbFZYQy9E?=
 =?utf-8?B?QjRsSkFlbUhvK0JCQjVoYUc4SzYzcTk3SUtJMUQ0VzJjMWpnTlpKMlA2cTZr?=
 =?utf-8?B?SzE1T1lBZ0N2eFg0Q3hJVkhJUklqejl6TTVBSjNHdGtNNm5IUnNqQk1pWCs4?=
 =?utf-8?B?ak0ydlNlZUc1d1krRTFkQlJkMmFERXBUaVBuanppcVZQSGlqWDZWRC9qZGV0?=
 =?utf-8?B?QmRGQ1VmQ0kzRHRCNWVidkZHbmh1dVUzREx1Z0ZlaDJWQkh1R2o2b2JnWXRK?=
 =?utf-8?B?YzFmeUlBTWRxenJVVlVNbzE5MHpoNWpaeHR6dkgzK0dWN1FZSkV6WkpmUGdC?=
 =?utf-8?B?bmQ3MkhuWGQwM3FlTm9PL3prT2FRdFAxVUg1MHZFczFtTWdQWXplVWNheFJ2?=
 =?utf-8?B?ZHgyaDR2ZE5tZG1LcVk3c1poMml1amJuNW4zelZSdm91QmRvdnFXa2dkZVFs?=
 =?utf-8?B?TDNLNnNwbTVjMjJ1Ym8rQkloVnlsK25DMExPWjYxeFJnMjNzZ2JjZkhTTmhV?=
 =?utf-8?B?blVEd0lGcDN3OXcxVDBZcDNlaXUxVkRoSjErbXlhYTAvUFVqL2pINm94RVFZ?=
 =?utf-8?B?RDVpdk5TNW5QYTBCQ3pvNm1NR1F1VGVUdStvTUVIeCtadFVqYVovT0wrcTJ5?=
 =?utf-8?B?cUlvU3hhcWo5b3dxSzBVRkdNd0pNd3FkeXJWMFRQb1FDUGEvVk9FQmlhV01J?=
 =?utf-8?B?aEl1WER4cGVWcGFEcitXcnlmZzd4MStCY0tYUTJZSE1JUzc4dHBJejhaRWpW?=
 =?utf-8?B?a3hFcEZjNmpWakFtcFZYOVlvRHZRU1EzbVl2MTVCTnpMaVB6NFpCSzBBZGJN?=
 =?utf-8?B?NlMzZHNoRWN3RXNwQnpRdHpEOHZ1TjlPdzJpaFYxZUJyNURHR255SFZpem1G?=
 =?utf-8?B?d1kzOE5mbGRpdlRjWHNKUFRJWS9YOFRJTWZjQ2U5ZFR0b3NpWDA5TUdnRW9U?=
 =?utf-8?B?S3d6dUJCcDY0eUIrZDhIN3lhejBkRnFGVkd5TFVGc3ZtOHR1UHp0Zz09?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2501e710-20de-4e98-fc6a-08df046c26d0
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 18:51:06.5379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ibheZKvRaZsa738r5jduXapWc3s23xqKMygqMik8FjSFX9R4URH2TTnf71YWtZNZdjVL5TYa7N3KhfHglvgsBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6377

On 27.08.26 18:17, Peter Hilber wrote:
> On Wed, Aug 26, 2026 at 05:31:54PM +0200, Jan Kiszka wrote:
>> On 26.08.26 13:55, Peter Hilber wrote:
>>> Reserve a device ID for the Snapdragon device.  A Virtio Snapdragon
>>> device exposes functionality across Snapdragon SoC subsystems through a
>>> common Virtio-based protocol.
>>>
>>
>> Virtio is supposed to provide generic hardware models, not so much a
>> channel to expose concrete, physical chip IP over it. This looks very
>> weird to me.
> 
> The Snapdragon device is not planned to undergo standardization, so it
> should be acceptable as argued by Stefan.  Qualcomm has some Linux
> kernel Virtio drivers which are intended for upstreaming, and as such
> need a reserved device ID.
> 

Thanks for confirming.

But I'm personally not convinced that this is a pattern the virtio
specification should support, even if we had plenty of free space. It is
one thing to reserve an ID for a conceptually hardware-agnostic device
type where there is at least the possibility to standardize this one
day. But doing that for a single-vendor hardware which is likely not to
survive very long (seen that way too often...), this just seems wrong.

Jan

-- 
Siemens AG, Foundational Technologies
Linux Expert Center
