Return-Path: <virtio-comment-return-8660-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCC7C4167B
	for <virtio-comment@archiver.kernel.org>; Tue, 28 Nov 2023 03:00:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 453511922EF
	for <virtio-comment@archiver.kernel.org>; Tue, 28 Nov 2023 03:00:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EE36D986553
	for <virtio-comment@archiver.kernel.org>; Tue, 28 Nov 2023 03:00:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C9815986491; Tue, 28 Nov 2023 03:00:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B255798649F
	for <virtio-comment@lists.oasis-open.org>; Tue, 28 Nov 2023 03:00:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iABuayZAlEl4sJX26GlfDNLNqKbZwBULVKO+hZP+kRnEIzOzNDRnf3X52M10Ciz1F6KkQnUSAjkuoa+JcRzLS7CbXWTNSqN0tSJdckaTCqE2bniKMpXiBhwnT9NEgR9J3pz85PmUDTih/K+CfwWPPCERo5eWOSvDxpbWUtg74NNyadrdQVwqn//MnOl46fBmR0rry7Cq1zRRiAZ1FQc9KcCLqZze7R63Rj2Xc8WAGTD72vag2f7eK2XXFwkrKKq3fjSCppMpjXXwh9IeX4W3n5MredUJ5Y9B4WAYR3Wg+SPN9FTRRvzcrSupiYe89ccvKxk5CVrW3lLVE+KR+L98sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67lcOKMKhwyCyPeWAoZZXbwlKp4tvGwc0MwmxiCqQ3E=;
 b=oDbvJrN4b9OqbCwcpLN1ktdSdPp+NSNvnKd9Z8F9BvUMarxlxEILqerQ+QNjgWW3BsPau265/PchpZOL0iDNz8YzOgHncbu8N3O6l+vfu+shdzyFJv05FFYU/m/M106R5o/1Aseb9rDg6ba8tQ5IQiH/++c/GzWvVKQAMZ7wgxgDXPKs/I8hovUDVJfJz1JuVXMEDmfr+sZx48ymgu4GbqXu9grA+vnt2BoHZ2S/HT3ARSGxfP4Xs/7EM0e8mAiL8cc3iuyu7kbBgWZGelhAyPeF7cupcNULu0ns/s2RKRPMUR+VUZkSAMhyyYnJS5bDLVqRwODnvfCjtAeQO8kXkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
Message-ID: <acca3523-6d8a-4000-885f-0859b43838cf@oracle.com>
Date: Mon, 27 Nov 2023 19:00:17 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
        "Zhu, Lingshan" <lingshan.zhu@intel.com>,
        "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
        "cohuck@redhat.com" <cohuck@redhat.com>,
        "sburla@marvell.com" <sburla@marvell.com>,
        Shahaf Shuler
 <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
        Yishai Hadas <yishaih@nvidia.com>, eperezma <eperezma@redhat.com>
References: <705e728a-368a-4e28-a7b2-61afddb15ce9@intel.com>
 <PH0PR12MB54813446F8F2BBDBC74BF393DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117063304-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548179702B4F7B460E09681CDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117065740-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C905833821171814CB13DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117073031-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548103A393411CF8357B85DEDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117085848-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E5431DFCF96F622A7696DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvYTVA=kOT5vZSZ7nwTm00vbMy92EUV9RMX5ycrhweeVQ@mail.gmail.com>
 <bcb86082-31d8-4c59-b731-9aca05742568@oracle.com>
 <CACGkMEuOV7fSN8hXRG6HOvfOBZYrr_ZvRE0eEJwCxeHzLHebYQ@mail.gmail.com>
 <9404c15c-9c9b-45c7-befd-636b3d831c3e@oracle.com>
 <CACGkMEtq7hFh1E_esYnYW6YQcru4_jvwAQJb6tJAB_zC87fcEQ@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CACGkMEtq7hFh1E_esYnYW6YQcru4_jvwAQJb6tJAB_zC87fcEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:40::38) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|BN0PR10MB5126:EE_
