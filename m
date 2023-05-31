Return-Path: <virtio-comment-return-6059-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D203FC77B73
	for <virtio-comment@archiver.kernel.org>; Wed, 31 May 2023 22:23:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4682133580
	for <virtio-comment@archiver.kernel.org>; Wed, 31 May 2023 22:23:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0F0C9986611
	for <virtio-comment@archiver.kernel.org>; Wed, 31 May 2023 22:23:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DF8DB984213; Wed, 31 May 2023 22:23:01 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C95569865DB;
	Wed, 31 May 2023 22:23:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FShQk/iLdZ5bnkwD6p3Cbu4RVuj/A8sjRTRcefVX5MZILy+H5MziDvwQEkhaUZdD/JN7pY1s1nLpBmKDB0XdwhmLN+4Ofv2IFDHso9R2DeR8kk/IXWX3WTGGGY5jT2RqUcymbbbvpq0sy9pkDuktvegvdV6LDUJCX/Vp5x78XSS57v/akZMTvKiq/vTO7h99DjAulkomDWksYuNHv9kctn5OqaUFQ+jA73qp6G/fy3wgn/s38gIEitDHJcN68SqqKX6//qGZza1/Y4cN13XcNV0lGk0kfUnP433lh11SMBi6LCPwnTH+f9VLB3GtT51VnmQGXXXMqGL6iCOFiZ46ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9S2vD5M5OZg4GD9UKsOCm52xlTFJS4mmGetDkAmoDtE=;
 b=bmageHh3vEs5A1PRnZKYIsbDPxgkB0I192UUmDILOpFAC2kZn+8Kfoz/UB57khX2oK+R9Iku89+O9ygHoUW3BlGuSKdqb9oh7YZuwWrecPwB+QRbvrPRyYfHH+emptkwSK+zFfwmhjq+Vrt/JjeH2MIqPjErlYenIs7GHFr1i3mRBRSi023ieKG+4LxpEM/2ZrXCHVUSAfaUqj8f7rSgM3OiD/ad0TR6jG5PqvZSkS/qdIc7GV+ZbYPfMKdIqPCth0azAffK4OWp+bodnjucWqBIZHj2Q6LIhAvcBDnHM1pdhZkIsjqpgrJCBwM8qbya+tQMFacuroH960hqUykZ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
Message-ID: <b2e85349-35e2-23ed-46c9-20f0cf47760f@oracle.com>
Date: Wed, 31 May 2023 15:22:44 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Parav Pandit <parav@nvidia.com>,
        "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
