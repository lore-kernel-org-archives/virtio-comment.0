Received: from refb02.tmes.trendmicro.eu (refb02.tmes.trendmicro.eu [18.185.115.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA438175E
	for <virtio-comment@lists.linux.dev>; Thu, 20 Jun 2024 12:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718885189; cv=fail; b=n8MDz00vie4+PCLYDo9tSBvGfQzCNo1BRLDFHCtIDdUbyiX5OJVqipb0KtVrXsfJz1XjpxJmpSRl6QZVIlchFl5C9yMdw/dbDWYQs2oZVdi7/HEKUOA4Y2N7lrWQFX287ik3d5/ZcHSYyFj5PGjJJRIYUXXrnywQ5Kp3H3U218c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718885189; c=relaxed/simple;
	bh=MeFmDMnHGdXmPDyIKfueuW7zzEPgQFZ60uHyr99k2gw=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tK8xnMevuuOD9Ie/NU/r8ONDaFLXjXosO5Pu2cfLhn4e6Z1lQUKqy9uqMISdn+1//M/DTiOLPdBgOFgdQv6bkxrRZ3wVwCpaqt0BPt5/16/+uq2FL3T5bCkfoiUKk61/6XqauvVVspHxjeuvi318Kc1/CgzOVqQqjg+VfThrJHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=EignmgNe; arc=fail smtp.client-ip=18.185.115.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="EignmgNe"
Received: from 104.47.11.169_.trendmicro.com (unknown [172.21.9.43])
	by refb02.tmes.trendmicro.eu (Postfix) with ESMTPS id AD2811006110B
	for <virtio-comment@lists.linux.dev>; Thu, 20 Jun 2024 11:56:56 +0000 (UTC)
Received: from 104.47.11.169_.trendmicro.com (unknown [172.21.197.65])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id CFD3A10000E1E;
	Thu, 20 Jun 2024 11:56:48 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1718884608.460000
X-TM-MAIL-UUID: 18df0684-49fb-4833-862b-b643199c4fa9
Received: from DEU01-FR2-obe.outbound.protection.outlook.com (unknown [104.47.11.169])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 70787100058D7;
	Thu, 20 Jun 2024 11:56:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CfkI0znz/Pthdm1EmBi8dSlQFv4+hu0VBZNimhWKp+PUEwWqZK2lNSZOK0Fuo1YbSWfvkFLznA045kyniwVn8p2mCeVFt9Emz1CpZWnyhnrgukZFHFe64DqlA/Ou/biDsXhy5fzySIPeJsrv66zeAnumTCy+YT/WMY7Yy88Tnxe4qYlRuw29CL8KBQwYkGoQagTMY+7XDBfIYYeQxVyFH6iRZd7xXcxKuniAh+GbaYArrKv2cUjhbSiXOGdsjtjMSxXeb/ieDGY8jAubMBhlHnuK84svqXkucEtibe6olu5j44pIqXOLIZvxvugxlr3Vb2WLD2Qj+cGMFZOOoeS11w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WS68B/799EHOA2Wxr3z7d9Yqf7ua9iYreR9ANo71X0=;
 b=NUKruHvizK9Tb1mz2gQh4KDabzDzMHhpJqDfYt+guygdR/saWr+1djqxm70UhwEqQoCSfncwgTbwqObYD8sp2BJEN5acshnRTifyAXPMT4IX0pVryQVjgQVJGR/Cbd7EQGXY9NEGxH+rVC11IUsts2mDpNiby42F14DetrIOO/9HzJBgMLpbCXRCgsyGzy3MKV1J2yxPFjxoxDOqRpmujMLnYhKMuUd1duKtqusy9d1y1gdnKNLDXHIL5WjxnCMrb9RSfCn/8l4nJFomgdyGwM8SjOSEs7JqjOgIcj5h7xe84sgs+Vuj2boRQ26Bq2wqIrXNWu5IVofhEfZgliCHeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <b2ea6f21-8efd-46af-a6fa-2a8ced2a4a43@opensynergy.com>
Date: Thu, 20 Jun 2024 13:56:45 +0200
From: Peter Hilber <peter.hilber@opensynergy.com>
Subject: Re: [RFC PATCH v4 0/5] virtio-rtc: Add device specification
To: David Woodhouse <dwmw2@infradead.org>, virtio-comment@lists.linux.dev
Cc: Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>,
 Jason Wang <jasowang@redhat.com>, "Ridoux, Julien" <ridouxj@amazon.com>
References: <20240522170003.52565-1-peter.hilber@opensynergy.com>
 <b4b198baa16b492a1273131e80d3f80a08835b79.camel@infradead.org>
 <46843279-58cb-4ac0-a50b-998ecfcc2c30@opensynergy.com>
 <019bc484576f978a0b8a2eb62c56abf27bfe730d.camel@infradead.org>
 <55b0e4a7-7d79-40ce-a47b-32b457f1ab97@opensynergy.com>
 <0944adfdfb5f0231325db79ec41dca0a13639af5.camel@infradead.org>
Content-Language: en-US
In-Reply-To: <0944adfdfb5f0231325db79ec41dca0a13639af5.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7c::15) To BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:3d::8)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB1906:EE_|BE1P281MB3137:EE_
X-MS-Office365-Filtering-Correlation-Id: 400b52dc-917c-4cc5-3d5f-08dc91200fb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|376011|366013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWN5cmRuRUtMQlVzUWZCTVpYQzEwaDVmU1RGNEZsZXhGQm5mbzNCVFZFTmRC?=
 =?utf-8?B?bVN6bDFVK1pUTmcxeUw4dm9sS1JkdUQxVk55ckdwdmpsTkRzNE95Y3V1WG5j?=
 =?utf-8?B?WUpmWlBud3dSQ1V6Z1RycVgwQ1RwOStrZlZnMEVpS0hXT2h0Rkpwc3NkMHkz?=
 =?utf-8?B?aEJCZFc4aHA3MVRiMVBLajArZDFnRGpWaXpPRmhsbkdHZmx4ZDM5UVM4dloz?=
 =?utf-8?B?NWhrUlJlVkVOSzZNQTFaYzBTRFJWUU42Tzh0N1BMY29lblpPTFBHbHp0bjRt?=
 =?utf-8?B?OFdiODZTbGVjRlIzamxlbFJnblIzU1E2YTJLSWg5dEw4TTBlMlcrU0xGbFZr?=
 =?utf-8?B?WGR2ZTVmeW5vWDZVbnNtdjJxQmo1Z2t4dzZFVEdmNHRDVmpmN0dERk9Pemlh?=
 =?utf-8?B?UlBoNmJkVFVuL09jQmZhUzZZUzNyeXJCeUcwVVZYdG9yeUcxRFlZRHlUQlVj?=
 =?utf-8?B?RTRQTzhiNmNiVm4zbjltTkgwaGUxMmgxT245eXFJNzd1cVFOejFncUJCZ1lM?=
 =?utf-8?B?OUlrVlcxejk0MEorY1NUZEk3QWFqNzAydmxWOGlEMlkvWjFLT09Id21FRkVF?=
 =?utf-8?B?OW9CYXFlWDd6M08xcEtUS3BtVTZEejJmODNBNmlFcEp6WDIxcFZISm1iM3kz?=
 =?utf-8?B?WFVXRWJtaFA1UHhvZXhpbFo1bUlkSDY5Q1U0VEpseDZaMWJpdnpUU0RCRHlT?=
 =?utf-8?B?cXY2Q3JuN1ArVGNibE1jRTdPQ2UzMXdrRHMzRXp1Z0FZN09yMVRuYXpjZUpJ?=
 =?utf-8?B?dDNZUndrTS9jKzJVUG1tVnR2Sm50NTNJRzVlQUhubVQ0anRDV0FVaWQ3SW9m?=
 =?utf-8?B?UHR4bkUrWUloNkNXU0ppL3V5bDVlNEVYM1hpOEZNZ0xZQjZ3K2c1emxyOTVJ?=
 =?utf-8?B?Qk9zNjJaNXNyRTA5aEtlNjJJelExVzNsUGxVY3NFa0JTWnRHWWt4cmhJODlP?=
 =?utf-8?B?clVNb1hJcmo4RUhWU2YrajZGMDY3Q1ZnUzYyaEIwMXZidVpBSWJRSnRSTVdE?=
 =?utf-8?B?S2RUTUFxazNtRGFqSGIzRkhsZms0a3ZxNVh2S080S20rQTNyZmh1WEhjOW9D?=
 =?utf-8?B?eGdaeEErR01Za0tDL1F3QUFZQ2RVa1YyQ1JISDY5dFl3ZFFBU0RDUzNGMk9p?=
 =?utf-8?B?MGFkOHFmSDF6enBWUDIxRm02T21wQTZaOTZJNGMwUm5JMzY1WTlsQS9aaFZF?=
 =?utf-8?B?Q3diWTU2USsvbm0yc1NrVkFmRkR6WnpKMUVPRGhCLy9OcEZoczNpaFJrUVc5?=
 =?utf-8?B?dWdlZDRZUUErKy91cEZ4cm1TcDdmdUVBakVJSlRKc0dBdkl5bTFvbVRxYmRt?=
 =?utf-8?B?OThtTjdWREMzQjh6Y1ZpOHZYa0paWTZVVlp1SkgxZ1BtaGt4RTlJbkpVbEdq?=
 =?utf-8?B?dDMwQXo4WXQ2L3hTUVlpQ05zZ1FxUGVHcW82bFU2eFY5ckZFaTh1TXMzb0o1?=
 =?utf-8?B?Mi8zakxxVjB4dE1uVW5hZDdmSEV3Sm10ZlBnYmRUVVNwUmJZOFNKL1dVQnRB?=
 =?utf-8?B?ejBqd0x2TkwramF3NVg4TnVrZ1FlMVBMeDNrWTBhNU9jeU1XOWxGUTVaNmpD?=
 =?utf-8?B?eVBBbzBMU2tPWkNwMit5WlRXMmIwYWluMktxZzdERWhSVU04cGtGOFNJaVpr?=
 =?utf-8?B?ekdVYWhqV1JDRVNndUp5d3hzTERBQkZRYXJjZmpDRkt4aEhPTlpPYmJleGdl?=
 =?utf-8?B?QUYvOXE3c0JLelEyZE5rUzByZkhlQjdBb0tUc3VsOWFrTXdJb1RVL2k1dXB5?=
 =?utf-8?Q?0L1S7+olgf1pwJhBmg0pXBRdlWoQDHa2WqH8SWc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(376011)(366013);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXNhaHVpdTRhcG9DNU5QWk5PWmh0VC91YTJXNVNWcWhtTm8rT2VSMHJRcVZi?=
 =?utf-8?B?NDlmU2hmQUtMcC85S3VpZ2syQk1pbDdreVlud2o5UTMwaGdZS1B3OWVOVDE1?=
 =?utf-8?B?ejhLMUZYZ2IzQ0IzK1IxUC9zRS9lYWtvaEtzQkoxdEJiOFRobU9qcFRTNmZB?=
 =?utf-8?B?R0o0djA2ZWF2djBSNnd6UG4yVkZkQ1RtSmRvWksyRzc2ejN4RzhxOG5pYndi?=
 =?utf-8?B?K2R2dHFsTXROT000SWR6MVJ1bzlCM1JzVG1rTUNjUzFCQzdWYlBWdDBVcitt?=
 =?utf-8?B?SlVIVVh0b0tNeHdTUnVrRFpicUkwMWRnRHRNdHBES1U2RE1sbElodS9tekdG?=
 =?utf-8?B?cDF2cXBUUE8rdUIrcGF5d0tRWEdqYmF6U2pFdC9QN2NvWkJEczg4R0xUUGZw?=
 =?utf-8?B?V2MyMUNjZkpMU0NMeW1rNzQyVG5WWWRyd2R6WUhCQlY5M1VGYlNqb3ZzaGpu?=
 =?utf-8?B?eEVmdjhHRUR3d08reHpLbUxGZXlsaVgyZmc0a08zTzlHN3YrSHpYS3lNWm81?=
 =?utf-8?B?T1cxcDRHOXZUSXhnc3lSTFJSaUtnQXF5cTA0dnVLcmg4ZnlQYkRQTzkxMXha?=
 =?utf-8?B?eExSRFRmbVhheFJlc3pRcHowakljM2kzZkFmRkp3MXFFMFVha0lxSk1jRmRx?=
 =?utf-8?B?RDRmVnJWZzhaczVTdmlmMmxKemdjV09uL2swSnZSWHJtVmt2Q1BOYjFQTGNm?=
 =?utf-8?B?d2JVN1BibVRIdGh0Z2ZRV2VVZHFsaW9HT2dLcFk5YTg1SlpwMUY0emNDQnU2?=
 =?utf-8?B?ckRpSmRoTHNjVE5qckI5V2wyMDl6WVl6alBDejQxTzlUY3BPRE05K1ZrUlJD?=
 =?utf-8?B?R1F4WVBnK0I4ZTQ3azdwRXRkREhPOFUxOWdHMVdIa0J4eDNSYnVpOHJDVW9j?=
 =?utf-8?B?a3VnaitYWFBuU2Q1MUFaQ1lUUGJWM1I4UzI0U3VmcUNSZ1IyQWdmMUZEY2ZN?=
 =?utf-8?B?SXFqdzNsTzhySm56QVRQY0U3cWJmeTFVVlFaY2lpSHJiRXJaa0VqN2lXKzZx?=
 =?utf-8?B?enBBRFBzK3RTbUZVdmRhOHJScTJoU1JRd1JoMkllOUk2WGFhMERnY1hydklS?=
 =?utf-8?B?MlpDVlFJRm9TYUtERXkzdmwvMW5DNkNORFJHV1RsQUQyUTR1YTlCUGdXYmQ0?=
 =?utf-8?B?VjU1cUhqYjVWbHc4NEJPRXN3RmFZczVsY05rbjVjanNtWGtmSHcxZk5tVzhw?=
 =?utf-8?B?VE9NTjl2WjVzZ0tYZzI3U2dWR2QzUnlMZTRoQmJqRjRvenA3NGpiTERKWGRy?=
 =?utf-8?B?czc3N1YyQkcxZ2F0d2xUaUVnVlBKdkVlZkRkdjJEZGp2N1ljUU5id0l2RFhl?=
 =?utf-8?B?UjlydjI3eXlRNVlSeUlCRmRua3FyR1dqWFY0YytOQldJUFZOWEpQVkppN0Yw?=
 =?utf-8?B?UXZyQ2t6R05UMHJ1OVhqdy83NUc5NGd2b2tUNDZ1bnBsVWVNQ1ljOHYzUUhJ?=
 =?utf-8?B?QlNnRFdINWFxMG9CVUI1dTJUdElVY0Nnd1ZQWlprUlo1eDRmcmlZUHdyb054?=
 =?utf-8?B?T0NIRFo1UjNzdmFzb3FkRnMyN0F0OGRkMm9nNUFBaXFid0szRDl4eU1sVFMx?=
 =?utf-8?B?VzZmT28waGVMK0d5Mm1uK2xJQndHbDUzUWRJTUZoUk5kM1RzQk5XMUY1Y3Z1?=
 =?utf-8?B?KzVMK3IvY2RaSGZ3MUxKVktXZk43UDhYLzFxdXRzNEJrc2FQM3Z1SHZFS3pC?=
 =?utf-8?B?RWZGY0R0MWpiOVU0b0dZQS8yN0U2eTFpS2RyWEppOGFKUDY3a29ySVhYVXZJ?=
 =?utf-8?B?ZnlDQ2lNVmRwTWl5bmgrUTVOcmFCdEgyY2RRbXpqRzZlSzlacHFldkZ2cnlB?=
 =?utf-8?B?N2w2TU1EZm85L0o5VTR6TVpJMW1TMEQzdDVhZHl3ZXRhTHVtcXBRMzRkbmJD?=
 =?utf-8?B?OUFsZlpCRW5lTzR5bTkrK0ErWHhrYWFkbDdCeURONTJNTWtmNElOZGtwdTNq?=
 =?utf-8?B?VjVSU1lRS3hPYXIxQmdUUG1Tdkx6aHdycXNaZmpLZUg2aXk0VGlDcFp3UmJM?=
 =?utf-8?B?Q0lyc3BmYXlvWWxPMEY1Z1Eya25TNnB2OGNDNlVDK1BvUGhSRyt2QUZ0ZWtB?=
 =?utf-8?B?YnJOTDVwelZzdkdYNURTZmZGc1NQSjVWdENSTkpUZkF1K0N6Y2dTb3F0aCt2?=
 =?utf-8?B?YWVaWmRmZ0NmbEpBa1hML3B2N09Dbm9KWmR6K2phSlBrRXFqZmNXb0c5akdK?=
 =?utf-8?Q?vuKt7nO43W/9BAl9W5ii4sRf4YpNpwxiotKOqGgmSWn2?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 400b52dc-917c-4cc5-3d5f-08dc91200fb0
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 11:56:46.9876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MT1WOEKOMQzW0fw2GSQLtHcVQjkloDShkCT0ZC8WD9Pq8LPp/VNHHP98adMss/9MG+Lj6iWLzp5kREx03cEbKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB3137
X-TM-AS-ERS: 104.47.11.169-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1026-28464.007
X-TMASE-Result: 10--4.685400-4.000000
X-TMASE-MatchedRID: VfovoVrt/ob5ETspAEX/non73EnA6dC3lR7tN56aWVWOymJujT8rWFPW
	JnavNRHKwUr7375NmjS0cJDxMXg4qdZSVIh2F3SJO9AbTF0WkMKgn19QHAlOzLG53EQ9QCTJQbC
	R9RgFTxdkJpSRsbItI5GOudnIATlu/ZkCEDYlTyWheJ4X7s7SmlxF+wAaDLINcS+yLYeLvNB8W2
	Se/pF0KkAuJExC2DUetFyEOhRbRirwaMIXsaQmMEI9AEPfED/dqvJX/aNGr9cSCDdzAMeX/Wp2V
	XUuZsR8A/lH/MvdoiYZNmx/p9DKJyd5/Xv5OZvOIlQ2Q2u3mv3f7qT3sazIOHC2QjnugGIuy/Kj
	7/TdsMOmd84JWqQRZ+QDX6YxwtgAeNP0N1rFeo0=
