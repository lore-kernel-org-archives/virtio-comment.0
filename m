Return-Path: <virtio-comment-return-7093-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F9CC001B0
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 13:10:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F2C10190906
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 13:10:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D52CE986371
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 13:10:19 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C37C1983F78; Mon, 14 Aug 2023 13:10:19 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B25BD98633D;
	Mon, 14 Aug 2023 13:10:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZRf0wF3+GWX76ErL/UNXEXbwiqiUdovuMlNU6Z2zREdyJdvEgQMWjBkGOXORyXrQtliiqBOGp94+9zURAQ5plXBobvXMDtJ3gXALAACGuvcyCd3Yv2bW0u4u+JRFWepHwDVvNNTaupfrw+VjoyhpEdUZjp7hQvsNTgvzh+divCGHWKlgc3pCqvLZpx8tiDWqQzamDicUKISuKc03iNrprSzVg6JLnkrNbffky03pmygH4tQSbu3+700tvx4ys1SuwFBvI448rYvL8Km9Ir/Wc5J8TSTazBdlDhBfM5vNidrm7TqMqtj30cVuMCgsVQCLNqz3Z0LxE/B+sumUG+/dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNvC8VjFVHyKsccCkwrxByxGoMc85WdN7iErEAzAHrY=;
 b=YS3C79Zk6+qSYKwFaLV+TXUtMDh/r4eYH7A1K6wyLBxXebqoGhCRaTj3xg1JVwlL2jAMFTHnCAQd0VG8o1JlT8KdYKU009KUrHy+0zLiDPjds3ECKAodSePt6QjyAdvv6BeKJEbPUEaNQs8eFYv8g2O5Q6/ltSL+rppRnnoTjlmoPJof5bUvO6s5p364DbxHY3aTs03OL/GMOQnynyMHhr1eN5mE3kZzCA55AU41DpOIbXxq4Y8+/jF9+GElTFK5Qg9I8yCga4dE7rOYA9bmdT6svTmrX9FsWB7MSQR27PhHn3fd0QNB8rG/Cc6WRt1Ktqt+55BQi0hU/jeZxi1SDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-8-parav@nvidia.com> <m2jztx7rzz.fsf@oracle.com>
 <CA+FuTSeguCKk4zxZ0=Ebr1phZhF9kssHeGPn2eZj6SRNv2ewsA@mail.gmail.com>
User-agent: mu4e 1.10.3; emacs 30.0.50
From: David Edmondson <david.edmondson@oracle.com>
To: Willem de Bruijn <willemb@google.com>
Cc: Parav Pandit <parav@nvidia.com>, shahafs@nvidia.com,
        hengqi@linux.alibaba.com, virtio@lists.oasis-open.org,
        virtio-comment@lists.oasis-open.org