X-MS-Office365-Filtering-Correlation-Id: cf01684d-cb26-42b6-7171-08dbefbe27a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ppn92StFAq3DGDIwcDvxrpqOJ6E5TnjgPbCGdfCn5hneReoF2eGMwoUyCWn6FsDd14aLS52BZcj35M+cn9gqf4llFc0QFCYafUVgsbcaszxX/ORk1wX6Uae79cBPCsfr5n/wheZH+58gv26YN+bO0ka3HHYW5t9fPHYrRQAjNnNtax65E9czf+XW2uiLx8JfnkmaH0AHXD4JZ7KY6WPKcWO8Nek/UaDoQiam+zX3WYWF1SwDyjKFrOS2QzkA0kMlS/MOQ+11bWpUaa1zSAVc58HNZfOPrLrhjOz+2RCPMGU+cgslrdYeP43KsscZkCrZwAv8L4O6OZ7JCU1tKBJk1Vu642/LJtI0Qeq4yJHMMsgxpE9nKQu+FvJ3OuS4KwuIzajo9MI8kOMzO7yqG+VqHi3VkbrEIvFLL35cB72Dye3OklJ1B+H6EcOOEB9Nfk+S+f+JVDMdDICOvlQT5PugecN5FfKg1X2S+S9C63eqgE0BKTJUb2CjFEQ5a5dHlxAgjHHnuIEfFxG1KMegz0KHsRR4oTLBSvlLu8bpw/ouuAkvhYi58DdyELkx0qw1JvTnqL7lcPRVheNsVVncuE1O8yCwgwBGqQU8HtG2BbYPZol0usuuE2xZxC9rUROgF8ghIbsRdvWEsbFG7k7SAjfJ/QPW780alJDrzD+YyXRcx0YJUWdkS4qQ88yyro6hfhMnzRyoGYr+jWxJeamJ3Uyj0g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6535.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(39860400002)(366004)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(4326008)(8676002)(8936002)(6512007)(31696002)(6506007)(36916002)(53546011)(66476007)(66899024)(66946007)(66556008)(54906003)(6916009)(316002)(966005)(6486002)(478600001)(2906002)(30864003)(36756003)(38100700002)(41300700001)(31686004)(86362001)(26005)(2616005)(7416002)(83380400001)(5660300002)(69594002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dVV6NkZ3V3lWWmRYSDJpaGRPODNHMnZkYU5HWHVTUXZCeUhaTXBFaGFJMkpj?=
 =?utf-8?B?Wkhoc2xCaWJsM29aWDZhZ1k2OHBwRzZTWkZKa0xGN3A3bkZGVXRDU3VsR0wz?=
 =?utf-8?B?ZmhjL2syRzNVNzg3ZGRjT2NXVHlIM0N0enJBMHFBdnFYT3QwY0VNTmhra0x3?=
 =?utf-8?B?WTNxTXZoUlJFMGQ3UmVLVXJsOUgyVjIzNy9vQmtzQjNZU2RLeUlFSURUVzFY?=
 =?utf-8?B?RVd2ZzNQVnd0NzFvQmJSeEd6T09rbC9KcThqZm5LSTd2UEFQRkVMdkl4OWQ4?=
 =?utf-8?B?ZHVMeTVlMEpXNklIdzdrVVlZT0s1Y2x6bWNDR1d2YXNqTVBrcTRzeTFES1Ur?=
 =?utf-8?B?MVdGMytTZ1ZFeFVCNFAxL3pRcUZFRkd2ZGVLMm1iNzhxa1ZKL05GK3R2Z25v?=
 =?utf-8?B?V1lqUG50U2FzSzdzS2RmZ1d5TTFVU250YlJHQWNwdTlaMUNBekxrMFc0eGEw?=
 =?utf-8?B?dWErRmxKZGlSSHloZnhPc1c1THNFNWMzdkVKL3ZXdFNYQnV4TzdENExPNHN1?=
 =?utf-8?B?M2grVk9sMzNUQXJ0cjI0Y2dkTW5PMHBBNURLNWsrZW9MbUNhemJrZnRiQTN4?=
 =?utf-8?B?Vi9Pbys5Q2dKUDd3OTNTRVhRRGhMV0Nka0g5RGJkRnVVakczT3lTN1FscEJz?=
 =?utf-8?B?U2lMdEQxdVNJTkxXR3U1aHlFOEEyTnMyWHp3b2NqajBEU21lRjQvc2RSV0Nk?=
 =?utf-8?B?ZEhSR2ZTWVcwdFdvcGxKZXdXRHNlNzhtRFlpTVRxeCtNRVNlSStobHBWTHZu?=
 =?utf-8?B?NWlua2U4b1U3YnhCRmhrMHZCVWlhdGVjNThuRDVYVy9FOERUbU5WdFVmWmtG?=
 =?utf-8?B?V1NVbHJCRFM5aDB5MUtXTkUrNFFTbyt1eVJHOVg1L2lZaytVUCsvWHFRL3Ns?=
 =?utf-8?B?ZldjY0lQZjhIQ1RZYXZQbXBwV0lEcDVCQTR6aVByTUpxaHFndGpPUGIvN3Uw?=
 =?utf-8?B?R3RFNnFVWWJiQTlSbm1UdUNmaHdUTzJGU2VEdTlGK01wK0pteG5lRVcxdUs3?=
 =?utf-8?B?UDJHdlFRU28zSWUyeWcwbklGaXVydVgvVWJuYnd4ZndlUmdSSTltQXZMK05O?=
 =?utf-8?B?TCtFd3pRNXdNeGt0V0tJZ0RYM2xJMXRUYWtNejExbG5KQzlaNm5iNVYzNHFj?=
 =?utf-8?B?SFpIbDJDZnV6elZpY2tZNU5pYmNXelJXZzJCdEJCL094YTc5MHVKT2RxaDZR?=
 =?utf-8?B?dWpHejdGVDVlNW5Sd2tQRTNRY3EyQkRHSE5rRmZZSlB4enR3WEtNYkJTa0lx?=
 =?utf-8?B?Y1liUktNUEh4YVlwQzMxY0FCWEVHYmhtN1FFU3J0UXJHS1RsRHNIZ0E4TzZR?=
 =?utf-8?B?UzVUN08yNGJLaVRmdVNySjBGODdLMWhSVXJJQXoxdHZTVDBESGcxMXhzWWRu?=
 =?utf-8?B?ZU5nbEVNT1JkVzJOemNxUjNmL3ptNEFYS3dEY3huZWV3Z0Q2VXdFaWY0cStv?=
 =?utf-8?B?UGgrMVJycEpzVHNUUW5wRXF6TFNxWTlBNW1KMWpDdGZZakdoZWp0cTRqS01l?=
 =?utf-8?B?bjZWQzN5RnR4Tnp2Qnl0S1czSTZGUUc4MEY5RjZBMDl5UlNHZmlxODlMVFJh?=
 =?utf-8?B?b2dWZndGZnhaUkplek5IL0VRblpmTEtuRTlDVis0d0hQQktPZU05UWVHRGNm?=
 =?utf-8?B?Wm5GRTN1MVNJemx6WlVpb2VYSXMyeXZBWTlPTUhHMkRYWE5mNHpiTWFKb1pQ?=
 =?utf-8?B?TElaem1TNm1sdTI3S29BNlhrdDdIM0FiUnBUSUJLQi9reWs0NHBMbGltU3pm?=
 =?utf-8?B?NktPUDJtMktHNCthU1FiSUJZcmRyRDN5RWtwNlJ0alZqZzZabitFcWZRb21Y?=
 =?utf-8?B?TXlkb1hXZUVvSEpwTyszUUFhUWx4ZjU3RzJTQXhNMlc1UjdYNWRZYUxiU0ZL?=
 =?utf-8?B?OUY1R0h6UzArMWdoa2hZOXM1QUNtanNyR01lWTIvZVhIY3UxeWkwRFUxR3l5?=
 =?utf-8?B?ZlVCb3I5Q1Fpd3ltZmU1ODhjcGtpY1hvMDBtVndmWlRFLzVabHByK1drQ3Nk?=
 =?utf-8?B?U3d3WGtMTHNIQTkxNThkVm5YbzdMVzhDVkNmVEhGNlF6aWdDdWwxbW1tek1E?=
 =?utf-8?B?MFFGYlV5V1cyRFJ3cjdqVFF0T045TlBXWVhYcEtrQTV0MDEzK2ZMRzF2RFhB?=
 =?utf-8?Q?Scppzf+blSyWCj7pc3QNcFKOo?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	C/1wIJsAB1yIV0VO9M41jFSED/t3ubYxqz/FNrw1qVm7eyzICH0SUZRPhRNFDzgrkXeA9TiMBvmxFJv9Q2epx33CLXk+AfnbpMYpHMnYwW15QVJen7vMCWlDjVQT051tMjomzbsWTB1Tg7MwdJfshgNkWmcCaWQ/y83eft19LHV2vwDze7Al1/tX71CaROlItk6El7TkgTcmJqsSZFdBfO4XE29Fz0RUPQMOrPtUbA9wcjKiMuI4MPuGl3Bnsn8AzAXabSqU+34wLgqgWoltWXRkhgnhclSgLDXAu1vWfUQgBz+wq+LPRw44YCPEcjyGXYEdQDuA4R898buXMgQs2nYt6hUYFHfNSQ+B3jUA7TUPiyCICiYNTmk6EDic1JD7LV/tiXZD1Ih0cdD1TxcyHQM1gdnaziTczQEZua8AlP40L4NFiHKRHNwa0SkKW6Fc+cU/OIdTIx1bmSshYx0PYtTNLEkwdFFLxmkOvkKL99gvuWFuPckQgHcagdgylJTnop6EkqBKx9qVByh4A7dre/Hw3TYnwbzgAG1ISbzj5EUaRA8KuV92gROBIpGGU6QYYOCpMlO1XsV4CVnZXOsfckANeYp0z6xa+tR6flZ51sCWLwRm6NlT3O27JwL92ZH3TDr1qxS5JDjb7uZ+2GN1/P47JiYJf5QZaQGAp75DYOQa1J+aV/vxPgo+Iw0YunqISmykRFZw90K37lhTeePBNlLG/eKJU+CO14zhE2ZUb9PQk7wi4lYk0ThvRnCNBsn7Wq1YuZq7HTYOCu4CXB29kY6EFTPE7L02CqaPRsqdDhSlYpa30WP/VsvH/jAh2NH8lVFSj0QCvN93ocEATIdBrcxjC4ZJAMQYb/akotQBR4Zsl5dqvz6dDt5nA6GnYeOyRiGu+wlczQiRpbcjoNw/vg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf01684d-cb26-42b6-7171-08dbefbe27a4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 03:00:19.2820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VrTdsFEsd95+LNZWHGP/RpXpXpdIWw+FJUVP9qstfksAH/3RjJ1o5gw7LcjY3z9qREjJR2pNqLrXX1gLmmkzWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5126
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_01,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0
 suspectscore=0 mlxscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311280022
X-Proofpoint-GUID: 0pjq3Lw-vyTFmXEvdbPAKxoSAdMGKRmZ
X-Proofpoint-ORIG-GUID: 0pjq3Lw-vyTFmXEvdbPAKxoSAdMGKRmZ
Subject: Re: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands



On 11/23/2023 6:29 PM, Jason Wang wrote:
> On Thu, Nov 23, 2023 at 9:19 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>
>>
>> On 11/21/2023 9:31 PM, Jason Wang wrote:
>>> On Wed, Nov 22, 2023 at 10:31 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>>> (dropping my personal email abandoned for upstream discussion for now,
>>>> please try to copy my corporate email address for more timely response)
>>>>
>>>> On 11/20/2023 10:55 PM, Jason Wang wrote:
>>>>> On Fri, Nov 17, 2023 at 10:48 PM Parav Pandit <parav@nvidia.com> wrote:
>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>>>> Sent: Friday, November 17, 2023 7:31 PM
>>>>>>> To: Parav Pandit <parav@nvidia.com>
>>>>>>>
>>>>>>> On Fri, Nov 17, 2023 at 01:03:03PM +0000, Parav Pandit wrote:
>>>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>>>>>> Sent: Friday, November 17, 2023 6:02 PM
>>>>>>>>>
>>>>>>>>> On Fri, Nov 17, 2023 at 12:11:15PM +0000, Parav Pandit wrote:
>>>>>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>>>>>>>> Sent: Friday, November 17, 2023 5:35 PM
>>>>>>>>>>> To: Parav Pandit <parav@nvidia.com>
>>>>>>>>>>>
>>>>>>>>>>> On Fri, Nov 17, 2023 at 11:45:20AM +0000, Parav Pandit wrote:
>>>>>>>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>>>>>>>>>> Sent: Friday, November 17, 2023 5:04 PM
>>>>>>>>>>>>>
>>>>>>>>>>>>> On Fri, Nov 17, 2023 at 11:05:16AM +0000, Parav Pandit wrote:
>>>>>>>>>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>>>>>>>>>>>> Sent: Friday, November 17, 2023 4:30 PM
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> On Fri, Nov 17, 2023 at 10:03:47AM +0000, Parav Pandit wrote:
>>>>>>>>>>>>>>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>>>>>>>>>>>>>>> Sent: Friday, November 17, 2023 3:30 PM
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> On 11/16/2023 7:59 PM, Michael S. Tsirkin wrote:
>>>>>>>>>>>>>>>>>> On Thu, Nov 16, 2023 at 06:28:07PM +0800, Zhu,
>>>>>>>>>>>>>>>>>> Lingshan
>>>>>>>>> wrote:
>>>>>>>>>>>>>>>>>>> On 11/16/2023 1:51 PM, Michael S. Tsirkin wrote:
>>>>>>>>>>>>>>>>>>>> On Thu, Nov 16, 2023 at 05:29:54AM +0000, Parav
>>>>>>>>>>>>>>>>>>>> Pandit
>>>>>>>>> wrote:
>>>>>>>>>>>>>>>>>>>>> We should expose a limit of the device in the
>>>>>>>>>>>>>>>>>>>>> proposed
>>>>>>>>>>>>>>>>> WRITE_RECORD_CAP_QUERY command, that how much
>>>>>>> range
>>>>>>>>>>>>>>>>> it can
>>>>>>>>>>>>> track.
>>>>>>>>>>>>>>>>>>>>> So that future provisioning framework can use it.
>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>> I will cover this in v5 early next week.
>>>>>>>>>>>>>>>>>>>> I do worry about how this can even work though.
>>>>>>>>>>>>>>>>>>>> If you want a generic device you do not get to
>>>>>>>>>>>>>>>>>>>> dictate how much memory VM
>>>>>>>>>>>>> has.
>>>>>>>>>>>>>>>>>>>> Aren't we talking bit per page? With 1TByte of
>>>>>>>>>>>>>>>>>>>> memory to track
>>>>>>>>>>>>>>>>>>>> -> 256Gbit -> 32Gbit -> 8Gbyte per VF?
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> And you happily say "we'll address this in the future"
>>>>>>>>>>>>>>>>>>>> while at the same time fighting tooth and nail
>>>>>>>>>>>>>>>>>>>> against adding single bit status registers because
>>>>>>> scalability?
>>>>>>>>>>>>>>>>>>>> I have a feeling doing this completely
>>>>>>>>>>>>>>>>>>>> theoretical like this is
>>>>>>>>>>>>> problematic.
>>>>>>>>>>>>>>>>>>>> Maybe you have it all laid out neatly in your
>>>>>>>>>>>>>>>>>>>> head but I suspect not all of TC can picture it
>>>>>>>>>>>>>>>>>>>> clearly enough based just on spec
>>>>>>>>>>>>> text.
>>>>>>>>>>>>>>>>>>>> We do sometimes ask for POC implementation in
>>>>>>>>>>>>>>>>>>>> linux / qemu to demonstrate how things work
>>>>>>>>>>>>>>>>>>>> before merging
>>>>>>>>> code.
>>>>>>>>>>>>>>>>>>>> We skipped this for admin things so far but I
>>>>>>>>>>>>>>>>>>>> think it's a good idea to start doing it here.
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> What makes me pause a bit before saying please
>>>>>>>>>>>>>>>>>>>> do a PoC is all the opposition that seems to
>>>>>>>>>>>>>>>>>>>> exist to even using admin commands in the 1st
>>>>>>>>>>>>>>>>>>>> place. I think once we finally stop arguing
>>>>>>>>>>>>>>>>>>>> about whether to use admin commands at all then
>>>>>>>>>>>>>>>>>>>> a PoC will be needed
>>>>>>>>>>>>>>> before merging.
>>>>>>>>>>>>>>>>>>> We have POR productions that implemented the
>>>>>>>>>>>>>>>>>>> approach in my
>>>>>>>>>>>>> series.
>>>>>>>>>>>>>>>>>>> They are multiple generations of productions in
>>>>>>>>>>>>>>>>>>> market and running in customers data centers for years.
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> Back to 2019 when we start working on vDPA, we
>>>>>>>>>>>>>>>>>>> have sent some samples of production(e.g.,
>>>>>>>>>>>>>>>>>>> Cascade
>>>>>>>>>>>>>>>>>>> Glacier) and the datasheet, you can find live
>>>>>>>>>>>>>>>>>>> migration facilities there, includes suspend, vq
>>>>>>>>>>>>>>>>>>> state and other
>>>>>>>>> features.
>>>>>>>>>>>>>>>>>>> And there is an reference in DPDK live migration,
>>>>>>>>>>>>>>>>>>> I have provided this page
>>>>>>>>>>>>>>>>>>> before:
>>>>>>>>>>>>>>>>>>> https://doc.dpdk.org/guides-21.11/vdpadevs/ifc.ht
>>>>>>>>>>>>>>>>>>> ml, it has been working for long long time.
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> So if we let the facts speak, if we want to see
>>>>>>>>>>>>>>>>>>> if the proposal is proven to work, I would
>>>>>>>>>>>>>>>>>>> say: They are POR for years, customers already
>>>>>>>>>>>>>>>>>>> deployed them for
>>>>>>>>>>>>> years.
>>>>>>>>>>>>>>>>>> And I guess what you are trying to say is that
>>>>>>>>>>>>>>>>>> this patchset we are reviewing here should be help
>>>>>>>>>>>>>>>>>> to the same standard and there should be a PoC? Sounds
>>>>>>> reasonable.
>>>>>>>>>>>>>>>>> Yes and the in-marketing productions are POR, the
>>>>>>>>>>>>>>>>> series just improves the design, for example, our
>>>>>>>>>>>>>>>>> series also use registers to track vq state, but
>>>>>>>>>>>>>>>>> improvements than CG or BSC. So I think they are
>>>>>>>>>>>>>>>>> proven
>>>>>>>>>>>>>>> to work.
>>>>>>>>>>>>>>>> If you prefer to go the route of POR and production
>>>>>>>>>>>>>>>> and proven documents
>>>>>>>>>>>>>>> etc, there is ton of it of multiple types of products I
>>>>>>>>>>>>>>> can dump here with open- source code and documentation and
>>>>>>> more.
>>>>>>>>>>>>>>>> Let me know what you would like to see.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Michael has requested some performance comparisons,
>>>>>>>>>>>>>>>> not all are ready to
>>>>>>>>>>>>>>> share yet.
>>>>>>>>>>>>>>>> Some are present that I will share in coming weeks.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> And all the vdpa dpdk you published does not have
>>>>>>>>>>>>>>>> basic CVQ support when I
>>>>>>>>>>>>>>> last looked at it.
>>>>>>>>>>>>>>>> Do you know when was it added?
>>>>>>>>>>>>>>> It's good enough for PoC I think, CVQ or not.
>>>>>>>>>>>>>>> The problem with CVQ generally, is that VDPA wants to
>>>>>>>>>>>>>>> shadow CVQ it at all times because it wants to decode
>>>>>>>>>>>>>>> and cache the content. But this problem has nothing to
>>>>>>>>>>>>>>> do with dirty tracking even though it also
>>>>>>>>>>>>> mentions "shadow":
>>>>>>>>>>>>>>> if device can report it's state then there's no need to shadow
>>>>>>> CVQ.
>>>>>>>>>>>>>> For the performance numbers with the pre-copy and device
>>>>>>>>>>>>>> context of
>>>>>>>>>>>>> patches posted 1 to 5, the downtime reduction of the VM is
>>>>>>>>>>>>> 3.71x with active traffic on 8 RQs at 100Gbps port speed.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Sounds good can you please post a bit more detail?
>>>>>>>>>>>>> which configs are you comparing what was the result on each of
>>>>>>> them.
>>>>>>>>>>>> Common config: 8+8 tx and rx queues.
>>>>>>>>>>>> Port speed: 100Gbps
>>>>>>>>>>>> QEMU 8.1
>>>>>>>>>>>> Libvirt 7.0
>>>>>>>>>>>> GVM: Centos 7.4
>>>>>>>>>>>> Device: virtio VF hardware device
>>>>>>>>>>>>
>>>>>>>>>>>> Config_1: virtio suspend/resume similar to what Lingshan has,
>>>>>>>>>>>> largely vdpa stack
>>>>>>>>>>>> Config_2: Device context method of admin commands
>>>>>>>>>>> OK that sounds good. The weird thing here is that you measure
>>>>>>> "downtime".
>>>>>>>>>>> What exactly do you mean here?
>>>>>>>>>>> I am guessing it's the time to retrieve on source and re-program
>>>>>>>>>>> device state on destination? And this is 3.71x out of how long?
>>>>>>>>>> Yes. Downtime is the time during which the VM is not responding or
>>>>>>>>>> receiving
>>>>>>>>> packets, which involves reprogramming the device.
>>>>>>>>>> 3.71x is relative time for this discussion.
>>>>>>>>> Oh interesting. So VM state movement including reprogramming the CPU
>>>>>>>>> is dominated by reprogramming this single NIC, by a factor of almost 4?
>>>>>>>> Yes.
>>>>>>> Could you post some numbers too then?  I want to know whether that would
>>>>>>> imply that VM boot is slowed down significantly too. If yes that's another
>>>>>>> motivation for pci transport 2.0.
>>>>>> It was 1.8 sec down to 480msec.
>>>>> Well, there's work ongoing to reduce the downtime of the shadow virtqueue.
>>>>>
>>>>> Eugenio or Si-wei may share an exact number, but it should be several
>>>>> hundreds of ms.
>>>> That was mostly for device teardown time at the the source but there's
>>>> also setup cost at the destination that needs to be counted.
>>>> Several hundred of milliseconds would be the ultimate goal I would say
>>>> (right now the numbers from Parav more or less reflects the status quo
>>>> but there's ongoing work to make it further down), and I don't doubt
>>>> several hundreds of ms is possible. But to be fair, on the other hand,
>>>> shadow vq on real vdpa hardware device would need a lot of dedicated
>>>> optimization work across all layers (including hardware or firmware) all
>>>> over the places to achieve what a simple suspend-resume (save/load)
>>>> interface can easily do with VFIO migration.
>>> That's fine. Just to clairfy, shadow virtqueue here doesn't mean it
>>> can't save/load. We want to see how it is useful for dirty page
>>> tracking since tracking dirty pages by device itself seems problematic
>>> at least from my point of view.
>> TBH I don't see how this comparison can help prove the problematic part
>> of device dirty tracking, or if it has anything to do with.
> Shadow virtqueue is not used to prove the problem, the problem could
> be uncovered during the review.
>
> The shadow virtuqueue is used to give us a bottom line. If a huge
> effort were done for spec but it can't perform better than virtqueue,
> the effort became meaningless.
Got it. Thanks for detailed clarifications, Jason. So it's not device 
assisted dirty tracking itself you find issue with, but just the 
flaw/inefficiency in the current proposal as pointed out in previous 
discussions?  In other word, does it make sense to you if certain device 
assisted tracking scheme is proved to be helpful or perform better than 
the others, and its backed by real performance data, be it shadow vq or 
platform IOMMU tracking in just a few scenarios or in the mostly common 
used set up, then is it acceptable to you even if the same device 
tracking mechanism doesn't support or doesn't have reasonably good value 
for other scenarios (for e.g. PASID, ATS, vIOMMU and etc as you listed 
below)?

It's up to the author to further improve on the current spec proposal, 
but if the device assisted tracking itself in general is problematic and 
prohibited even if proved to be best performing for some (but not ALL) 
use cases, I will be very surprised to know the reason why, as it is 
just an optional device feature aiming to be self-contained in virtio 
itself, without having to depending on vendor specific optimization 
(like vdpa shadow vq).

Thanks
-Siwei
>
>> In many
>> cases vDPA and hardware virtio are for different deployment scenarios
>> with varied target users, I don't see how vDPA can completely substitute
>> hardware virtio for many reasons regardless shadow virtqueue wins or not.
> It's not about whether vDPA can win or not. It's about a quick
> demonstration about how shadow virtqueue can perform.  From the view
> of the shadow virtqueue, it doesn't know whether the underlayer is
> vDPA or virtio. It's not hard to imagine, the downtime we get from
> vDPA is the bottom line of downtime via virtio since virtio is much
> more easier.
>
>> If anything relevant I would more like to see performance comparison
>> with platform dirty tracking via IOMMUFD, but that's perhaps too early
>> stage at this point to conclude anything given there's very limited
>> availability (in terms of supporting software, I know some supporting
>> hardware has been around for a few years) and none of the potential
>> software optimizations is in place at this point to make a fair
>> comparison for.
> We need to make sure the correctness of the function before we can
> talk about optimizations. And I don't see how this proposal is
> optimized for many ways.
>
>> Granted device assisted tracking has its own set of
>> limitations e.g. loose coupling or integration with platform features,
>> lack of nested and PASID support et al. However, state of the art for
>> platform dirty tracking is not perfect either, far off being highly
>> optimized for all types of workload or scenarios. At least to me the
>> cost of page table walk to scan all PTEs across all levels is not easily
>> negligible - given no PML equivalent here, are we sure the whole range
>> scan can be as efficient and scalable as memory size / # of PTEs grows?
> If you see the discussion, this proposal requires scan PTEs as well in
> many ways.
>
>> How large it may impact the downtime with this rudimentary dirty scan?
>> No data point was given thus far. If chances are that there could be
>> major improvement from device tracking for those general use cases to
>> supplement what platform cannot achieve efficiently enough, it's not too
>> good to kill off the possibility entirely at this early stage. Maybe a
>> PoC or some comparative performance data can help prove the theory?
> We can ask in the thread of IOMMUFD dirty tracking patches.
>
>> On the other hand, the device assisted tracking has at least one
>> advantage that platform cannot simply offer - throttle down device for
>> convergence, inherently or explicitly whenever needed.
> Please refer the past discussion, I can see how it is throttled in the
> case of PML similar mechanism. But I can't see how it can be done
> here. This proposal requires the device to reserver sufficient
> resources where the throttle is implementation specific where the
> hypervisor can't depend on. It needs API to set dirty page rates at
> least.
>
>> I think earlier
>> Micheal suggested something to make the core data structure used for
>> logging more efficient and compact, working like PML but using a queue
>> or an array, and the entry of which may contain a list of discrete pages
>> or contiguous PFN ranges.
> PML solve the resources problem but not other problem:
>
> 1) Throttling: it's still not something that hypervisor can depend.
> The reason why PML in CPU work is that hypervisor can throttle the KVM
> process so it can slow down to the expected dirty rates.
> 2) Platform specific issue: PASID, ATS, translation failures, reserved
> regions, and a lot of other stuffs
> 3) vIOMMU issue: horrible delay in IOTLB invalidation path
> 4) Doesn't work in the case of vIOMMU offloading
>
> And compare the the existing approach, it ends up with more PCI
> transactions under heavy load.
>
>> On top of this one may add parallelism to
>> distribute load to multiple queues, or add zero copy to speed up dirty
>> sync to userspace - things virtio queues are pretty good at doing. After
>> all, nothing can be perfect to begin with, and every complex feature
>> would need substantial time to improve and evolve.
> Evolve is good, but the problem is platform is also evolving. The
> function is duplicated there and platform provides a lot of advanced
> features that can co-operate with dirty page tracking like vIOMMU
> offloading where it almost impossible to be done in virtio. Virtio
> needs to leverage the platform or transport instead of reinventing
> wheels so it can focus on the virtio device logic.
>
>> It does so for shadow
>> virtqueue from where it gets started to where it is now, even so there's
>> still a lot of optimization work not done yet. There must be head room
>> here for device page tracking or platform tracking, too.
> Let's then focus on the possible issues (I've pointed out a brunches).
>
> Thanks
>
>> Regards,
>> -Siwei
>>
>>
>>> Shadow virtqueue can be used with a save/load model for device state
>>> recovery for sure.
>>>
>>>>> But it seems the shadow virtqueue itself is not the major factor but
>>>>> the time spent on programming vendor specific mappings for example.
>>>> Yep. The slowness on mapping part is mostly due to the artifact of
>>>> software-based implementation. IMHO for live migration p.o.v it's better
>>>> to not involve any mapping operation in the down time path at all.
>>> Yes.
>>>
>>> Thanks
>>>
>>>> -Siwei
>>>>> Thanks
>>>>>
>>>>>> The time didn't come from pci side or boot side.
>>>>>>
>>>>>> For pci side of things you would want to compare the pci vs non pci device based VM boot time.
>>>>>>
>>>>> This publicly archived list offers a means to provide input to the
>>>>>
>>>>> OASIS Virtual I/O Device (VIRTIO) TC.
>>>>>
>>>>>
>>>>>
>>>>> In order to verify user consent to the Feedback License terms and
>>>>>
>>>>> to minimize spam in the list archive, subscription is required
>>>>>
>>>>> before posting.
>>>>>
>>>>>
>>>>>
>>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>>>>>
>>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>>>>>
>>>>> List help: virtio-comment-help@lists.oasis-open.org
>>>>>
>>>>> List archive: https://lists.oasis-open.org/archives/virtio-comment/
>>>>>
>>>>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
>>>>>
>>>>> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
>>>>>
>>>>> Committee: https://www.oasis-open.org/committees/virtio/
>>>>>
>>>>> Join OASIS: https://www.oasis-open.org/join/
>>>>>
>>>> This publicly archived list offers a means to provide input to the
>>>> OASIS Virtual I/O Device (VIRTIO) TC.
>>>>
>>>> In order to verify user consent to the Feedback License terms and
>>>> to minimize spam in the list archive, subscription is required
>>>> before posting.
>>>>
>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>>>> List help: virtio-comment-help@lists.oasis-open.org
>>>> List archive: https://lists.oasis-open.org/archives/virtio-comment/
>>>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
>>>> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
>>>> Committee: https://www.oasis-open.org/committees/virtio/
>>>> Join OASIS: https://www.oasis-open.org/join/
>>>>
>>> This publicly archived list offers a means to provide input to the
>>>
>>> OASIS Virtual I/O Device (VIRTIO) TC.
>>>
>>>
>>>
>>> In order to verify user consent to the Feedback License terms and
>>>
>>> to minimize spam in the list archive, subscription is required
>>>
>>> before posting.
>>>
>>>
>>>
>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>>>
>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>>>
>>> List help: virtio-comment-help@lists.oasis-open.org
>>>
>>> List archive: https://lists.oasis-open.org/archives/virtio-comment/
>>>
>>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
>>>
>>> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
>>>
>>> Committee: https://www.oasis-open.org/committees/virtio/
>>>
>>> Join OASIS: https://www.oasis-open.org/join/
>>>


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

