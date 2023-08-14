Return-Path: <virtio-comment-return-7083-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05904C001DB
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 11:54:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 420F22B053
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 11:54:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1ECFE9863A5
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 11:54:07 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 062F7983F78; Mon, 14 Aug 2023 11:54:07 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E8C4798633D;
	Mon, 14 Aug 2023 11:54:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+SXljjoyuhFAWLrX7rpnlf/GjuP2/3jP8f7gMSGRIKDWeVE0Ahu1Fz8BpcEXgJvQW4FGnqDGisZCmYMivgS/U72n+zQAhQmHjsuiiYW5HGI8Vv4eeDR51NK0NIblYAnmimCJ3kFCcUGGUYhUk3xw4RpHOP53hnxssG1kwkLYnHriNzpVqs0CPRrdaOgIu+v7dkVs1PZ77wNoNt2XnKNVxAYUF6aMh0PlVZzBBvbCBEb/XjdYg6UnpGWNJ5KkxmPR1mf8zEwK90vH1bp1gnpjy4bzi5AcJfsAd2K6YT29GDc5UTXEDpWM87O5xYMsxtFyBSnwz2mLNw7RRSnhPv9Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPpU2OXCAaWwApLREJ3t28KbrXiklXVd9FpBTHuMNbY=;
 b=NXAI3v+8eVTnWD9m46P5jaBjbWWTtjeqRItJjFbqHh2JBv1bVlaHWWQU8jGre85CyRHYfkNAYZTS/O1O5MTGy969N7prf2/k2wzsbICtahlekAeZIAXU3tX3TmyiYrR7BzkTghBbmt07/AbedDbvrLjdbMW9t4eFZxDOdQd2+w1Srvq+8xD0P0lpInE7skijDBZR0cOP/m1LPUEFjGgW2mvrb6Ik6GwvAWLm0/or7BkCgzP4b5SDvXWKh+mkvoQe5WtHqZW26MVCnQ3XDFrtoAahdpa76XXBBH3X3Ltdv0we6Bw/o8QIXgJfmGSOu+j7g89onDA/aDERhDVw/ZzqEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-2-parav@nvidia.com> <m28ramndtk.fsf@oracle.com>
 <PH0PR12MB5481D4EAE0725EF12F735D58DC17A@PH0PR12MB5481.namprd12.prod.outlook.com>
User-agent: mu4e 1.10.3; emacs 30.0.50
From: David Edmondson <david.edmondson@oracle.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Shahaf Shuler <shahafs@nvidia.com>,
        "hengqi@linux.alibaba.com"
 <hengqi@linux.alibaba.com>,
        "virtio@lists.oasis-open.org"
 <virtio@lists.oasis-open.org>,
        virtio-comment@lists.oasis-open.org
