Return-Path: <virtio-comment-return-4706-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB70C64EC4
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 15:37:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E421A87CAD
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 15:37:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C21A89866C1
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 15:37:26 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B19569866BA; Mon,  6 Mar 2023 15:37:26 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-Id: <virtio-comment.lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9C30A9866B9;
	Mon,  6 Mar 2023 15:37:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOGfh476w2jZedzRQl6vNOnnDhipRjat/FSd629o9qmmM2GiKWGVmjQiYYrBxdxJztLEzQjC0ivmwOSbzCV5Uv6BWFOoGCa+30V0MVRjESUyqDfcB25SqPHZXg7rpx0NYdDKRklNeBQpcFxIAtNulaAhVQvqeLkS061t5qTDVK6tNtNO7fH1SExhBwBCB6ECRZ6kUSMoDsV3TQAQ1xzqKnbl7hV/mzX1kezwdC4pfAS0SyoqvQemOr40V1hOKbrJMzh/Jpwfmn61qZpJSv4eJTQwZiD05AqpcSvKQs7A5UOuCh0EcrdxblCRqEVTj5h8F8KYQBrEiHtoQRgxKQ+nuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUMiPI1AfSPkADrHg+HHYBKVtwhmBu+7V+SefOKDYEI=;
 b=OcOl0yA3/Ck5AnulrQnuEQHmdpZZtbPXEfouQOQMXcP6VWHT81425qYfWWtwaR0FDhFV38C/tfB4KInuFtcqmf9pGwI1bUIfiSKpMU+aXyXYp81dG6HyDkrUJ5dRkjPQ2pNBjr1Ha+u3qSoUlE2nJPMq5O5uIOzRLEhwvEJXOln3rDA8h6gXgPkOnRTIOy/1xdRvx0JHY3TFbVASHtG7Zxhe0ivZA6tEA1FYqRPWxssWiEJgMVPRv8oZdXfhMBLMcBhhGG1rdE1k9DDm77LIu2b5QyKnOvVglTc5/kdCmKqvUBiaEALWxjFBJ8DzjkjrO3/WZInRPNtOaTGyP3E3Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Message-ID: <17471553-8981-eef9-656b-098e1acdda14@nvidia.com>
Date: Mon, 6 Mar 2023 17:37:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Jiri Pirko <jiri@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
 jasowang@redhat.com, cohuck@redhat.com, sgarzare@redhat.com,
 stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com,
 hang.yuan@intel.com, virtio@lists.oasis-open.org,
 Zhu Lingshan <lingshan.zhu@intel.com>, pasic@linux.ibm.com,
 Shahaf Shuler <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
References: <cover.1677761896.git.mst@redhat.com>
 <20c81b66f0b21b5bd646c24840ac3f8462c86acf.1677761896.git.mst@redhat.com>
 <ZAXfegxCfvfLwiJT@nanopsycho>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
