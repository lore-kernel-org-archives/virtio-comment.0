Return-Path: <virtio-comment-return-7142-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586C8C0015E
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 10:17:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B4834157EE5
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 10:17:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9F0AF98638E
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 10:17:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8C0FA984035; Tue, 15 Aug 2023 10:17:48 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7ADC198633F;
	Tue, 15 Aug 2023 10:17:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TZNttzA8Md5kklcONqvy/mKdJmOT4MYoibR9RSF7PBJ7stOxQl+Gnif6uo5TtLEJ9sYykdY/F1W9bXKxvT2TkFqybFoRqDsX0NW6ktE++hz1TXw/0sMrvgm2jcHAilI59h4r3oDsGIDuANHJIN/9ChdCLwYxyTaJ1ZxguXJJqJthj5wBir7JlK17KtTlkGf0OU92E+wMwAzsz+wSQctzLA/e3oYS1vzdQ76mXxdX32rRuhV7CINQBVqQyHysEwqkQ/9hnf+lNauimTlV8zYbUcqYRdOk+se5tminvlrSv2s8BM6TpxblEIFn9P6KcbTJXeM++VmO8cs/SfiazIqYvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JICoDRFtLtvHC0WYyzz0oQ2PWaVY0CpV8IZymVYRqeE=;
 b=OlRdloH8Hn/3d3ZuFUTK+Re2c/ebFega6GDbXFpU6PPN+Q/o2YJS91axY8jSDwJ3qOC50M5yVgZFyjkHEcaeejlEXFq2wTFEIozJ7sMmxTGrrBMF/tY4Tw0fXYkBEfxzr6BOUMyk9tKCsxwF4QulRy34sP8ZKNSNtimftsiNsEJMmYqAFuYD5J6+Rl9izie/qDiYsB4PVXHLBWxz+qYgruoxrBpTKm3f271IC/JygvcjJ+mDGJWlKJOh9vm1x6bxjVQq76T7lqNU2VoagadvYVxxQj6d8+1bk3CWkVSqdo0b8tTUIIXF/i1kbuzQ7DAlxCJrtyE4cEWm6IgxyCQFoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
References: <20230815074600.473933-1-parav@nvidia.com>
 <20230815074600.473933-2-parav@nvidia.com> <m2pm3o65rb.fsf@oracle.com>
 <PH0PR12MB54817DE0F0C993C548982279DC14A@PH0PR12MB5481.namprd12.prod.outlook.com>
User-agent: mu4e 1.10.3; emacs 30.0.50
From: David Edmondson <david.edmondson@oracle.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
        "xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
        "sburla@marvell.com" <sburla@marvell.com>,
        Shahaf Shuler
 <shahafs@nvidia.com>,
        "virtio@lists.oasis-open.org"
 <virtio@lists.oasis-open.org>,
        "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>