Date: Mon, 14 Aug 2023 12:53:14 +0100
In-reply-to: <PH0PR12MB5481D4EAE0725EF12F735D58DC17A@PH0PR12MB5481.namprd12.prod.outlook.com>
Message-ID: <m2a5ut96wm.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0086.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::19) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB4926:EE_|PH0PR10MB4565:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bd68be9-bec4-4e9f-899b-08db9cbd2267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ucOCVvbEI3iWWJRX7joqqEcAPnDTBh//U37Mo5FvukuibDuJnDbvto6LJo7wb36udAhT56c4f9EAXb3LmcPwL52/SN4qTAwpq3gxmRp9QHuc67v/Acs/Rf6TKAZt+tf5IJv+iC9JsW28+CN7suzN+M1AmTzC50ZSikOU97AEoZLD9qV6NQv/eAAf3q4N9aMyuHmbLTIeTj7dPU+SjepWNfNOCo64Ed3nRLDlkdMkzxDYKfLl+JGHOQ6aCioqykbvWee9bvOUOZxG0ZKCinm6stHukL2RvDUN/oPRP9VhcS9BhTm1zYjGOXxu2PZ9Hv9NjsC0rayNfsJ+kKkpPc5dsO48ozZgRqnrT+ACCcPkwu9m+6VMsLXEqHjeJkm9jZZE/5aMzh1BclXM2Vw3qit/N0x9CLwQ3w5+LXwkuyqyUcnmNZ1P0P52T80KHHYzyVYj2gg/mdsZO1o9yWpj7NVcGjvadiGqXXkPzCrPKHWWoReQyRUdGhm8Fyu2BKND6slKWcyhjU5tRqexUk5j++1Srrx0ePXmPDTGfYdYLUPgxVU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB4926.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(366004)(396003)(346002)(39860400002)(1800799006)(186006)(451199021)(6666004)(6506007)(6486002)(6512007)(966005)(478600001)(2616005)(83380400001)(26005)(2906002)(54906003)(41300700001)(66556008)(6916009)(316002)(66946007)(66476007)(5660300002)(44832011)(8676002)(8936002)(4326008)(38100700002)(36756003)(86362001)(66899021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qsmWaBYcTdGqZpRXZhDKCPxSTcvtlHxxspmzhwHKrCCZNzJrL3b4KH2Mxcqh?=
 =?us-ascii?Q?TorOLNmSa9SO/BUWSSoowlAGF8B5kY7Wjwu+3O5wQ6OpPpBZ1MbQ86MnXfLQ?=
 =?us-ascii?Q?GYmhbdJatmfUM2zYTqaJx2tl9wjgEFLbkTgcpMz35r8bQPzZLtOMw5UHotSb?=
 =?us-ascii?Q?DmmNqzMFHiLcIX9+rCmIdi+0cEXX7AyuTL59ZSSMDx709RE12ck7AXHdC2T7?=
 =?us-ascii?Q?jAmsS/PNKUM6Z+Fbtq4HvdoRtMOXNUFvsm93yrxDsXpnIbLiyJkrXbp5c20p?=
 =?us-ascii?Q?E5GBtcDBR5MwUrOrze90NDP0zFq7uZ3xoppNu2y5BLbOxltNWlpDekX1flWO?=
 =?us-ascii?Q?cYxnGjRtFkm5FBffkv26wMWd09Vz8P1o9nXCaO8254fClknNmeC7KqyjVlsZ?=
 =?us-ascii?Q?qI2NfmqHPCz1n0dJCjVmRW9y0yCtRhWE4K6qBKqBJKNGUagg0vlQBlJT4ElW?=
 =?us-ascii?Q?eRxBB5Sl7NHBFgLSHpOxnyoXJlPo6lkS47UQ03PVuD7kogec2LLr+ZdZkQ3k?=
 =?us-ascii?Q?icxYyKiPhOAIXa1jPvPm/HRg7B44t+E1uJUenCLjiBUlD+skcbG82taix1lU?=
 =?us-ascii?Q?4B7B+cLZaAKMaftDbuKUdZpa29FzmS3kUScd4c4nxGsWsb3IXlXXZPuwKvl8?=
 =?us-ascii?Q?YZvKUKXhX0Ceek3fisw4sIPQozA9YYVJNKTjw8uiM0EOWExysT+yDFsMq2/j?=
 =?us-ascii?Q?+VKuqECn2dfBH8OF0fnAvGs1ygJx0TdM/bZesBj/d7yX+R8dubVgCsG4Maer?=
 =?us-ascii?Q?wpcrSdwq9GxEeVF3sjWSLFTRn3cfkMY0EFkU1LqTTbpRFGUfs8j0Ygt3OBEC?=
 =?us-ascii?Q?xLUEluvAMYOAaItNydTF/wbLhWT6XE2slE5eD1DmVGQi4mkEKNkteOMRC6rC?=
 =?us-ascii?Q?VVg5jf2McvQBr65XaZFBJYX8jN34a96NC27pz8HGE8AcXXEAeJdRRp3dCW9F?=
 =?us-ascii?Q?YHbjOQLVGOQ40/FRXOqFPXHjrOVrSVrDOb50vVQK/VDyZEh37oxKmC4XbM/7?=
 =?us-ascii?Q?yixn6rQSijWYPc1gIPJg8u7wZAiSRU0tQnWWAj5JwerdKQaIPhlMTSKT4+wd?=
 =?us-ascii?Q?j92Wl1eeEps2terb918N7TZua6kWbnwuzxY+4A8vKesf/YndcdiabaGR7wXi?=
 =?us-ascii?Q?q+HwSUbuAbc2qltbi6wu4kWo5Tgq3GBsJ/KJQ/t/9v2qFXjjk1720e80Ae8N?=
 =?us-ascii?Q?Oszfj5LnWJGjKf1oDyqN7u9opR3RCmXwjAcQWFUFuFLKjRasK9EyExu0UMRP?=
 =?us-ascii?Q?5r1n5P18T3u7fhXyatnjFh1aebuUqoiGc8+uGYe2NI5fjGTk1wDj9mIZJKZs?=
 =?us-ascii?Q?OpNafHUzCFQLZy7Yh/MTsKOioMA2dGTlGcZG/9IbRWwGVJM5oU31N1xqNjXx?=
 =?us-ascii?Q?mb5s4Xx3RzPlF+ShHZhtod8/5Cu0Ryvr6gJUkKkOaefAyX6WIhU9DMnxz96S?=
 =?us-ascii?Q?c24Ij07fBH0PZpMXG1WbtI7wiCM4oElvcsMJFhzcmcwDML/3JwAnlyxtuCxh?=
 =?us-ascii?Q?w3lZKhp5JLFETDXTVkQ5jikxL4ZV9VQqHs+IjC2bdig62g5ak5hYwmU+c5/E?=
 =?us-ascii?Q?mgHTK9CscdxujYu0lFPNldJGgXZCQt+/87KmILoU2IMcNtPtVf94MWEP1NaO?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Ye1KzDnULDhDvpXH4wpFXd7lJNMzneRLB5Fs+k+E10MzC7TeKcxL8v94/vlUSLoHqNU/TwIgRsDjRpiF51nNz6FCROf/LJswk6Qcv+Zbs2GuhH+Y7EPERZlG7VtptFpT+JXlI4o+K0z6/Rn+IRLq3vJtTgKlBIXn0PfMGjlXCnnVoE+pDr+dIBJ0He61nyCRPIgfJPQs5VoV3sWs6Gp2exyClFbWAg6Ri86LgrSbgKe4oCBmZMpPeSUg6aewoY46p59KfPkjlpPxwtfQo+Bo5w8ywjU7wbl06R1McmlJvulvkv2EIOPStbif8aWiPua4sS3NgRyqkbyssPFF9tdP2wdlpQrXjQ/mPFkVsvhK34+bUsCaDdyx/MmZdDa8ix+tQ6lpdfsjICsl3/O12nyE27N7OAx9OXmscojoA1VnzUF92IOAu37yCr/Iu/g65aCpUkhAxmoZ/dJ6MSz1bS7v/zujxu+4XYe93W4KOZLTosGmdGAOvpFHJYP2GXJzTMHB2ICxfWSeDZ9bSWe2zg/Pc13Bu6i1R9ZyRUN6XTzx2dtfjp+rNrSEDTE3lYZ1C6MWg/5tVh1Jb/C/w6W1Q74a8GC9WCV1io8QWykdEwWZlnX10h5sKBff07M9K40ER6jsPZm7+H0w25FTElVlXEoZFHdW5Re6pI++fFtCB7drZtDgRQ6sxtNNjofAIUK4Fp72U4XCRdmIkTVgL6Rpj4n5XRSmdnfwGn1WhyAhHzyrrKui9Vh+xUQfJPEE7sHuWb7HhxxLjSrWUDAdLJE6mmPJp1eIhF9MLLtgdbr5RIyvaphUUrVlKhrzgWmH8haG9WzvqSuekZNt0/z5I7L2zPAZ5IXINY+lWQcCDefzQiPKsuI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd68be9-bec4-4e9f-899b-08db9cbd2267
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 11:53:54.6790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X4W6Osp5JQTwhfbSEdmFeiCcGnLJRl1pJ+71/C3D/hNtKEj5dYZPxieWct/EvZRKogEhh6tESO/OEdtW+saGfsAYayxe/YyLXmFgcEnvZsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4565
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-14_07,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308140109
X-Proofpoint-GUID: d1D518I-6sbgGWWvR3RXL5gmrqcJ2dUJ
X-Proofpoint-ORIG-GUID: d1D518I-6sbgGWWvR3RXL5gmrqcJ2dUJ
Subject: Re: [virtio-comment] [PATCH requirements 1/7] net-features: Add
 requirements document for release 1.4


On Monday, 2023-08-14 at 05:17:34 UTC, Parav Pandit wrote:
> Hi David,
>
>> From: David Edmondson <david.edmondson@oracle.com>
>> Sent: Tuesday, August 8, 2023 1:46 PM
>
> Something is wrong with all 3 replies from you.
> There is no message body in them.
> I thought it is my mailbox, but looking at the mailing list [1], it is also missing.
>
> Can you please reply your comments again?

Apologies, I will resend. This will teach me to fiddle with the
configuration of my mail client...

> [1] https://lists.oasis-open.org/archives/virtio-comment/202308/msg00125.html
>
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
> 
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
> 
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
-- 
Seems I'm not alone at being alone.

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