In-Reply-To: <ZAXfegxCfvfLwiJT@nanopsycho>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::9) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|CY8PR12MB7612:EE_
X-MS-Office365-Filtering-Correlation-Id: fe31067e-69a7-4916-b0f3-08db1e58aadb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jDFCOuYez87i2+5cVDzFSMT9RHmqjsjP7wiE/AD3m7pu///QpEpPOMITLT2IPjEk8FpKHCvsvT5vKi9qdslTLnTAidiydIjZvna5qibffQc0qa6x3e6RDNL7x9lHK5ialCv4I0gTwY/h4+6EUBPiJGS/Jj06rU1DikYhPmrj16X6X+4bgOImbVKwwr2J2plxdX4f3lNWGm+hJUO4BTYS/yXtPlWXwYUhDVhD+7K1jy35sBY1qAI88mOahO6cuGnJ43L4QfujJsFO+PiVX8SPbzTwmA/PFkW8v9fuuE1Ufv99cRCGlkh/3A1EJKgZpBvwS04vVrlJp/qxRepTEgPQ7N71I5tjgAJy1gh6fdogOYRZPVUBBsNiJzgGXwJFPlnXbubYVWcpMY8oMZQYFjcb3/hjpY0UR+5D6QC+jsQPGrhKuP0y8drEHl1HeD50iR14a861/Ee/xHTF0YPYt+3YLFfQdfe1yF75993RcO3HpRVEGlV3d9Cjntltsn1a/EMzWvmc0OSo1UVpTot7Lr/mHl+uDVjyvC3k0pCzEsCHRnVbTryi+kc5fWBAKyoNJdYiiJG6audy42YHNe502JYveslGb4Fu+VcAoUfEIb1hsEG1X6djQMQ/DmuFUjx8JbiRe3Uvuzd5dbdScKk1mzGIPwN1JkC3OUJMZQi8l0DTXFy7h/Cs/xEi2SX+FjFo020iE99knu7Zuohzcw6KpVbN1t/EFd/ynUkL5ANSQV2ftOGBpKEyVdrIYGH5XlZC6Qmi+m2M4xaMLZdxbpxbGnIrIw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(39860400002)(136003)(346002)(366004)(451199018)(26005)(53546011)(6506007)(6512007)(6486002)(966005)(6666004)(107886003)(36756003)(16799955002)(31696002)(86362001)(83380400001)(38100700002)(186003)(2616005)(66946007)(66556008)(66476007)(41300700001)(8676002)(4326008)(2906002)(31686004)(8936002)(7416002)(5660300002)(478600001)(316002)(66899018)(110136005)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmJIWXZ5dXZ2R2lwZzVTamdFM3NVK1IxbEJNelB5ODQ5cU9TS1hWTnJFWnFv?=
 =?utf-8?B?eFJyY0pYZFViT2pRakpmalVNTjc1SWR3VXlNeDJzQmhIdG54VVY0a3BjUDhS?=
 =?utf-8?B?Q0s4cElyQURXdzZXS0hCUlAzM3VJSDFYbVBjZ0srUTNtczIxdkFBWDlGUmd0?=
 =?utf-8?B?SXdyaGNiMjNLcmhVUzFWVkQvVnZRbElRL2N2dSt5SXpJeUswR3NOMklGaUxH?=
 =?utf-8?B?NkhIZmdrMVBFcTRsY2J6THdaWThyMW4xMTlTREROVEYyTzdlNjRVZXA1OUF6?=
 =?utf-8?B?QmF0bkZlcThBRmpFRkxmOGJ5cmxuTTRiMmlyN3N3R3NGWWZ1cExWSERkMHJ3?=
 =?utf-8?B?RHo2L3BPK0U0YXp0dzI2bmFBSnliZTZJTmdjOHhMSGl0MTZlV0ZiakVVWWVi?=
 =?utf-8?B?V1FGTTV2QituZ3E5d3Q1ZmthenJ2TTJYZWVsMHVuWTRpcVZTRlo3Uk9tVHVX?=
 =?utf-8?B?QVI0Nm51TXNZT0oyTCtXNk0vWncrSE9XamFSZE9mOEJiRHEwMm5rVkJaY1o2?=
 =?utf-8?B?SmpDSjZTcUVCQ0xpSU1IajcrbUZ6U1lsODVOSDVNQUErSVBiY3JUZnV0eGY4?=
 =?utf-8?B?Ly9GUkVpSlBYL1pWOGx1YUtLR2U2a2k3alJTSjhIdkdPT0Jzajl0YmV0aHA5?=
 =?utf-8?B?STNwWFB2UXNMVGpqdHkwMWdtc2tLdHBnUWV6ZzV3Smx0akI2Q2xYWXlpWmxZ?=
 =?utf-8?B?TkRGZHZ6aUEvSW5ZVDFvUFZTZ2YyTktFTG5rbWxtUzlMOTBBZStSWDl0ZDU1?=
 =?utf-8?B?YXpOcmtYNFY4VEFLN2ZudkEzREdTcmJwYlllKzFPdGs1UXFHWU1TdmQzT1hE?=
 =?utf-8?B?Q1VKVjNBUlNoY0xHMGZWMXpTVHdBSit5dGJZR05jc0NTYkp1Y3pmdzFZc0ht?=
 =?utf-8?B?Z2R5cGo3MmFmODlONy91cjgxalBKMTZSanAxNUtuayt5ZDB0UytmQjJvelBa?=
 =?utf-8?B?UGl4Ri9QeUxqSzZKSlRJclBQLzhOS29xcUxQaFB4MUNzV09SOVJoendmNTFD?=
 =?utf-8?B?alpqNHBzazJ1VFY1eUJpWHhxcDFyRzVkMUVOTHFrL0R3MlM2NkpaNVJ0dTM1?=
 =?utf-8?B?cDRtQlpnNEVsekswV0xoVkJEUGEyMHNYQmZRcjl5ekhrNGJXOEdVcDdnZTJI?=
 =?utf-8?B?M1k0SkJWTTFEd2dQanZzMnNRQnpOVUlhWWJCMVo1TG9yQ2xlYjVBeUEwVXJZ?=
 =?utf-8?B?eDNxbDJaWGNzMS84dUNPZ3A5aERjK3hXaWl3eWcxWndpTk9ocUMvd3htcWdw?=
 =?utf-8?B?QkVwbXlxYnU3ZmhVbVkrcENVRVdIRGZob2xNVGZ4VXkxdWJnK2ltU1NjU0Z5?=
 =?utf-8?B?U3RPY1ZiYm85TlRuNEwzVFFUVE16Yk9uZTNvQlUxQW1FUXpHVWYzOCsyMGU4?=
 =?utf-8?B?a09Ib0VtcU1MdHl1RHc0UEx0Yytyb3lQTytEVmtMVUUzRFF2ZUdkVW8yZUkx?=
 =?utf-8?B?UW9VREJRdkFkMXlra2c4dTU3ZlUya3FDNjZQUlJsSTlOT2w3NTFkS05VTE5X?=
 =?utf-8?B?R2RqTFRWL0FqZXo0M09FZnNPSlRaUUZ0NjE4alIyWWNTaW5LcVFKcUpDNVEv?=
 =?utf-8?B?MkNSdklPYUZUNUlISlNlanNWS2lFdVpCKzNpV0JwWmlSWEhyb001UHFscGtN?=
 =?utf-8?B?cDJkQ2VyQ3B5RnF0U0dQb3dUalpaMkhTRjhoOUxuUzBsNGJZbDc3cjBOWUhT?=
 =?utf-8?B?NnY4eEhGdGlvSklxdnBJVnliL0svbTFqM2hsblJaU2E0RGlkdnhSRWZxUFVX?=
 =?utf-8?B?MlFpcy9TWCtqdXZRMmJLK1dvSjl1ZHMrVTFYVXp6NjBmWnk5RGJQeUtlWVhZ?=
 =?utf-8?B?bkc3bnIvYnpxYUZkcUlud1pFSnNMQ25tcituS210UmkzbkpIQWl6c2ltZG1w?=
 =?utf-8?B?V1ZWM2VBRGlkeS9JdGplNy9tUDkveG9lY0ZRSXVudldsVTFxSHRCREF3dmFK?=
 =?utf-8?B?eFBMdTRIWjN3SlV4TWpnNVJTaE80UUhMc2h1ZlhzM3J0SDdzbEhHTFRNRW5I?=
 =?utf-8?B?NnlNdnZsUjFlOWQzSHhEOFZXQ1pycUUvVXEvRzJTeVgyeXVZSU8vTGVOd3NR?=
 =?utf-8?B?cG1ic25RSkhTaUlHTXR4UERmUTkvUlJkTE9pR2U2a2U4dVpDT2JRUCtBbkFz?=
 =?utf-8?B?RFVkMi9iR2ErVFViTDlxTk9IVUx0TUJVaGc4ZUt6eHJGclMvV2JDdGJMMmo1?=
 =?utf-8?B?a0E9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe31067e-69a7-4916-b0f3-08db1e58aadb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 15:37:17.8036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gNYLP4zpTvAczYaJFOwvXoHUq8+s9+aP+Cy7BT4QPbZMOh2CdcOjbgn746TxW18cJMKIbNu8u9S4KKug7Jh3Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7612