Cc: "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>
References: <PH0PR12MB54816668AFE3CF0F90C8F342DC7F9@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <PH0PR12MB54816668AFE3CF0F90C8F342DC7F9@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:806:21::17) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|SA1PR10MB7832:EE_
X-MS-Office365-Filtering-Correlation-Id: 934a4ae8-f3bd-4280-188e-08db62258ff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	c538PuiQAhbGsBHf8zI8yNwpNubf1v1q335yvZ51UatGGoYKgfKCtl2DgCcWW7z58CPQfEtY0l+EbyRa6Tj+eNgED/jDHVZehGdEYoyINS4hGu00VJTX426wBl2PhYp7do+Tn5UJhYlqpmmbg74IZ81Ms0L+0tuPYPYaDVXxyC5x4jjQ3u09sj+mKtUlvFSuzCk51G9hA9Wcxz36ClgBZ8VzMtg0QPx+RLN1Vx6FuM+n1n64r0Vve3+0URJfVXWoYCXVLXPhdtQ6HLKtaYv4cDaUsq8KVS1o0Vj7dtgcz+LOyax03VqXlMfaXjh3tloU406nww7+Ey1qZoC+FoH6BeYgcCcwOTN2bHHCob/EyTPCUewmNJUxOhyuBorauvkp23HkhoC80rsd2xkkvKgzgbupKctIp180aHc9mOruV0oleW5Wp3HEELijzfJ1UthzsTb8YUujpWjPn+2yi7Yp7cDYaauk1yk0+d13OZU6vQsEFkiTTKs1X/58cZIY3Q1+TntnxDw+ZjfVtLu1y2EDUJn3l1TwJD+P5jgv/1Bw7T9E9NWLozbgxWRFMmkYZIznpDS2FX81sbBaFwOzDmp4R7l4ttYyPz3LSUNoLzRyJhkqmMJP4p7zvbdPyu945ccw7+Ot9wgd8bSwy9MVwge5tnakMlcnkyfOnqHTJTu6V6vhPFjNgBgfd/j3ZYTOQLbb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6535.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(346002)(396003)(376002)(39860400002)(451199021)(31686004)(66899021)(83380400001)(4326008)(36756003)(38100700002)(41300700001)(316002)(53546011)(6486002)(36916002)(6666004)(966005)(26005)(66556008)(66476007)(6512007)(66946007)(6506007)(478600001)(8936002)(2906002)(31696002)(5660300002)(8676002)(2616005)(110136005)(86362001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c0RqQjg1aUFZWC93QTJEaXpPVTI1OHZ6eU0rUTBqUkFvYmM2cHNPamU1U200?=
 =?utf-8?B?OGFtcDZoVFhvUmNpOUJFdkJqS3B0U2QxVlM4Ykh1ZnliY1dEQ2gwSEFyZDZx?=
 =?utf-8?B?Qlg0QUczdGZWbVVrblFDdDhxVDVTS3JscHJtaEpqVHFwN0JFbENEK1ZkWkY5?=
 =?utf-8?B?Smx2WTc3dE1zcmx4b0NkM1dHQ1k5WUNGUXNqalZXT2lQUTZ1dE5SRXdiTHNH?=
 =?utf-8?B?SXhid2VxMVpsMUxXU29La1dmcGdsSitnV2traWR3RkxkdFpyOE0rREFaUkxZ?=
 =?utf-8?B?SVovb1BlV2dROWlJalkrL2t6RkNEQ3hnYUxCWU1aUlNScVRkb1ZETGphUWhk?=
 =?utf-8?B?TCs5YmkzSVZhNkQ4aWtUckdReTQ1eE45V2l1aDhoSy9XMGhwV2tvSmlvQ3Nw?=
 =?utf-8?B?cEh3MlRaaktjZzNPbU01dXVBM21aNFBpUU1IWE9HYVFOUXpWcUVOUTlxM1ZG?=
 =?utf-8?B?SnNvTkpoZ211MkZrSHFHdjZ4Nmp2Vlo1SmJlSzVYaUd5eEd2MHhsZCtWK0JQ?=
 =?utf-8?B?Nk0wNzBDWUNDYzhTRFBTN3VJUUlBU00wN0ZhWEhxK3ZWSjhWSnVNSWNId3pj?=
 =?utf-8?B?ZEF6amhBOHZjQlNNVUd5RWxxZFUwTXR3NlBocW5CWlkrSHFoUDQycElhN0hv?=
 =?utf-8?B?SmlBYWhZaFBHNTBMVjRadzQxRjJyblNDWTBvcWI3NzNKWDhhTzc3eE1LM1Yz?=
 =?utf-8?B?V0ozRWFmM0FuaU12bW9Eb0tlNWFSbWxpaXdRVGtkTTBlUzgzRThvVFdaSkV2?=
 =?utf-8?B?WkVrVGY2Q1FEeFVBM1h3eE16QnViK0hCdFZ3ZEE2azIzbTRJVElWdDViVWFt?=
 =?utf-8?B?YXR1QzNRdlhoaFlabVpjbXZPenZNS0piUWNFMFlCRGMwSlBmQXdJZnZUdmtx?=
 =?utf-8?B?YldvdmdwNnk5dzNkYnJubzZFZElPWFoyU0FwdW5ZNjlrV2VnLzdjclpPeG1P?=
 =?utf-8?B?VmQvbHRTY0NEN1l6Y25kUUQ2UHhSZkovcWtnU1lYM1VNSEZRc3BPWFNvMFAw?=
 =?utf-8?B?djVBYVlTeEtEU2ZiMlYxcVV4RTkwSFNteVVjYmIyY3ZqemJPVm5mQW5STG9Z?=
 =?utf-8?B?ZnpXd0EySDhiTVEvMjcxeFBKN2hNMmdHZ05TU2VwVGRoS2xPMXZCT3J4UTZS?=
 =?utf-8?B?ZndUVUZ2U3NwVkZIaTlUVXFpWDYzSyszWGVXS29aVmpTT3VZV25TdUdGVVd2?=
 =?utf-8?B?TncwaGhQWFhtbHRkeEloU2FsU3pzN2g3bkFmUjVaQ0lMNVAyYzJ0R0wza3pF?=
 =?utf-8?B?YXZ4dE9veVdGL00vQmZPQW5EMWZhaGwwQno1ekhOY09GVUtadWtYUEViSWxB?=
 =?utf-8?B?Sk1kbzlFYTA2Zm4rTWhCMEhLaEJNckpYTlB4WWt6VDJhNzRhc1FBMXhUUTE2?=
 =?utf-8?B?YjNkQXc3dUsxQklDbmxmK2Z0aWlVVFdZOUIycG9BbXh3cVJFWSsvTHVzR2F6?=
 =?utf-8?B?bG0wQzF6NS90OE5JME1tbDh3OGN0RTdWbnRFRUwrSlBqVzAzOGdKZ054bjR4?=
 =?utf-8?B?dVZCZzZLWlBmWHlmM1pYY3FHczNRVnZjTEtuOTdQcmREOEFaUWErZHl3bXN3?=
 =?utf-8?B?K2ZTU1hwT2RqTlY5Rnk4akhuOGRBS1ErQUlqdkZOc05xdis3M2F2N01Iamp6?=
 =?utf-8?B?YU5jUmJCeWJKNnl3ZlUrU2h2dW9CR3dFOXlhbUpqSWxGL3FCTVhXa0tmTEly?=
 =?utf-8?B?NUhoRi9QWmYwVkUySGZNcGhOcEt4cnhhblJIZlcwWTc1dlN1Tjd3cWZDTmh0?=
 =?utf-8?B?N296dUh2QnEyaTBhWUlJQmxYbHdyVDlLZmMxOTlicTc1MzF3S2g0SXZMRzdZ?=
 =?utf-8?B?dnpJQnVqTUFzVExJU1dxWGtLSFZEcXJrTHpDSzlXeWVJVVVhWnIvREEwYW1l?=
 =?utf-8?B?ZGR4SU9CenFxOG42VlZBOXdwQmZsa3ZBRS9JYkUydkxrVS8rZnpEZGg4UC9G?=
 =?utf-8?B?bWRhNGNOZ3RVWWpOWXg3NGpNV0dFUFBxcVVGV051ZGpuNGI2dmd4SkJnUzVx?=
 =?utf-8?B?K09Dd2ZQNjcxOTF4amg5ZCtsTFZNclBJajIwOHJEUUZveUx0MkFVbFZKUmhX?=
 =?utf-8?B?bFhmRkpQZlQ5Snl3emdZMUpPT0JjamxhWWdNaFQ3NkJheHRTSEZwc2lvR0FP?=
 =?utf-8?Q?FiE1Lu3IsYm1n9MEnV1vF6Snu?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	/s+WiYh2QUsN97dFJYIC1kv5BNL/KuAK64nf7maMjNe4fLAZ5oXIRpC554Olfp5o5rOWyaJZgUeq/IwMPz2oTWLFjHJJJIEyBvkXV8i6MDclBqC2WblhvOI4LKLFFc25SaEkYg3bHMUevIDTbgcRMCe31gxY9QmEwryw4KZHs/HjKPjIBqnhjWNxTVRm5WqD373CPOGJTbOxqGiWuj+WppfgL77nNDQxLtAtIwLgvnnEWjnWQg2EmAxSPw2uPMh3WjOMFeOsB2IMqfrrvoP0f5iGoP6rKvxqq/ww5QWMlAes7LXe3wIgp8dZl0TAJ6/LH3F4bkhwAAQOEQ4iEv0rJZc6gksWolyoAT5X0/SJohDWcV1t25RhRxNcWKH+tu93rbPoVMA09x+Fsl1Gfm8bKsqem/JAAXm8dA1B4i/mnjjFschLfT+odT9JGDxw8kE0cCxD9rqMPKGE9aglGj9MOT9JG1OVHMSHNFR2cCOmGBUG9XyxisxbYbM7iiP2TZQS7XhMNjRq4exvqneS9riBfo8diM+dA2pm9wt2L4XNt2VMhQbMPcNfQ1Ali9+SWVOvnLZ7I8EA9A3+V2yzjGIohaUhBkkkrP9RlfI5lwLVFxZ88DD6RuwzhTwPKD3PGJGzAV5djXa0oedX6hjeNdZac0b3EtkxPaydq2LUZn3VQssnRBzEGV260tSA1fkN5YUn9x/P/WSjIBYIMaZJk3eU2wJrWNkX13W9fowCU6Kh5F3Q0CeUtm7Ij72udwEeBQYAEqayoQLL4OkFIBnmsAmDlVHrNavK41YGHtH07aoeuBq40/r8aR3dHIt1/BPhEHvh
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 934a4ae8-f3bd-4280-188e-08db62258ff1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 22:22:47.6392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xt92t04YB26CiS1X+w3IENSWz5Fxcm6X3b2iZj8C9ry8g/hJCV69URdZb3PdBkMFhfvXO0He7GSGHMaDWreO7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7832
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-31_16,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305310188
X-Proofpoint-GUID: F2mDbVBjzwnXaYVM2Ur6C9Em_3qp31qR
X-Proofpoint-ORIG-GUID: F2mDbVBjzwnXaYVM2Ur6C9Em_3qp31qR
Subject: Re: [virtio-comment] virtio networking collaboration meeting: call
 for agenda



On 5/17/2023 5:53 PM, Parav Pandit wrote:
> Hi all,
>
> At the moment to my knowledge, many TC members are working on many new features for virtio network device specification - all of us working in parallel.
>
> I feel a biweekly meeting would help us virtio networking developers collaborate more effectively.
> For example, we can discuss how do features each one is working on interact, what timeframe is each one targeting, etc.
>
> I suggest:
> - A biweekly meeting using google meet.
> - Meeting agenda will be posted on list before a week so people
>    will have a full week to review, respond on the existing mailing lists.
> - If no agenda items for that meeting day, meeting will be cancelled.
> - Minutes will be posted on list after a meeting.
> - non-TC members can also join; this is an additional space to get input
>    from outside experts, under the existing terms of OASIS feedback license.
>
> - All decisions are still made by TC electronic ballot as usual. Proposed collaboration
>    meetings are unrelated to TC ballot. The point is ability to collaborate,
>    plan and split work better between developers working in the same spec area.
>
> For the first meeting, I propose the following agenda item:
> - discuss new virtio net device features for 1.4 spec release
>
> I suggest several day & time slots.
> Days:
> - Tue (May 30) or
> - Wed (May 31)
> Time:
> - 2 pm GMT, or
> - 5 am GMT
>
> We can pick other time/day options as well depending on who wants to attend and in which time zone.
5 am GMT Wednesday works for me. If possible, I would like to avoid 
scheduling it to the same week of the vdpa meeting, as I have to attend 
both.

Thanks,
-Siwei

>
> If all this sounds interesting to you, if you would like to attend this and hopefully future collaboration meetings,
> please reply with email, cc to list:
> a. preferred time slots that work for you.
> b. any items you would like to add to above agenda.
>
> Any other comments, suggestions?
>
> Regards,
> Parav Pandit
>
> This publicly archived list offers a means to provide input to the
>
> OASIS Virtual I/O Device (VIRTIO) TC.
>
>
>
> In order to verify user consent to the Feedback License terms and
>
> to minimize spam in the list archive, subscription is required
>
> before posting.
>
>
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>
> List help: virtio-comment-help@lists.oasis-open.org
>
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
>
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
>
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
>
> Committee: https://www.oasis-open.org/committees/virtio/
>
> Join OASIS: https://www.oasis-open.org/join/
>
>


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

