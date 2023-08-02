Return-Path: <virtio-comment-return-6960-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A30C00528
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 10:00:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AA59061263
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 10:00:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 95E0998660F
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 10:00:13 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 867699865F7; Wed,  2 Aug 2023 10:00:13 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7411A9865F9;
	Wed,  2 Aug 2023 10:00:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1eI+kN4wJYq5vmNhMvT06eUrMt/DOM+KPOQidA+5p6gGyTqIp4n5JK2YKLxfrbnZo0+RLvLuRIKfL482r+UJIU1KzkXHEPRpcz1WguZsxKJ+m/grfSzscDOLcjC6gA+1rHaYt9ci19K2lRkVMVrJzA7gBoO45qp0LHk3hy8SWMQZR6HyzhrJwNN0++SKAJLs73vz3+0Y0iG/Vd3Xbw24mAeEUMRJCVr6jmznJOS2viy5JUDqc9ZYEiOsvMS5tbevgI4jdRvWgdlbexC7IQKkfj8eQUMtTSr8LcSCfbaEKdB1anDEuiCX4WiQVf+eV/D7VP3cn8o4b98ZC0sEnwADg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWFCru404ZWRoE+JItWzyU0rC/4VwPAVkWvV8aNsEg4=;
 b=Ryg7X6sSdDlNcnYucgEsPL4VIpHbOMEwm42Aj3WMJ1tgrqH326l/PUHHdvLKRP3XiFszktP27vwk+x/HDGoTj7xsMiTRaJrDvvW1NtLtE3SBMkZPCLTD0MVg9LqyUfOzo37VMCnVNN9YESfNzGDFCqokstwJ9jP8OFYtm4mY/PQcIvBMDZewj6KUVk0v9k2k+ck243skZv8Ept0liDUIlVLwiJYRPqA83WcSxQQ912wNOZicrPeDF3E/WyTH4hsOLHviO/ruRuW+x7lPB8Af8eiiEm+ac2qG7nDqTSUJyXkx8/Ea+Ve1qpjglavhg0jqKpJzINlpIBiUlnaXEHjcEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
	<mst@redhat.com>
CC: "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>
Thread-Topic: proposal: use admin command (and aq) of the device to query
 config space
Thread-Index: AdnERrUyzvIBkM4LRwukraLndwiuSgAseh0AAAlA/AAAAFJY4AABoP+AAACZwMA=
Date: Wed, 2 Aug 2023 10:00:09 +0000
Message-ID:
 <PH0PR12MB5481E0E5AFEEEAA10FDBEFDADC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB54818D33A150A01DACF3BF74DC0AA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230802000955-mutt-send-email-mst@kernel.org>
 <3b88c1fe-a5c8-7bc3-b30b-5babe741ffb9@intel.com>
 <PH0PR12MB54813732BE7EA68DC440D981DC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <ab1aec70-2016-dbdc-3707-c95b185dc1e6@intel.com>
