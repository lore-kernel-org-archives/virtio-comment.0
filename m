Return-Path: <virtio-comment-return-7095-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A521C001B0
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 13:57:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id ACEBD613CB
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 13:57:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7C7AD98637D
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 13:57:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 65650983F78; Mon, 14 Aug 2023 13:57:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 54C6998633D;
	Mon, 14 Aug 2023 13:57:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XfasrupZ7275h8iMPlC4up4X68+dzUsqfsp6Z25VlXAJl69ZZobElmA/dE6FXIQByc2Wr9tVQ/AVGBkaK4b5xvoPGLhRNmnRUdl/BAgN4omEdSeErrjmkrkIMhSod1NFYlLusOkHlRkz/mFIWQ1X/NVPrfAtgk/9plEXd6A63VZwo6VH2zgQlEVLMudEfy3MEdEwGjm982SSRWpvLcU1YxXpYCKcZ5JHGbbbMGx9OZMBMfkXv45BSrJjpGn1tMbiScSXzpuWwF/uh2jNs/tP6TkbeZQs//ADj66jNt/hG9+mKAtRtr+8scJYKLA9WP6mQyEhcdsDurOMFmkqtZmbcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mNNZY/uNg4uz849oqop/V8gr0DTQgb+GHyF5bpPjgg=;
 b=H7/mrAm8VzYF0VDMrbsimLbPCAbTFkkpERUueFBVJw/c/YJ3Y+auzKPytzCTMx6qWZRygrJBxQa3Ncl/z1RLvfMFRp7I6ciHGGugS2WDU7QYccpJLa4NBVoNTlF5rzLaWmE41S9+ETMn3Y79z35zlX9LQ2hlk67cKkgjzv9nj7pnLPnZJyRssFgWOmutEd7KNfF6QJYfY16tj/7GKnZtd1XHDNx0fQPIQQAW2ywXfcSgb5n53k/xhWQYMox38qovlJ6bHuGkM+bXpaKXk8go/cGloH+4fWhSpp76Yp3Nilz1l0tSJSZ4zufxbHtovc4pCkz4Bl7NQwIFvW4p3Sa45g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-8-parav@nvidia.com> <m2jztx7rzz.fsf@oracle.com>
 <CA+FuTSeguCKk4zxZ0=Ebr1phZhF9kssHeGPn2eZj6SRNv2ewsA@mail.gmail.com>
 <m2fs4l7ot0.fsf@oracle.com>
 <PH0PR12MB54812CD4C02D5FA50A65D0FBDC17A@PH0PR12MB5481.namprd12.prod.outlook.com>
User-agent: mu4e 1.10.3; emacs 30.0.50
From: David Edmondson <david.edmondson@oracle.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Willem de Bruijn <willemb@google.com>, Shahaf Shuler
 <shahafs@nvidia.com>,
        "hengqi@linux.alibaba.com"
 <hengqi@linux.alibaba.com>,
        "virtio@lists.oasis-open.org"
 <virtio@lists.oasis-open.org>,
        "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>
