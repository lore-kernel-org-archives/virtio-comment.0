Return-Path: <virtio-comment-return-5725-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF528C77B78
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 16:33:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4218B419A4
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 16:33:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 320A198667D
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 16:33:17 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 18D7A98658B; Wed,  3 May 2023 16:33:17 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 02452986594
	for <virtio-comment@lists.oasis-open.org>; Wed,  3 May 2023 16:33:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rb3lLxabEOh9HdHDoY5kr47bRbaQck4FGrxzWL4pT+LhGYsngbwg4LuNlactqEpHUBTiIvf/UnJvwO3ctNalhyzfSwnkp1ClMo1gjQ7gwBbA0vqOXfG87Yltu0ERxmsi/tVhSrthI5Ofd+/4sSyCkh44+q7Wgkkkf5sRpHnEFGHnj2UJVN0ynRjxhFS1RxmQDj/6z+H2bUwqVz+Fri5WQ1PU1JTkllic8vG0xDbgOFhGr40aScEXG+FFhr8D+kdwL6qaWx3WzmJDqtqXfnKLcuMdY3Le4DSRcebZVy/sRIrmII2PhwtDeielBOG/yTWilqeb4KUdT7yzqbOjOw8nNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5h5Jqzf9qrndez9u+epV/wFXyEme60r6SPpeRaGzTQ=;
 b=d2icaDtmFPMuiVr2j+PtQLAtjfBSQ74LRRLi6h+YQnYd+tZ/ZZuxIB3AWttMQ8u60H4L7IT7trwShUyUvLLO4uc9JwrPHmQsziOm+V//1xe0656e+HHt9HsO7m900YRfvIU1gXbRej1Yu4OW6BiudXFiVUuY/yFMOarfU6kCx/NnuTJ2xjrJ9Tdm6GoGFIVpJ6Egq3c/CHeuM4YFaFmbKvW0QJ9VPnHsKcb8nhn+PST5xsgbWztFQdYE5g/Wsqxaft8Xi8FJEz4y5jn/nQDNphxBxqL32kF1nwi4wzvkzrhCLOjgY4m3Y0wiThhZ3RlhxHfAmhBqk7oNgevNugObPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Message-ID: <d3aa5c40-2b26-9cd1-5e12-83b102fbf610@nvidia.com>
Date: Wed, 3 May 2023 12:33:11 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Cyril Germond <cgermond@kalrayinc.com>,
 virtio-comment@lists.oasis-open.org
References: <20221121090212.645-1-cgermond@kalray.eu>
 <PAZP264MB3888A224F87ABA76501F3CC8C66C9@PAZP264MB3888.FRAP264.PROD.OUTLOOK.COM>