Subject: [virtio-comment] Re: [virtio] [PATCH v10 04/10] admin: introduce virtio admin
 virtqueues



On 06/03/2023 14:41, Jiri Pirko wrote:
> Thu, Mar 02, 2023 at 02:05:06PM CET, mst@redhat.com wrote:
>> The admin virtqueues will be the first interface to issue admin commands.
>>
>> Currently virtio specification defines control virtqueue to manipulate
>> features and configuration of the device it operates on. However,
>> control virtqueue commands are device type specific, which makes it very
>> difficult to extend for device agnostic commands.
>>
>> To support this requirement in a more generic way, this patch introduces
>> a new admin virtqueue interface.
>>
>> We also support more than one admin virtqueue, for QoS and
>> scalability requirements.
>>
>> Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>> ---
>> admin.tex   | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>> content.tex |  7 +++--
>> 2 files changed, 79 insertions(+), 2 deletions(-)
>>
>> diff --git a/admin.tex b/admin.tex
>> index 7e28b77..3ffac2e 100644
>> --- a/admin.tex
>> +++ b/admin.tex
>> @@ -155,3 +155,77 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
>> \field{command_specific_data} and \field{command_specific_result}
>> depends on these structures and is described separately or is
>> implicit in the structure description.
>> +
>> +\section{Administration Virtqueues}\label{sec:Basic Facilities of a Virtio Device / Administration Virtqueues}
>> +
>> +An administration virtqueue of an owner device is used to submit
>> +group administration commands. An owner device can have more
> 
> I admit I'm confused. You introduce a concept of admin virtqueue, which
> sounds quite generic to me, usable in future by much more things than
> "device groups", correct?
> 
> If yes, here you say "group administration commands" which contradics
> that idea. On multiple places the text this patchset introduces
> this very muych tights to groups. Like in struct virtio_admin_cmd
> which contains fields very specific to groups.
> 
> If no, isn't it a mistake as the admin queue should be here to
> handle more than just group commands?