In-Reply-To: <ab1aec70-2016-dbdc-3707-c95b185dc1e6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA1PR12MB7662:EE_
x-ms-office365-filtering-correlation-id: 59640358-ce3b-4fba-a06e-08db933f41d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 EDpf4ghLZpX/x3bt8g0JCdIHJk5mGpu1PQt2FiQkVV1kuzWSbcbqALl9h7r+e0CBS4PoG+g+daETh9Iqu4I3hGj+xRa6Al56rhAsufNpIULSr2pFd62hVV7JzeaWrXOUgth1GZY9qVtMOYpU1o10kpR73evxtq5fIjib0kD3zDBnAFgeUKTfY/0OQRqHBkV0NHc0ZOuUk28MSp+orb4Gu450LCVCEHx/CN1usRKF/60lurhG4B6Sm908O5fzRfAemNK8F4dgmBv/D8pStlcmVjmHedZEN6igAgRsu4GdgtlO6xxGVQvqWjvj8p+b4AbnNzNrKwNDDcbv6YzEwy0/NYavcd7QJHlqpOvcggT5LFJVAIOW7p8VxtzDKHHiQ89dnr5uS4Cv5iv6SaSv5imhDLGx0oiVS7lkjUoQVwUlGy23SzJ8ig87xaFlVG5YUKLK78rrCyHn4hjh7hz2Wwl4T618AIhh62wlryQSl4kkvWThM8dvQYouA2QjvZPlEEh6Nbl/557o07+0fStrrQRvWq+CnJUNqxDSmqQfcDelUTckx2k7E/0TzqYi3OZogcJfMKP/uRaVQcuu0KDeEu+tYCoUcSgms3NNhDU2VcmIHy7pRkXHU4DSKSjw5Y7+xOrm
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199021)(8676002)(5660300002)(83380400001)(122000001)(41300700001)(38100700002)(4744005)(316002)(186003)(8936002)(6506007)(26005)(38070700005)(4326008)(66446008)(86362001)(66946007)(64756008)(66556008)(66476007)(76116006)(9686003)(2906002)(7696005)(71200400001)(52536014)(33656002)(478600001)(110136005)(54906003)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K1VtajFXTEViQWxFaktRZjIyeDNUVkZ0MWludnVVem85Y0NaNVRiRWQ5TE53?=
 =?utf-8?B?M1NaWlAxN0tjaExiZlZ1VlVPVVYzLy9TT2psTmlWMG9YcHBDZ2lBQlJmL29M?=
 =?utf-8?B?RCtyeHVPaEhnRms4YUlpdDRoY1Y1UGRseHFuZEdHc3lNVHZaTVRFa0FKeDVk?=
 =?utf-8?B?MkUxeXk1ZHdsRHoxWEdUNkZFL3IyYzU5UXFRNzZyNXhuMkNjbHpqVktCWFY1?=
 =?utf-8?B?ODd1SW0wU3EyeVJnK05KbjdGRGYxamJVdkdxMDJnQ3pjSmNPSHNrTnE4Zklh?=
 =?utf-8?B?b3BpTEpoQU5pOElGT2lmZGU0aFBSMEJqendValdhUVRrYmdQKzlQc1ptMHlm?=
 =?utf-8?B?WXBzdXp2R3hPYjRCZUVIckUxdmNoSDNlWHlsdDBZa0RldmVtbEhQVjRJRmlJ?=
 =?utf-8?B?VHlNbEViTTFFQUIwbjljUmdYZUpaVStzYUxzMUI2c2h2OCs0OHdJaU5PMjBJ?=
 =?utf-8?B?eXBlR2REME1yT3JVeEozRHd4Nnd1UjBndUNIV2dsbUdYNWZUb3UybFhYbDdJ?=
 =?utf-8?B?dEs5RllBczNTMUEvVVRUU1NqUmNxTlRwSGVTa3F4SytkMWNPcG5OTW9FdlRu?=
 =?utf-8?B?WlNnYk1INjg0dFY3MHRMWXFra3B4OUIzdWZYd1YxUDYrYXdvNUpsN0tzTWx5?=
 =?utf-8?B?MlM0M08wVFF1ZEo2d1MrZXdTRFluRXFYeUN3Y096SE9SV1FSWFQzUG9lalNN?=
 =?utf-8?B?THBiaVpmUGhOUDRSYzVCUHRZN0R3dGpPbFpoOWRsZUowT05HQnZKN28zL0Vy?=
 =?utf-8?B?WTRWVWNxSWgvUnpuOTA4VThtSnoyU2NiaklRQVFYVmlkeFdYdVlmR3JHalB4?=
 =?utf-8?B?T0VRYmQzOURoeXhqTWo4U0N3cVgxblZFVitSQmJtTjhaQ2xpanlWaGN6cS9O?=
 =?utf-8?B?cFJoNDhmR1BUWnlCeGlxTFh0ZGtuZk9hanNNS0dVdThzS0NSM1NpTE9XdCtX?=
 =?utf-8?B?Rng0VG5nYjN3L056YnJlQ0ErYzl6WnBWZCt0RnB4Z1c4N2FTTHY5OGdMeS9M?=
 =?utf-8?B?VlNrYzBYcWdpazJSaFNQOTl1YlRMN3AxbllOdHVVYzhld0ppd2ZUQnRIdGNm?=
 =?utf-8?B?RGFiNDlqUDhSNjN4NVFpUU1jMTNQUDNVOEVjZm5JNE1ZeDFId0VYdld6ZVdi?=
 =?utf-8?B?RHk3Q3FZd0EzbDBGelNxM0duWkIwNHgzREh0TzhKQzZQQWs4YmFiY1NLKzRp?=
 =?utf-8?B?b3JnOUZWQUJlRkZMMWQrQ0NtNWdhSVFVK0dnVXM1em1BV1ZFMmpaU09xTXdI?=
 =?utf-8?B?T2tJSmtPZE5sQ3dEQUs0YTc3V0RpdkdVbUlUQmVLa2w0a3c3aDNsWjlHcUIx?=
 =?utf-8?B?YjVEcE92T3h4Zi9BcVp1cGZ5OEpIRWZmVVVKSlFmRU4yWjhoeHBSYStQbEsw?=
 =?utf-8?B?dnIrU2ZjR1VqT0pPUkRZemZOMmhxbnhkZG1ZVFBwQ3ppMVkwK2dnc2NpOUZa?=
 =?utf-8?B?d3JNOU9iYlJmTUJudWNuVm9iZ1dnSVY5V25jV2xUY1J6UFVjTGtVeEpZditu?=
 =?utf-8?B?aXdCYitkR2w5SHd0VHZFRm1UaUt4ZkZ2MngvdDFnTGZEZVJEd1IwYWRFN0Fj?=
 =?utf-8?B?akN5NFBRMFJTTE9hbUJTVnk4eHNUS2dsd1VyMVVnNHRDOXBhYzhjWDYrUm5w?=
 =?utf-8?B?QnF0NXBBVUMrdlZNNkFFVkhUNUp4R2dxOEdHdFhIdFpYcWZ2eUVRUDZSanlk?=
 =?utf-8?B?MWdoQU93cFovdzlVbnRmbTNLY2VXeEUybk9PWUdkcHg0L1V3bXlLZ2pCd2VQ?=
 =?utf-8?B?UG5GcWhGOVpzK3d4OWJSeUwxRGRpRUs2elVObzRoYVZyK25PekFDdDcrREVS?=
 =?utf-8?B?dVZ2U1pVU3RqR0pseUdVTC9yMVltMnIyMGt2MEw4TGJZT1NJN2Ivb3JzbW0y?=
 =?utf-8?B?MmZRdk9zNGl5YjRvQVRycGt0b0xMMkpvOWwwL05Zcm41cVNEOEJUOGZ2ejcx?=
 =?utf-8?B?d0VYSm9IVmhYekphU3pEaWxDYlNIV3krbHVlNkhUdzBIQ1NDUmtNeUxlTTBJ?=
 =?utf-8?B?ZnBScjFwc2RrQUQ3UUV5cTAzYzZKVldnd2tTVlJweFQxQlpobHVDUlFMTEVO?=
 =?utf-8?B?K3B0aG5vcUJ2UXJLK3FkZzdVNGx6UzNDVXo3bGw0UktYR1VKemRSYzcwTEdt?=
 =?utf-8?Q?HfKw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59640358-ce3b-4fba-a06e-08db933f41d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 10:00:09.9633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QfuFN0cIi+ZlZuJkJ3WFUWKURJojWCflD1ZH9aJjZN4X/u2FIz8l+3AI3V/PdwNjNmVXkEnhN1KYwG2iwee5/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7662