Date: Tue, 15 Aug 2023 10:14:25 +0100
In-reply-to: <PH0PR12MB54817DE0F0C993C548982279DC14A@PH0PR12MB5481.namprd12.prod.outlook.com>
Message-ID: <m2leec64zu.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0123.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::15) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB4926:EE_|BY5PR10MB4145:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cff0bd4-a22c-4c30-ab28-08db9d7030e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H2HNEyWqLMgJu0z9lDGmTiRjtWPRX/fX6lkAdboE2IaUQDu0HjFAJ2eJ5J2LRdM5MYKKFcoKsDayaDPN07PPMRsgBxzKw5otKtMXoaOz4FgAtDGJ3FrQotakQ1u+fdf5E9PMMe2eVfIIoHkp0nlnSvqW+Vk7yUoUcaFOkcfCwT0OvxO0AnltuXY9GOZ2cHiOENpfdX1MM2B5lKs1cDWnZGpL77y2DLP9oA/RBndOxC04FWWq+aQFKUCSAcla8DFNBg1fCwWeQrZQv+oTcReFiA4zqmHKkRg7FbvAimPLmXuZ2q+VIc6YB8FO5GQu2o3UQj49c3dw8VEX57Rq/agFgVbR6WFqhLvBxE1O44Oh1DoNJGtQ3ebhuebWk54sLcAo+dRnOFoHdoyfuuQ/k/XUA9ZsXuPYIL7ZHlNkWVSmG1Uelh+4oJRVbJRLYPUvJsg0bk0bvde5OGFHS3/koLvVKiek7aYCjAWr426YyCUkiieCF1lYY6MXSO88FZrjStL+owoEdlIVIYFM0TMdqDtaFQCWnV9aMu76pjvwbqZ87zQcsakqvMpQ5/wOZM7dY+YC
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB4926.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(346002)(39860400002)(396003)(1800799006)(186006)(451199021)(6506007)(6666004)(6486002)(478600001)(26005)(6512007)(2616005)(66946007)(2906002)(8676002)(66476007)(8936002)(5660300002)(66556008)(54906003)(4326008)(6916009)(316002)(44832011)(41300700001)(38100700002)(36756003)(86362001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NW+sOv/CG4MGkQ/DZtNVeGoZdecdSBzYbu8mItdtTlUta8lDric9htizMqwG?=
 =?us-ascii?Q?3zRpa6uZwJPaNJx6NX3Obb4th3U30fv3SliuTCkWAtCemI4y5SaLq3tA4hgl?=
 =?us-ascii?Q?MGUFI5mnrJpXnO+pYIGpHYrQauRlNHSAsw9s2zOCSxxgcskhWMgScxArlU8D?=
 =?us-ascii?Q?zBk4UGpKRl4g27AO2cK9QRZtb4n6Dag/8h59G3RgruIaCewFQeL9636uD2sB?=
 =?us-ascii?Q?uOHT5BibqStJdO0MG/xUBhtzWISuyKToY9y7JegD42cK6DF3Niud7Uf0JHes?=
 =?us-ascii?Q?zhqKMcYXnu3eV+XTXyP+bfS8gnTOHlo7A2NEeUPHrcsIGqqRhpmVTtI+KcBl?=
 =?us-ascii?Q?ajYA2cTdM7aUxwgoOtC9OzZi7AgfA0BvA5ZTsoRU76TCIBW3s0MgzX+srhGC?=
 =?us-ascii?Q?eeaf1Tx0EShBpEHPROahZ4/wLyCBHErpOZ6UyHCRC1GgSsWXq2RRHDjp4+Qp?=
 =?us-ascii?Q?zS/lbQlRrNlo2/H4yyu0Lt0TcgeDVv0Lh+zTKC+8bM7nhE/UjzqKVMo0QOpL?=
 =?us-ascii?Q?jT3XZY4snCidSn827khMS4VadHSKIfIogwd4tUL/VrjXFU/5BvD0rsARw+6Y?=
 =?us-ascii?Q?vsXGtxM8cX5jf9Ixay/EACvIO0JNdBoJ/LblFFBl/xmiTzmY9rX3mrPvkiUr?=
 =?us-ascii?Q?f97ra4hLUxsuyzde23Sqgb21e+nleHpW/XXxOvXyBEoehg+8ApxTt6NM/xPf?=
 =?us-ascii?Q?7l587bnqQoozMtXn5zWXiwwr4FUhKZk3LZRfs1tc3bxW96i+HpMpFMXiXUGa?=
 =?us-ascii?Q?tO+OCFVybsM2V1lxBv5ILOTvGMC85pb5S0h8bkVrzTsprw6TL9H8xix26O+b?=
 =?us-ascii?Q?iE5ZsUMlJXwB8YAMfc80oJ1EfDMIyZhBERrI/QuaVQULADI7ENqffIg1MSf7?=
 =?us-ascii?Q?LuKwVWp/4Y5yphZNpCsGJdLcrynS4nZ9elgCBceZPYVh0Sd2X6WlWI2rJjAj?=
 =?us-ascii?Q?IuJ+cNfPGzG75ElnO2BQJWFmfBgJqDyW1JwR2QqknJHSG4tmuSFZ7GvL/D2B?=
 =?us-ascii?Q?7gbFvKADwQb4Lw5g4gxFR4TLeRvoMipYsj7puyrNLNSi/wS1vwpcyh89SsQ1?=
 =?us-ascii?Q?SNuYomUnPjf35bZl1IsYcYjZUbMAX3jtfrx7cwCUDDOVVCoURFUwAiK9kHyt?=
 =?us-ascii?Q?BuCY1+Z7tEiQhhriL3pLV+CLHdurVF1ZQ0q1ByjVAzJRLhTKplxnNns2yhAa?=
 =?us-ascii?Q?8/z/FBU3zn85Lb9BccK915JqrNzQ2L8lOEX7hTXSOQH3zxMWaRouehoCxKrM?=
 =?us-ascii?Q?C/3/6TaHT8lABrewS++AnQGN1LmsazciTzbJhb6ckqMHnsdkCYBYVjmL5uSg?=
 =?us-ascii?Q?4bFy/l6MWlCK8o/biPf9h1iQd1DoovFxd4/VXAuvthEsRT0ZcMdswqoAy9AH?=
 =?us-ascii?Q?AHTdUHz4ipIkxojIkuprpy5Ht87hka+U3EQ6RCydHFXGfK0/YmdY///AcAmi?=
 =?us-ascii?Q?jCsfuUzCP2oP4k/o689LNbH+mxxnuOVVkHyeYKD0wu1wAK5Z3TtVD4TRLH3C?=
 =?us-ascii?Q?7QL3lZW624mhM6ULIuz8XcQQKYwXoaDeZcY1fFoRUT3+g1J70vffTjFHpofk?=
 =?us-ascii?Q?P7PdB0KTkp1grUoAowZMmTxGdkgw1EcabApgWHn29IS6xnOeyXLoOFZPdEHZ?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	LCcG8QzX9wUWn9EGzAQvgr+4zu0QD+ebMK5zyVOdJAdhIwNK9gUdNqm7y60Cwb8HScHkUW2z6jou4e50cBIzgxg2Kc6GSXvd/kYUy4t1ZvnFTLSz1BWiPZjY3BEKAjF1SMx5/d2Bc2M0t9DEh7HkNGVykFkocnx4jyXFFcy33ea/n3ggzZCiF5ymDWTz43y/FnMzclrhr3pGpjHb4E3tQuCHCkP7ZzXgf0pQL9YlBUB+U7gnUQPvf0RSCuzInxQgiDv9TikVqecT6U0xPvdcWPLAUmEnyizEJ1bzElNwA9UiDZ0RzCKkzXz2wPPo4s1wQfcopeBx8O0fkmIPmJjwqugGdNWJ8gq+Z1qBPG52jkQ10eeFMwIQlTT+pRExwh25Ka8OgY9BRXb7nKmc6OUdO+8jBv3UIL/0Z5iU7BS6UjJSkahYBAjL/OYSn/udy/10/TXyg5eNJpabV3wi4AHStruWse+nUAIlffMmfwcN+ilyQhwzdD37ww/9GA2FtXYZkMR9j5kTJUD6fmPPZhlIlPFSoIDhi5hURJDEh3KsWIXi1MW4GLZWhQOoUW7oHXYWiXmlggXuUtM+OntoqCqybkZZfFrNcozfCFDU6tI1ADhErEpCcfQE1OQ4pibEA8aUqfYoQh6wLAimJmGLuqA64q5dEhupv/UvLXiOc8EwGa7DCvmj+2gwicnI6gJV0HkMScAsIPwKP5YZvfQhJQEns5xkILjg/zSH8WFcosZxu1C9reXrLIJVXw3k1BE5yFaGutrmzeukuhci9ud3jzRqAP3yWPAbzG6dw/xrS4LvFaGtoVdyNXRy7tT8uQNeCs+quNjdNBVHg5cu1eTJuAteKHqbm2XQMF/UWPcjzQ5LawlEv+cXflkPlSleQiuicvCh
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cff0bd4-a22c-4c30-ab28-08db9d7030e3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 09:15:38.5904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJDwpzInLcuC1lkIjFiu31VipwidIjUmbYiXr7su6vpDFfDB+NYxSF2BuUeJwl07gYUTua9uOs3/16hZP9sAuH/eQxodQixT7s42ov+fSwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4145
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-15_08,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 spamscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308150083
X-Proofpoint-GUID: Y-sAZaqfSEpHs0NeyFVMzO2sOa_I8J7E
X-Proofpoint-ORIG-GUID: Y-sAZaqfSEpHs0NeyFVMzO2sOa_I8J7E
Subject: Re: [virtio-comment] [PATCH requirements v4 1/7] net-features: Add
 requirements document for release 1.4


On Tuesday, 2023-08-15 at 09:11:18 UTC, Parav Pandit wrote:
>> From: David Edmondson <david.edmondson@oracle.com>
>> Sent: Tuesday, August 15, 2023 2:26 PM
>
>
>> > +4. If a virtio device is group member device, a group owner should be able
>> > +   to query all the counter attributes using the administration command
>> which
>> > +   a virtio member device will expose via a virtqueue to the driver.
>> 
>> The language seems confusing here. How about:
>> 
>> If a virtio device is a group member device, it must be possible to query all of
>> the group member counter attributes via the group owner device.
>> 
>> > +4. If a virtio device is a group member device, a group owner should be able
>> > +   to query all of the member device counter attributes and counters via the
>> > +   group owner device.
>> 
>> Similarly:
>> 
>> If a virtio device is a group member device, it must be possible to query all of
>> the group member counters via the group owner device.
>> 
> I messed up this point 4 while addressing your comments from v3.
>
> How about,
>
> If a virtio device is a group member device, it must be possible to query supported counters bitmap through the group owner device.
> The group owner driver should be able to query such bitmap using administration command.
>
> Notice that group owner only cares for the supported bitmap, no need to query the counters through this interface.

Why do we think this is the case? It would be useful for a group owner
to be able to see the statistics as they are being reported to the
member consumer.

> With this we can reuse single structure across AQ and CVQ to learn about supported bitmap in v14 patch from Xuan.

Makes sense.
-- 
I'm not living in the real world, no more, no more.

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