X-TMASE-XGENCLOUD: 18ace111-37a2-4560-bfca-4525344d0954-0-0-200-0
X-TM-Deliver-Signature: 1106728205AA2F9E096E8DF9B65F94D1
X-TM-Addin-Auth: VDtdiOggnWNsPwPdwXO4JY0QwXbUgDVGGP+/X3yodPx/rTFWRxXtVlrrhWS
	FJF49DyJhRVWd+ikZ0Z4UP2Ls1FCtuFsiy5DiYOawCD9JwNCz/MdKRcNklUW9dfCuyJPkZvBgOP
	915ZHZymp1x0UpNRNp0429+uI3gI7HepHhZK+5b4SH6WVc+9nkNezqqiRR7o+Ppz5i5gbmEFn6S
	VvE/YaQg9foOQ5B7TJJrqm/Jp01kbPD6oh2/Ku8fgN+TTge++mLhDIlTLB0g5SSz6Pc4xBa7HVZ
	QPIYmS2wyLKGCfc=.O6Pa8jNBeuc+uK+pTVpvqvysEh1PCWl6ktsquRDlkVH4U1kegzWnSQPY1e
	XYhJelXD6oS+LXwmrKxXuFPESywVqpejWYwG+mbcGPRjegny/iAhOf8bPecvaq69UUXTJD4nA4Z
	XsODUMmVwT/xT4dyPgyz/UdavrhuZ9k45vS/rOmKWwczAbV4mxYX9j+FeDT97WrNbf03bVIKNsn
	iPFKYdIdqpZ8jQxM5NstsOMA482P2Kq9mZYZgN9BhppBcf7L8/1lyWzPkNiSY/QXQpN3JXmAUpv
	4hx3w5sPOb9UThpPukoD5Vkpf2vJolWX4dSkqCcQG7XU6EF2N7fnNfjLOrA==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1718884608;
	bh=MeFmDMnHGdXmPDyIKfueuW7zzEPgQFZ60uHyr99k2gw=; l=1709;
	h=Date:From:To;
	b=EignmgNeq5VjfGQONFzwpvYE1Cyh0APhdad6Lo9kY5iPn0x3qqbiUr9DXIgUsDsvo
	 xtTS3mTjqY1PqcHV7pUqjEAzqQelNNWcuURc/oKlgK0V/YOlq0KkQmB3J0BU8nE6s2
	 MOZdDOwJwz77SgngPDL6i5KgqT4OpNN7+6nCoS8PmHg8afjXUiDcMZB3gh+XtKnAHv
	 G88Mdku+rL69TTB2cKVFJxEJW7o03F3mZNfHKllOJsp8KZsbUFRqcjx7pLBOlfePPd
	 O8tVGzwahr3L1/NwWQqUqoOToxHcCIM+ar+Vytf7UEXZMNJJL8bY1xnqXJAuhL+Y4B
	 ZDIZmszd1y4+w==