Date: Mon, 14 Aug 2023 14:09:37 +0100
In-reply-to: <CA+FuTSeguCKk4zxZ0=Ebr1phZhF9kssHeGPn2eZj6SRNv2ewsA@mail.gmail.com>
Message-ID: <m2fs4l7ot0.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0575.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::7) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB4926:EE_|CH3PR10MB7457:EE_
X-MS-Office365-Filtering-Correlation-Id: 30df2de5-9921-472e-3f73-08db9cc7c824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bMQ2/ru2FIUpDhUoxDMjyqpQg7PB3WR4YF2+Z+VHynisq4uc5HNHBfaVSxZkzDvG48zpbCFo3Rm4OLsOX2lHg93r5kr2tGPKqCs22olFCLqPo1GMnQ+66YDddBs+TTRxVPcYi0dsZeIOfZh+PJLq3t4qYG173qpjLXDffBRzyT7/skholIsN27f+80Ly8PcGs+jh7goLJJZB5P3bqmvkpWzdfa2ej19a3g9MM4dKNBjJGpp4SryPvtsvlE2LQjoOdmHs+m2Y5wXpgUveXYcjKSsvmjbWp0wp4lrmBX+DFEtVmHvX0Hletsq8iQ5qoC+UCOJh4ipLDO4v8iyouoISn/mPnYIjvk6MkHntaEaNe3LmlFoqkv8VnLuH0+qiJWjrtzO24rWHH8o5jX9fZBiTMxT8a/hx2AZlI19QdqSmMumRAXIHYCnHaLv/r6qLXqDrntkC722zSDPWzHe8UZaQ/lnPHcwjTgtTm+Gn3n3w+kHLVMsfvspCz3uKors8Ke4dKO1xdZonLix/ztjRIDgJS829Sbn/u40e+ry4XdD3BiSdBc7Un73Eep60DWSXpo/f
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB4926.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(366004)(39860400002)(396003)(136003)(186006)(1800799006)(451199021)(86362001)(2616005)(26005)(83380400001)(5660300002)(44832011)(4326008)(316002)(66556008)(6916009)(66946007)(8676002)(8936002)(41300700001)(6486002)(36756003)(6666004)(6512007)(6506007)(53546011)(478600001)(2906002)(66476007)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QXNvMTEyTzhKRUlBNDlvK2I1SSs2M2xIZUtMYVJrNC9iN3Z2dzlIdFhlSFV1?=
 =?utf-8?B?SE1sWXM5ZzlvWXVKWVJOc0d6N0lUY3Z6Z3FkdDl5WjlUTm9xNm03SnB2SUdv?=
 =?utf-8?B?SnozNkk0bGFCaFMySFgvWEUzVUpvSG9aL0VYV2tob05VQkl5b3ZlUjBSbmI4?=
 =?utf-8?B?aEZBVnlZc25tZDh5VU5Dd1p3QjcxRkhiSGgrN3c4cnY5SVRMODl6NDhYQjY2?=
 =?utf-8?B?aG9yMHR1cGVkTW9lL0R0ZjlyZE1BWkNsS042VnB3Z1o0V1ZnOTZSMkRVSjN0?=
 =?utf-8?B?aDhWUG9xQ1FnZkdRUFVVaWwrK3RQWk1uTzV0Y0dQU2FEOUVwSjFWRWRWRlFW?=
 =?utf-8?B?T010NWdHZlc3Tm5NZkJrZ3hvVjR3SmpOTDV5Tzlza21LeitWM1hpdWNjMXhs?=
 =?utf-8?B?WG1kOENVQ09nZ1Z3cnZxWG5JbWNXeTdBK254R3pyaXVJcU5FMzVYRnBpTnBu?=
 =?utf-8?B?Z1BxOFhmeTE1bTd4L2QrTHpjbVdUMzc1K3A0YlA5UVRnR25QOTRjck9ncHFQ?=
 =?utf-8?B?MmtUTHdQMjRqWjJNclMxLzgzdlJsbTJRazNpa1NzdmNZVk93Vjd1Nlgwak01?=
 =?utf-8?B?WmhJaUY3NkU2SUt2amJFNmpoY3QwRzY4T2phNmRmQ2tCMFQveWdSSzVYdE9o?=
 =?utf-8?B?a0ppNENwOG82VmlhL09JSGFsb3VDaHpxMFhLWE56YjdTeHVmWHhiUUlMNlc3?=
 =?utf-8?B?N1ZIYXpTa3d1THI0RlV0ZVBKNmlnK0s4bUhKZEtHNm44WVlLTWIzcGNvR2Fm?=
 =?utf-8?B?bHQ4Sko1WDcrbGFTSVg3d0RMcEJxZGQyaUxPZEp6ZWpvTWpEUGFpM2wvSkRx?=
 =?utf-8?B?TUxvVnFJZ1FTakNxb0d2Vk16VjNxcVRqS01jaXdUWTM5Sm43T0pXUUpNYm11?=
 =?utf-8?B?QWVldExTNXo0WlduZGxFenNkcXBnanpVQ0dRM3FId0FjTmxqZy9BNDBHbVMy?=
 =?utf-8?B?Z0swbjRWVmJKNDdEekZJbk9keFgyNFJ4eUsyajJjNjk2cnFGa0pCaGRsK1kw?=
 =?utf-8?B?NFo4QnpXWGdjQ3N6ZjYwelZUZ2wvaCtaTExnRi9HNEdIUlI2d0htMHVmV3BE?=
 =?utf-8?B?ODFNdC9VbEFwNUI2Y1c5VlpZdjlHTy9PaWVYZ2tIMWNOVmpLWWxsR0ZRQ0dU?=
 =?utf-8?B?bk1VTzRRQ3JNbnR3UlVDRzF3NnYvY05IbHU0RmI2cFZNU2NrTUlCU3U4UE5C?=
 =?utf-8?B?SGFsTWthK0VEL1NpWjRqU2liT2VJK3AyQWo1c2xrVXVleTlnalhzVGFkYWta?=
 =?utf-8?B?K0kxTmRMQ3JhM1hSQ2swdi9GaHRoUG5pdUtsWjFUOHQ5bnhZNWM0Q3FRcUZw?=
 =?utf-8?B?WWY5TUppMlhzWW5SWkZYeDVCcHhWYTlMYnNFejBYazJzb0lhRW10dlM3RGxT?=
 =?utf-8?B?SmltYStPMjBSVW5MUllneTV2R000cExOd3JpNm9Xa2ZyaExVQXJPZk9zUlFD?=
 =?utf-8?B?Ylh3bnk1RXQwNkxTN05PTDhYajJranhOaVJoc1FiSVhNWm1OVUhLREwrL29s?=
 =?utf-8?B?WFBsRlVTdGZ4U3lweHpKb1BydVZWaXhLNjErcFg4Q09jMjFxU2IxNVorMjRa?=
 =?utf-8?B?T21TOFdEM0FTcWVrK2ZyV2xadElSRHVSWUJUbWlOMjMzVVNsZzl6VENLNjIz?=
 =?utf-8?B?OVFLeWxVaXgxS2c5a3pWd0hKYzRGb3VibW5jSjRyWUtBUG5yb1lpUVVJTGE4?=
 =?utf-8?B?VDhXZzhlaHVVcmU0NFRpeldQek00c1M3TGZZOExILzF4MlJCb1JVQ0Y2bnJH?=
 =?utf-8?B?NU1IVnM3UEwzcEtzbjNFU3dmMzZaaWxIQ2ZZY0hzTWRKdmVWeEp4dy82M0dv?=
 =?utf-8?B?bld2aGRRbTdZVzB2NnB3YmdxcDNzU0d3UjZOK0tMQ3lZWWdRVS9xWVVLOGZQ?=
 =?utf-8?B?NWpZb0diSU8yNStUUi9YRWVQb1hURUxDU0ZXT1JETzJHWTBoRU9obUtkRHov?=
 =?utf-8?B?RUhSalV5ai9hUFBFYTlLb1Y0Q2QxblhzakQ4THRWalNuT1lta01XblZPYm9I?=
 =?utf-8?B?K3U5S25HeWhuWnJueHBZWndHVE4xZFZWeE1BZkNkaE1zMkZZY0M5L2dTOUdM?=
 =?utf-8?B?TXBCNnpZbERSMG1ybXo0RmhtdjQzQ0pmZEtLUk50a0gxcmV4S1lDN1RKa3N3?=
 =?utf-8?B?VjBPU3NYVmVoZkxydmJMOEdGODNZU2FRMjRmWDVYZTRnZlExQkFNU0YzZG5a?=
 =?utf-8?B?Tnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	n1/GWBU/OLqACqrafcIjY21P8hkejj5CNKdz8DhH4EPqs7fL2DmIG40nQ657yf0RptvhNuw6z37CzoasI4chPdXs4XC0lI1NOgmPXKcxW+l5SjBeNhjr2q7vGaYvrcXQ4NBDF4/3EKPHZSjJjTVd20VFhIjQW2nxAZb76o7deiTEYoV76Dtio2wn75TiN1z6cZ3W25B9f5m0RzOgxn89zgfq+9M56WmntRn0mxsCrGsVK/uSC/Bhh7ivE8omX44WXcpj1wfj1erm94lLDDKB059paQuxkJbtEKH5AuXoeySUNzaG9ua39o/HyEqAYkuQnEB2HQ33kUoxJF0VaaiG2glAF777+/GIGyAy+oUsegbKIkQY82tgIVYMIKwno2TnACIUJ1FQihPP2EVBPjuSNJM2cv2FsU/MxjL3UoEfUof/aYef96ttVt2O5NNUe6l0tX0kcNVYcDLt5QSen45zFIRbNJKl+s9NiltnAQkpnwPPkDd5B3iga+/Ix/W+mBotM8Fgs91vQ6x9D+dc+Zsxo/w27fj77c35pvhRy8FtkWnVezER58315kfghs2TFa2WtII3UGZrNSm+PG13uCuDIaONP872NgOhfFWxULxHJJD6WYyqkGTBdW92f+PumKkpK6QA9iOo5bUEIuGhTZTdSQ6/73PMDgUjM0daRrp//knyumj4Iq3dd3TYtUwSSAXn7DKTdSsRMVVPDjAreTMisDfhxR9DzTV32j2GurDKE0D6sjir15FVUaR3blppM1t1fym+hbw1u33GFgn+tCmnVMJ3jTGdV1M9vyMEifTblh6E9ZQ6QWwP93/cVXaDL6D+zfjLGHpBJeE699O4Dhg0KkrJw8M4kV7RswnZpVXBRmbwfmjR1uNB+GhjEYmUV7wP
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30df2de5-9921-472e-3f73-08db9cc7c824
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 13:10:07.5525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HB9IyP9ADGp+EAa6q1gG7zn1R508OtONmtExdLLi4C2ECyo/BG4DJfslR2jLbkM2zrXG6jgy1mzw1vQimpTRi3jHQpK+QWraCnCQdIX1sjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7457
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-14_09,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308140121
X-Proofpoint-ORIG-GUID: QPTMbWOzt_rVLx1boWz9Jc6KXJDxtif5
X-Proofpoint-GUID: QPTMbWOzt_rVLx1boWz9Jc6KXJDxtif5
Subject: [virtio-comment] Re: [virtio] Re: [virtio-comment] [PATCH requirements 7/7]
 net-features: Add header data split requirements