Date: Mon, 14 Aug 2023 14:56:15 +0100
In-reply-to: <PH0PR12MB54812CD4C02D5FA50A65D0FBDC17A@PH0PR12MB5481.namprd12.prod.outlook.com>
Message-ID: <m2bkf97mlo.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0296.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::13) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB4926:EE_|CH0PR10MB5034:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a6a06e9-80ef-444b-e1f8-08db9cce6eb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IOlovN53MqxbFS4l5VMokpDTNyhNzf8GeGxkGT2yuy829Idqwsny83YB/tyFW9+wS3x6yvOgp+h6RMQ+QVDC2HxWKZtxXi6Ns7I924phJVkIH1dtP0XDuteciqXzMQ1Jf9MHPoIO5QnUpDu0Qwv+7LSyy/3X+aJV3rsu+P5zfOgdbI2/tlmeW9bTa1N6bKw3Mjp+Hu00DeyOCAV9e39qSS96MMn8W7Iu2k1laEB2qJU2xM8Abfg/yfOqI66w/OfnFZjQ5CLFaKazyaNfDkrapks7E0Rc53CzXHhHioZQpr566BkhoQ04YNNmnnGz/EzaXVqFXgEobkk5hkL7WgeIJt2ccELEdmEu57WAydvK6XMxZLfBXN3mHF1hjQofhlwpQ+tM75BPSe+owlmjg8iKZjby74mJ1poWc4Z8J91jm0LNZa8RI0zk8uI6QrekYoik7vTwxjQBg5oInrhBKYHHLm85XCA+M512gCnK0Y3Xq+SVo5fP2tLrZD/JEkVFsCaNM3I90BktgZiAf6OWHDLZaW2rj7MPq3H1jCM45ZI8B8JXTWNWVZRptLvxlcGlIAXX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB4926.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(376002)(346002)(136003)(39860400002)(1800799006)(186006)(451199021)(38100700002)(36756003)(86362001)(6512007)(6506007)(4744005)(2906002)(6486002)(6666004)(478600001)(44832011)(2616005)(26005)(316002)(54906003)(41300700001)(66476007)(66946007)(66556008)(6916009)(5660300002)(8676002)(8936002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rAQcsOImTLYfT/0a1uL3CPAh+ubgUtqqnegnXz48bxwqvCEUyhcyKSERCXjc?=
 =?us-ascii?Q?SWVCVn8nizFf+kye6yCZWZ/cR8wBVlGniXDIqWEJJr2krz64uhB6Qkv5bsU8?=
 =?us-ascii?Q?hEtuZHJ1SIVYIDhs0u2+IW1+ZuhNDQW1Rp+JBnqP69C5oDybKmYuIEvMiQj1?=
 =?us-ascii?Q?IlV4/vpxylaF3gd6eapA7RYAi/u2Twi84yo94f7FhXQ4KovyoEQYZxeWaxXq?=
 =?us-ascii?Q?vuoe+si3KxkWKvVUhakrD4dVOeW1TDGRpfGjhxvSkSBIdQNEy/Dx5IP+ruGA?=
 =?us-ascii?Q?ebKGucuU7VB/+ZWdc+Z4+svDBb401LTyC2eC32946L1hl+I/gawJCFAKtup7?=
 =?us-ascii?Q?2iVaBRyPe6qnl/6aFEl9M+6wKo/+jFRuxaekr77gXfbp/WGwUegEY+N/dIqW?=
 =?us-ascii?Q?MYxT9B6ab8luDPC3YzKM8+vwHIq8B1oihT9a/t9+lASI6wj6sc3brs6UiXm2?=
 =?us-ascii?Q?nNRc0pvVmnZ1atsnhGzhlLdg9CATlQwFFXRjN3FguG++11wr5HT72f4XG0jG?=
 =?us-ascii?Q?14XwZFbij3SLdyt3ZQlVBpKNED+C0gsam0oYsqw3QyNhlKC4RzfrrFlWzcmG?=
 =?us-ascii?Q?rEtN9Lut4xGmpHWbrufgWy+83hQLcgFcGKB4X4K064yUekk/1ZLW0jVvXr0q?=
 =?us-ascii?Q?KrDgiK9VyB1NmhP6UdPuFh2thIsF7fopPzXFWAkjXpRHSApM0KX0vjGdE/Vq?=
 =?us-ascii?Q?Uc5PKGSXWb55XV+PjxCkTkVFvlHz5uTq6uExb9Gb17pxNQqP6HNhQpJTT1+F?=
 =?us-ascii?Q?bSVpiguVa8FkRGNA4NHra12mCsOxWhTkvEyOxe++yvwNp655r4RBrgH7dd+l?=
 =?us-ascii?Q?sZ58+6A+ry4gRQVhV/KiaMqMbYSorG/IlqQUUDfJwp9/mx0QXmGn7KIGfhfl?=
 =?us-ascii?Q?fXjqNU9gzAzOMeS3Jo9+03hgdHoULqGyAMFzQQJu0TOnvkT1CCsVKY4TFj7C?=
 =?us-ascii?Q?4APj4XqpY+kEvL8QnpIFkxF8Vbky369bJJdpxMDGuX+YM85+w/lVV2UrjJKe?=
 =?us-ascii?Q?Y8PGx5KDRugWYRsq3LfbV5rNlBHuYg+y3fi2q3gIm1NYOTauGtnqwSLvd4BX?=
 =?us-ascii?Q?NzN0JviEd2ZcM0BIPXlovffyV8sHAY9NY8IlpiDdgxlw262VFjsAc3AbLonD?=
 =?us-ascii?Q?3sWr5gKOZ3UHfjKURzn/6Q3LTO5GwwE4YAQnXWt0O/oGFTgzaIWSM252dpqy?=
 =?us-ascii?Q?zd5q6aDwJ1Koess00E2Fft3bWAS4YVbKvsIxxFRL5q7dxN1qhP+48rtR2he9?=
 =?us-ascii?Q?HStnMXJ2dILBf/BsYdQdAdYZEFu9f+w+bxa5/tKxKt9zZUzA9PNXUvYXdtsA?=
 =?us-ascii?Q?kFP3+Ku4xNFyV1s8SIhRXAMPW+R9ILUCzWKq23LN5v4/ZMbKGwyycEzUYZAI?=
 =?us-ascii?Q?AgvQ/yXrxs0fjOZsl+FmM3iL61s2HcswyWdHeisXHQFIosWcxxxlFyH0VFw9?=
 =?us-ascii?Q?XHL1vYaNrG860FS9kjU+7moSU3nrJTjfmBlwWOzkccuyY4DBrUTwp68Z0YvJ?=
 =?us-ascii?Q?jueWLeJ6nRT7uin8ctzvSLj7UnR/aP55UV7Byb7rSlSuVrVt9HU137Acp9/A?=
 =?us-ascii?Q?4vWUKXJEWO9qYYOkMBpeHhPE1YlE4VGpguPN9MeF3T6z3cSdF/e8k/1w2bJ4?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	77oEPiabRWSv9gc3ZO9ycHwNpKo46LC+AzaV4zbSElk9WigV56BYLD2KCziwW7JJqe0BYse9ATsa1ut89ISn+vT7hoc8DlCSBdBuqGNXZClNKzegYTgRlOvc5cX2TlKvAhBfiK9uXJ6/YnBGFvhzSbx4p4h2ANecrq0ua9xdEqCfQYuddpRS9UmRkJ2t7nuuIvsoIwyysPKXG1PkHvaN+bK+0ybMGFx4BW6+t7tRl3+FBX5Cc6ciQ6r4Ziaj+HJLam43/kvYicgjmIe643/8w6VjuPoLw5/TTFLgFctVvlpopM7sfDYEESkjrBQTdWiLR7Nl7cKseI1JqRLsCJEH/0Tj03EXuMuScAAuVBqZrvXi8+B4OMu3+heHl99QBIhKZtlnYakL29YyUKWWbmJsP1WDu/LhfSTg07a20yFRTcjAhOxnB/NrBDels5MmIouB/BZCgrU3GaPeblFAvYRP070+jbAJjiQ1wcwfZeuRviDmJ4TMrZthDtLsDU6Uyw2LlHonuHDDFxhF3zPKfGiW0b+yH6FjBIP9flVygJ/A00lVjGubRBuhhz/5+rBNLcaHRx2VyMIz6ml9EsgEqnAbbr1aBUr5mOVr1S78AOc40GiZzEAU6vgrd4phdYPEmRLUH+AQDZfpsO/D5PSq5ZEZhKo8MxxVN5M4KtUAXNc8bzeZBoESJgDIQv/1pjxYKVFf9KuTnjfhkPKXoUgmHDZbJ1g74e30Z5HYeanarFpACIv5lQUeCji10BuAM54NQoACOMak1kep+yv6hHQZCHfeZ1H+FGUI4Wq48leo+7KhrPIBnSAFcawzAtwvP5iDJlKiIuS8grXPsJynTf7atRDmcvdPxYH4WHc7Nvjth2yXDwK+RLF7PR2ZUhnXa3a5j+Ub
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a6a06e9-80ef-444b-e1f8-08db9cce6eb7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 13:57:43.9706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BuX6dGYXwHNONENjrMXdeKE/sdduFNS+J7S2IDUCwTHJUVyPe1fty+m0XAkOBRNT2zS8tZIiR47OoZ4bvFtQCBSfucRAKLNOfalYpvtzfhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5034
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-14_09,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=916
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308140128
X-Proofpoint-ORIG-GUID: JKyK3nkw6RTpoQWCZSS7bITZs2zeBSHn
X-Proofpoint-GUID: JKyK3nkw6RTpoQWCZSS7bITZs2zeBSHn
Subject: [virtio-comment] Re: [virtio] Re: [virtio-comment] [PATCH requirements 7/7]
 net-features: Add header data split requirements


On Monday, 2023-08-14 at 13:28:52 UTC, Parav Pandit wrote:
>> From: David Edmondson <david.edmondson@oracle.com>
>> Sent: Monday, August 14, 2023 6:40 PM
>
>> >> > +5. The device should be able to zero pad the header buffer when the
>> received
>> >> > +   header is shorter than cpu cache line size.
>> >>
>> >> What's the use case for this (item 5)?
>> >
>> > Without zero padding, each header write results in a
>> > read-modify-write, possibly over PCIe. That can significantly depress
>> > throughput.
>> 
>> Understood. So it could be anything padding, we just want to write a full cache
>> line.
> Yes. if the data descriptor is partial, need to zero fill too.
> I will double check if I covered already or not.

Perhaps the requirement, then, should be that the device is permitted
(and encouraged) to write full cache lines, with an aside that zero
padding should be used to achieve this.
-- 
No proper time of day.

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