On 12.06.24 13:31, David Woodhouse wrote:
> On Wed, 2024-05-29 at 13:12 +0200, Peter Hilber wrote:
>> On 23.05.24 19:49, David Woodhouse wrote:
>>> On Thu, 2024-05-23 at 17:26 +0200, Peter Hilber wrote:
>>>> On 22.05.24 20:37, David Woodhouse wrote:
>>>>> On Wed, 2024-05-22 at 18:59 +0200, Peter Hilber wrote:
>>>>>>
>>>>>> - Drop distinction of Arm Generic Timer virtual and physical counter.
>>>>>
>>>>> Hm, why so? If you're giving out paired readings of the counter and
>>>>> wallclock time, surely it matters *which* counter?
>>>>>
>>>>> If a guest has access to both, how can it know which is being used?
>>>>
>>>> I think it should then use the virtual counter. But maybe there are some
>>>> corner cases where this will not happen, so I could revert this.
>>>
>>> As long as you explicitly *state* that it shall always use the virtual
>>> counter, that's probably OK. As long as there is no ambiguity.
>>
>> I failed to come up with an elegant implementation-independent rule of
>> when to use physical counter and when to use virtual counter. So maybe
>> the spec should indeed just keep both counters separated, and it would
>> be up to the driver implementation to select the proper counter.
> 
> Is there ever a reason to use the physical counter? I think we can just
> specify that the readings are given in terms of the *virtual* counter,
> and ignore the physical one.
> 

AFAIU such a case could arise in principle when the driver OS is not
virtualized by conventional means, and is able to control the virtual
counter offset by itself. There is no concrete use case. The physical
counter could indeed be omitted for now.

Thanks for the comment,

Peter