From: Parav Pandit <parav@nvidia.com>
In-Reply-To: <PAZP264MB3888A224F87ABA76501F3CC8C66C9@PAZP264MB3888.FRAP264.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:5:40::48) To PH0PR12MB5481.namprd12.prod.outlook.com
 (2603:10b6:510:d4::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB5481:EE_|BL3PR12MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: e0928a70-e5ae-4511-a2b0-08db4bf41753
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RHdhztvKHhsMuJXoIsL27dvq3eu0aRsNJzlLSJiGZYEcewWqIhIfxQX0iK/nulSLOjFhBzzbnCpvkXoFKxb1YsniWSBag82h9HBwuX3Cp+xWUbk/V0FAAy/cO1Eowq1j/14VnqDPNBPsGbP5c5QQuhWQN/06dmts6nk2YrHOgYLBDKN4iQdNG5nLNBJaQz3pqLuYZoDhJfOHTNER4VmgWodio32ZtoBWgMA3eANPH2bbVqaS917HEt6Q30vO5Jul/Xt48IEbzjmvIttJO0+PMdF0Knt02tqs2vA5TIU0P4dM16+k0gB9sQ6CEBBeXtuwm3TMJqzhDLdi99P/7qs4k5+lEW3VRbqc1EOQTn0mONO+ulbkUPWC8SJ/nYZOiCe3Sc2bW57U4GPu9h5KZNywACdYS3bAha2K8b44xSnaLi/KoNWaI1uL+p89BJmWXiaYLBIycuiTVScnrCcz+hpFcHubDWDaLMAGtDQNJmdCIRoQPjkIMTMCmdsJM0T9gl9qcIhMAToN0Wcn05ZyiRZunBmjdFIeZzEZl2lRs7sjaa+PFi33eWbarRgGRue9RpSHJlBM2nNQLXcCR7uj7u+ssbvFzOZa+ghzmWwUNXIkjK5x98UfgSVHUpuaUA3co84+S/Ny8ppp3FGg2/FYzBzV1Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(376002)(366004)(451199021)(83380400001)(66476007)(53546011)(66946007)(66556008)(6506007)(86362001)(26005)(316002)(6512007)(31696002)(38100700002)(478600001)(6666004)(186003)(6486002)(36756003)(41300700001)(8676002)(2616005)(2906002)(5660300002)(8936002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1o1cHlOMlVZSVZ6NmNZNlFSbk1RelYrbUxObC9VcUFXN3Zvb2x2UU9aN0l3?=
 =?utf-8?B?T3RjNWtMOWVheDJuaGpBamQ4VG9MTjJtSTNmMFVEMnd2d00ybTlYcS8wdkp6?=
 =?utf-8?B?MjZnWTBCQVY3L2grVThTd2JqbGdwNDk4QjNwQUd1STFsSjZVaFhxWVFnVk1R?=
 =?utf-8?B?VnptNGN0ZE1DajZ1QlRIbW1ZM2YraTZaNTMzYVUxaUlTYUpTWFdDaytWYllo?=
 =?utf-8?B?cytZVDZLUVU2Q0ZHUktiVGlBR3pndmpzZEVlUG14ZjVzcU4vQTZKMGFHcWxM?=
 =?utf-8?B?SFVJYmc4QTZBWC9yWUpOa2ZqZjFRUGo2cTJtRG1JeDFtRUczYTRpQVczOU1W?=
 =?utf-8?B?Tys5cGdheHBMVDljL0dNczltd0tSMGlGcXdEWFpDZm5NMWVIZ0Y4UjZ0dXhk?=
 =?utf-8?B?YWE5UWc2T2did2FJWmkzNVNtS0lPMnlkeWdHVUNGdDRPN2hUOWYyNTR5ak9q?=
 =?utf-8?B?OWtRR2hsLzhETmFUMGloallqQ1dmeWlsd3BKMmRsenlMSnFxcVo2UFBlNTdJ?=
 =?utf-8?B?b0k5L2h0czRSTmRFdU05eW1NUmJKeEV2VGxFRXFJN3Zyb2lBYmU5VFZwajQx?=
 =?utf-8?B?dC9QZnJPT3R1NGJaN0NhSjM4Y3owSDVqSmhMNG9rb0VTMjQ3VHdEaXZvbmU0?=
 =?utf-8?B?dnFpaHMvMjJOdVVPUEx2ZUEzeXdNd1ZLd3hIUzNISURwSnBaRnh6UnpGM29h?=
 =?utf-8?B?eEhLSXRjWEJMUExGQW51d1FPbTVRM0QxL08rUmdpOUR3QStwa1BLS1NmZEhx?=
 =?utf-8?B?YUFyK3ZKcDRSeFhjRnpZWGlQVnJ4bGVkYmRCa3lpQWt3M1FzN2NtdnRSN01x?=
 =?utf-8?B?SGxBRjJhc05oc1BjY2RDYklSY1MyVDY2K2pHMmt5c3VuVUt2ODMyZGY2RVQw?=
 =?utf-8?B?VE45a2ZPaXA1R3JQVWFqWlB0cTVZMGQ5YnFHdzBiQmk5S0w3djVKenA3L0dr?=
 =?utf-8?B?bU1RSWVqVW9lamI0U2V3MWlBKzBPRm4vMkF2YldYZzdTODcrUEVNay9yNzNw?=
 =?utf-8?B?Z3gvSGtPT2xVRnJVcGNLZVlFNGZwYVpPWTdHVzJBdUJkUjFIdXI4TXhtdzN2?=
 =?utf-8?B?Zmx5U3VUd2MweXJ0UTV3N2Rwcm9KVGlLRDJ4QlkzajhkS2RpaXpJWHViWmcv?=
 =?utf-8?B?ZmhzK2Y2ZERzNm03cGdKeEdSUzM2K1lzamR6RUVhYzE4UTZUbTNYVWZZNDBp?=
 =?utf-8?B?L0VyaXNnaWZaYXk0cWZvMS9WOU54dmpkM2NabGF5SG9Vd2RUcXhoZUNzbDZm?=
 =?utf-8?B?cDE0bjR6d0V0bS9SYjl5WE1rM0ZyQ243blQ0Q0ZmZUFYTElvdFFCcVlCMmpF?=
 =?utf-8?B?dFZCaWdVYVo3bmsyRTZIV0pCVm1TZzlUbVFDUEV5ckd5K042Y1pFVngrczFi?=
 =?utf-8?B?UjVPbEZLWHJJT3Z3TTRuNE9LQTZWV1NMQmVyRXRsR0p5Qlh3cGR5dml3aS90?=
 =?utf-8?B?Y2xrekxSek9kVnY0NlhsMVpEczFZNXdhYWFXS3NUMWorYXVaYXozUXhIdkgz?=
 =?utf-8?B?MmpTS3NXTHFFZG5WSFNiT3JCWk9lNGMxL2VFSEt5WXNHQ1B5SWd2KzR4N2NJ?=
 =?utf-8?B?dVk5cWpOVDhhZy9rOTB2RWtsbjNsL3c0RFhnSXFaTlB0NlBuWnZCN0tiQTFs?=
 =?utf-8?B?M21mdFY2ZWNUamlNWWxWaVRpZkxpcnlCZEJiMFpzQTYxaERuZ0JFUTQ4bExU?=
 =?utf-8?B?eVFaVGljNVM3R3QzT3NoelYwRE90NHdYK3dvbGwrMFdoS20xRUcvRWJySFhE?=
 =?utf-8?B?MUhkV3ptdWxXSVJ1UWFOcEw3dDN3T0YvSmlpNEJuK0VxeWhEZ09wdGd5c2lx?=
 =?utf-8?B?YmRGVzdhdW4yU3BJS0xsSTZSSU1vQjhpclMrTWFyNUlWWEdkdHlyOFNEK1Zx?=
 =?utf-8?B?NU1qaU9WeUg0WUUyeEJJYzk4M2RoOURwOW9vK0dIK2MvUzZSaXlxektDdTFG?=
 =?utf-8?B?NU80TmN5cWhYck5CWjFMZ0JpdU5IbHJCaitKYWUyVU1DTDhFMzRrTUs4Nzk2?=
 =?utf-8?B?MFlqWjlMSnE4R2NpOVN2MnFlSGJWY0tWYTBvOFZnRTMyR3F6NUhmQ3BBZ0kz?=
 =?utf-8?B?QXdzTXNZOXh2enZyV3NVNWpmUy93aTlMZEFJa0theTd1S1ZXYjV1NHgvUVpH?=
 =?utf-8?Q?CyD2h3UwMYDbw+cw1zrfj+OoT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0928a70-e5ae-4511-a2b0-08db4bf41753
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 16:33:14.0406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m6qz0Ue1rlhcnr4H4JcK6SV44Q1M9TIG7PsOkXGB35JdxgwQ6xoAm8yYsgxHG2BAUbTI6lq8d9pdoTPd5FvVVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6523
Subject: Re: [virtio-comment] RE: [PATCH] virtio-net: Fix virtio_net_hdr
 struct size when VIRTIO_NET_F_HASH_REPORT is negotiated.



On 5/3/2023 9:39 AM, Cyril Germond wrote:
> From: Cyril Germond <cgermond@kalray.eu>
> Sent: Monday, November 21, 2022 10:03 AM
> 
> Hard-coded references to the size of virtio_net_hdr strut are wrong when VIRTIO_NET_HASH_REPORT feature is negotiated.
Please fix spelling,
s/strut/struct

Below changelog should be after "---", so that it doesnt become part of 
the commit log.
>   
>   \subsection{Message Framing}\label{sec:Basic Facilities of a Virtio Device / Virtqueues / Message Framing}  The framing of messages with descriptors is -independent of the contents of the buffers. For example, a network
> +independent of the contents of the buffers. For example, if
> +VIRTIO_NET_F_HASH_REPORT has not been negotiated, a network
>   transmit buffer consists of a 12 byte header followed by the network  packet. This could be most simply placed in the descriptor table as a
>   12 byte output descriptor followed by a 1514 byte output descriptor,

Above change does not look correct as the example is for the Tx.
and HASH_REPORT is for the RX.

Once you post the new version as v1 with above fixes, please update the 
link in the github issue as well.

This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