Subject: [virtio-comment] RE: proposal: use admin command (and aq) of the device to query
 config space

DQoNCj4gRnJvbTogWmh1LCBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNvbT4NCj4gU2Vu
dDogV2VkbmVzZGF5LCBBdWd1c3QgMiwgMjAyMyAzOjExIFBNDQoNCj4gPiBHZXQgYW5kIHNldCBi
b3RoIHNob3VsZCBiZSBpbmJhbmQgZm9yIFBGLCBWRiwgU0lPVi4NCj4gPiBJIGRvbuKAmXQgc2Vl
IGFueSBuZWVkIHRvIGRpdmVyZ2UgYW5kIGNyZWF0ZSBhbnkgd2VpcmQgY29tYmluYXRpb25zIGRp
ZmZlcmVudGx5DQo+IGZvciAzIGRpZmZlcmVudCBkZXZpY2UgdHlwZXMuDQo+IEkgYW0gbm90IHN1
cmUsIHdoZW4gcGFzc3Rocm91Z2ggYSBkZXZpY2UgdG8gYSBndWVzdCwgdGhlIGd1ZXN0IGRyaXZl
ciBvd25lcyB0aGUNCj4gY29uZmlnIHNwYWNlIG9mIHRoZSBkZXZpY2UsIGlmIHdlIGFsbG93IGNo
YW5nZXMgYWdhaW5zdCB0aGUgY29uZmlnIHNwYWNlIHRocm91Z2gNCj4gYWRtaW4gdnEgZnJvbSBo
b3N0LCBpdCBsb29rcyBsaWtlIGEgcmlzay4NCg0KSSBzYWlkIHRoZSBvcHBvc2l0ZSBhYm92ZSwg
Z2V0IGFuZCBzZXQgaXMgSU5CQU5EIGZyb20gZ3Vlc3QgZHJpdmVyIHRvIGRldmljZSBmb3IgUEYs
IFZGIGFuZCBTSU9WIHRocm91Z2ggaXRzIG93biBkZWxlZ2F0ZWQgcmVzb3VyY2UuDQpUaGVyZSBp
cyBubyBBUSBtZWRpYXRpb24gZnJvbSBob3N0Lg0KSGVuY2UsIHRoZXJlIGlzIG5vIHJpc2suDQo=