This was my original idea to have various different types of admin 
operations allowed by an AQ. Not only group management.
Somehow this was changed down the road when MST took ownership :)
Maybe it's fine as an initial start but this shouldn't restrict the 
general idea.

I had in mind things like general health commands, log commands, fw 
upgrade commands, etc..

> 
> 
>> +than one administration virtqueue.
>> +
>> +If VIRTIO_F_ADMIN_VQ has been negotiated, an owner device exposes one
>> +or more adminstration virtqueues. The number and locations of the
>> +administration virtqueues are exposed by the owner device in a transport
>> +specific manner.
>> +
>> +The driver submits commands by queueing them to an arbitrary
>> +administration virtqueue, and they are processed by the
>> +device in the order in which they are queued. It is the
>> +responsibility of the driver to ensure ordering for commands
>> +placed on different administration virtqueues, because they will
>> +be executed with no order constraints.
>> +
>> +Administration virtqueues are used as follows:
>> +\begin{itemize}
>> +\item The driver submits the command using the \field{struct virtio_admin_cmd}
>> +structure using a buffer consisting of two parts: a device-readable one followed by a
>> +device-writable one.
>> +\item the device-readable part includes fields from \field{opcode}
>> +through \field{command_specific_data}.
>> +\item the device-writeable buffer includes fields from \field{status}
>> +through \field{command_specific_result} inclusive.
>> +\end{itemize}
>> +
>> +For each command, this specification describes a distinct
>> +format structure used for \field{command_specific_data} and
>> +\field{command_specific_result}, the length of these fields
>> +depends on the command.
>> +
>> +However, to ensure forward compatibility
>> +\begin{itemize}
>> +\item drivers are allowed to submit buffers that are longer
>> +than what the device expects
>> +(that is, longer than the length of
>> +\field{opcode} through \field{command_specific_data}).
>> +This allows the driver to maintain
>> +a single format structure even if some structure fields are
>> +unused by the device.
>> +\item drivers are allowed to submit buffers that are shorter
>> +than what the device expects
>> +(that is, shorter than the length of \field{status} through
>> +\field{command_specific_result}). This allows the device to maintain
>> +a single format structure even if some structure fields are
>> +unused by the driver.
>> +\end{itemize}
>> +
>> +The device compares the length of each part (device-readable and
>> +device-writeable) of the buffer as submitted by driver to what it
>> +expects and then silently truncates the structures to either the
>> +length submitted by the driver, or the length described in this
>> +specification, whichever is shorter.  The device silently ignores
>> +any data falling outside the shorter of the two lengths. Any
>> +missing fields are interpreted as set to zero.
>> +
>> +Similarly, the driver compares the used buffer length
>> +of the buffer to what it expects and then silently
>> +truncates the structure to the used buffer length.
>> +The driver silently ignores any data falling outside
>> +the used buffer length reported by the device.  Any missing
>> +fields are interpreted as set to zero.
>> +
>> +This simplifies driver and device implementations since the
>> +driver/device can simply maintain a single large structure (such
>> +as a C structure) for a command and its result. As new versions
>> +of the specification are designed, new fields can be added to the
>> +tail of a structure, with the driver/device using the full
>> +structure without concern for versioning.
>> +>>>>>>> 0edc690... admin: introduce virtio admin virtqueues
> 
> Conflict resolution leftover.
> 
> 
>> diff --git a/content.tex b/content.tex
>> index ffe45c4..c8647c9 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -99,10 +99,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
>> \begin{description}
>> \item[0 to 23, and 50 to 127] Feature bits for the specific device type
>>
>> -\item[24 to 40] Feature bits reserved for extensions to the queue and
>> +\item[24 to 41] Feature bits reserved for extensions to the queue and
>>    feature negotiation mechanisms
>>
>> -\item[41 to 49, and 128 and above] Feature bits reserved for future extensions.
>> +\item[42 to 49, and 128 and above] Feature bits reserved for future extensions.
>> \end{description}
>>
>> \begin{note}
>> @@ -7682,6 +7682,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>>    that the driver can reset a queue individually.
>>    See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}.
>>
>> +  \item[VIRTIO_F_ADMIN_VQ(41)] This feature indicates that the device exposes one or more
>> +  administration virtqueues.
>> +
>> \end{description}
>>
>> \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
>> -- 
>> MST
>>
>>
>> ---------------------------------------------------------------------
>> To unsubscribe from this mail list, you must leave the OASIS TC that
>> generates this mail.  Follow this link to all your TCs in OASIS at:
>> https://www.oasis-open.org/apps/org/workgroup/portal/my_workgroups.php
>>

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