On Monday, 2023-08-14 at 08:44:11 -04, Willem de Bruijn wrote:
> On Mon, Aug 14, 2023 at 8:01=E2=80=AFAM David Edmondson
> <david.edmondson@oracle.com> wrote:
>>
>>
>> On Monday, 2023-07-24 at 06:34:21 +03, Parav Pandit wrote:
>> > Add header data split requirements for the receive packets.
>> >
>> > Signed-off-by: Parav Pandit <parav@nvidia.com>
>> > ---
>> >  net-workstream/features-1.4.md | 13 +++++++++++++
>> >  1 file changed, 13 insertions(+)
>> >
>> > diff --git a/net-workstream/features-1.4.md b/net-workstream/features-=
1.4.md
>> > index 37820b6..a64e356 100644
>> > --- a/net-workstream/features-1.4.md
>> > +++ b/net-workstream/features-1.4.md
>> > @@ -11,6 +11,7 @@ together is desired while updating the virtio net in=
terface.
>> >  3. Virtqueue notification coalescing re-arming support
>> >  4  Virtqueue receive flow filters (RFF)
>> >  5. Device timestamp for tx and rx packets
>> > +6. Header data split for the receive virtqueue
>> >
>> >  # 3. Requirements
>> >  ## 3.1 Device counters
>> > @@ -306,3 +307,15 @@ struct virtio_net_rff_delete {
>> >     point of reception from the network.
>> >  3. The device should provide a receive packet timestamp in a single D=
MA
>> >     transaction along with the rest of the receive completion fields.
>> > +
>> > +## 3.6 Header data split for the receive virtqueue
>> > +1. The device should be able to DMA the packet header and data to two=
 different
>> > +   memory locations, this enables driver and networking stack to perf=
orm zero
>> > +   copy to application buffer(s).
>> > +2. The driver should be able to configure maximum header buffer size =
per
>> > +   virtqueue.
>> > +3. The header buffer to be in a physically contiguous memory per virt=
queue
>> > +4. The device should be able to indicate header data split in the rec=
eive
>> > +   completion.
>> > +5. The device should be able to zero pad the header buffer when the r=
eceived
>> > +   header is shorter than cpu cache line size.
>>
>> What's the use case for this (item 5)?
>
> Without zero padding, each header write results in a
> read-modify-write, possibly over PCIe. That can significantly depress
> throughput.

Understood. So it could be anything padding, we just want to write a
full cache line.
--=20
Woke up in my clothes again this morning, don't know exactly where I am.

This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

